.. title: Automatinis laiškų persiuntimas į Trac
.. slug: automatinis-laisku-persiuntimas-i-trac
.. date: 2009-01-18 02:29:00 UTC+02:00
.. tags: python, archlinux, trac
.. type: text

Pradėjęs naudoti Archlinux taip pat radau ir naują įrankį laiškų parsiuntimui:
fdm. Jis man pasirodė kur kas paprastesnis, nei fetchmail ir net gi turintis
daugiau reikalingų funkcijų. Dėl tam tikrų funkcijų atsisakiau ir procmail, nes
fdm gali puikiausiai atlikti ir procmail funkciją... :)

Kitas dalykas, jei dirbate su kokiais nors projektais, tai tikriausiai gaunate
daug laiškų, kuriuos perskirstote ir talpinate į kokią nors Web pagrindu
veikiančią projektų ar užduočių valdymo sistemą. Na, bent jau aš dirbu panašiai
taip, kaip apibūdinau ir visai nesenai, mano kolega paklausė, ar įmanoma, kaip
nors tuos laiškus persiųsti tiesiai į užduočių valdymo sistemą, kad ji iš to
laiško sukurtų naują užduoti.  Pagalvojau, kad tai tikrai puiki mintis. Tačiau
paieškojęs internete neradau jokių panašių realizacijų, `Trac
<http://trac.edgewall.org/>`_ sistemai, kurią naudojuosi.

Bet, pasirodo, kad tokį dalyką padaryti, įtraukiant į darbą fdm ir šiek tiek
Python kodo, yra visiškai nesudėtinga.

Štai ką aš dariau, kad atsirastų galimybė persiųsti laišką tiesiai į Trac
sistemą, kaip naują užduotį.

Testinės Trac aplinkos diegimas.
--------------------------------

Kadangi nenorėjau žaisti su veikiančiai sistemą, susikūriau atskirą aplinką
testavimams:

1. Įdiegiau Python paketų valdymo įrankį ``easy_install`` į Archlinuxą::

    sudo pacman -S setuptools

2. Įdiegiau Python virtualios aplinkos kūrimo įrankį::

    sudo easy_install virtualenv

3. Susikūriau virtualią aplinką Trac programai::

    cd ~/www/sandbox
    virtualenv trac

4. Aktyvavau virtualią aplinką esamame shelle::
   
    cd trac
    source bin/activate

5. Įdiegiau Trac į virtualią aplinką::
   
    easy_install trac

6. Susikūriau testinį Trac instancą::
   
    trac-admin test initenv
    trac-admin test permission add anonymous TRAC_ADMIN

7. Paleidau Trac sistemą::
   
    tracd --port 8000 test

8. Atsidariau paleistą Trac interneto naršyklėje::

    firefox http://localhost:8000/test

fdm konfigūravimas
------------------

Sekantis žingsnis fdm konfigūravimas ir štai, kaip turėtu atrodyti failo
``~/.fdm.conf`` turinys::

    action "newticket" pipe "%h/www/sandbox/trac/mailpipe.py"
    account "stdin" disabled
    stdin match "(To|Cc):.*trac@localhost" action "newticket"``

Pagal šią konfigūraciją, fdm, visus laiškus su trac@localhost perduos Python
scriptui, kuris sukurs naują ticketą Track užduočių sistemoje.

Python skriptas naujų užduočių kūrimui
--------------------------------------

Tai sunkiausia dalis, nes Trac sistema, apsaugai nuo spamo naudoja visokius
parametrus, todėl reikia iš pradžių nuskaityti naujo užduoties įvedimo formą,
kurios užkrovimo metu sukuriama sesija ir tam tikri sausainiukai. Tada iš tos
formos reikia pasiimti specialų kintamąjį, kuris nurodo, kad formos duomenys
buvo išsiūsti iš ten kur reikia. Ir galiausiai reikia išsiūsti reikiamus
duomenis, kad būti sukurta nauja užduotis.

Šioje vietoje nedariau jokios naudotojų autentifikacijos, bet tai nesunku
prijungti, esant poreikiui.

Jei kam įdomu, tai aiškindamasis ką reikia perduoti Trac sistemai, panaudojau
puikų Web debuginimo proxį burpsuite. Archlinux sistemoje jį galima įsidiegti
iš nuostabiojo AUR::

    yaourt -S burpsuite

Štai Python scriptas, kuris daro visą darbą (atkreipkite dėmesį, kad šis
skriptas parašytas Python 3.0 versijai, todėl su senesne neveiks):

.. code-block:: python

    #!/usr/bin/env python3
    """This is pipe script for fdm.
    """
     
    import sys
    import email
    import urllib.parse
    import urllib.request
    import http.cookiejar
    from html.parser import HTMLParser
     
    class InputFieldsParser(HTMLParser):
        """Parse all input fields from given html string.
        """
        fields = {}
         
        def handle_starttag(self, tag, attrs):
            if tag == 'input':
                attrs = dict(attrs)
                if 'name' in attrs and 'value' in attrs:
                    self.fields[attrs['name']] = attrs['value']
     
    def get_html_fields(html):
        """Returns all input fields from given html string.
        """
        parser = InputFieldsParser()
        parser.feed(html)
        parser.close()
        return parser.fields
     
    def get_url_opener():
        """Returns urllib OpenerDirector for sending correct request...
         
        This openner acts like a web browser with Mozilla user agent and cookies
        support.
        """
        cj = http.cookiejar.CookieJar()
        cookie_processor = urllib.request.HTTPCookieProcessor(cj)
        opener = urllib.request.build_opener(cookie_processor)
        opener.addheaders = [('User-agent', 'Mozilla/5.0')]
        return opener
     
    def submit_to_trac(title, body):
        """Function to submit new ticket to Trac system.
        """
        params = {
            'author': 'anonymous',
            'field_summary': title,
            'field_reporter': 'anonymous',
            'field_description': body,
            'field_type': 'defect',
            'field_priority': 'major',
            'field_milestone': '',
            'field_component': 'component1',
            'field_version': '',
            'field_keywords': '',
            'field_cc': '',
            'field_owner': '',
            'field_status': 'new',
            'submit': 'Create+ticket',
        }
     
        opener = get_url_opener()
        url = 'http://localhost:8000/test/newticket'
        fields = get_html_fields(str(opener.open(url).read()))
        params['__FORM_TOKEN'] = fields['__FORM_TOKEN']
        params = urllib.parse.urlencode(params)
        f = opener.open("http://localhost:8000/test/newticket", params)
        f.read()
     
     
    def submit(title, body):
        """Does all submission job to a web page form.
        """
         
        # Create new functions and change this line,
        # for support to other systems.
        submit_to_trac(title, body)
     
     
    def get_message_body(msg):
        """Returns email message body.
         
        Only text/plain message parts are supported.
        """
        for part in msg.walk():
            if part.get_content_type() == 'text/plain':
                return part.get_payload()
         
        return ''
     
     
    def main():
        """The main function of this script.
        """
        msg = email.message_from_file(sys.stdin)
        title = msg.get('subject')
        body = get_message_body(msg)
        submit(title, body)
     
     
    if __name__ == '__main__':
        main()

Testavimas
----------

Galiausiai viską sujungus į vieną vietą galima pradėti testuoti. Kad nereikėtų
siuntinėti laiškų į kažkokius serverius, tai tam reikalui paprasčiausiai
susikūriau laišką ir išsaugojau jį į failą. Štai laiško turinys::

    From: sirex@localhost
    To: trac@localhost
    Subject: Testinė užduotis.

    Testinė užduotis Trac sistemai.

O štai komanda, kurios pagalba laiškas perduodamas fdm programai, kuri
patikrina laiško headerius, pritaiko reikiamą veiksmą ir perduodą Python
scriptui, kuris paverčia laiško turinį į naują Trac užduotį::

    cat newmail | fdm -vma stdin fetch

Pabaigai
--------

Jei visi testavimai praeina sėkmingai, tai belieka susikurti pašto dėžutę į
kurią sunčiami laiškai, automatiškai bus paverčiami Trac sistemos užduotimis.
Žinoma reikės atitinkamai pakeisti fdm konfigūraciją, kad laiškai būtų imami ne
iš stdin, o iš naujai susikurtos pašto dėžutės.

