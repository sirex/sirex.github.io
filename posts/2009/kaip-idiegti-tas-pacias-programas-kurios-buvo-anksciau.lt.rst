.. title: Kaip į diegti tas pačias programas, kurios buvo anksčiau?
.. slug: kaip-idiegti-tas-pacias-programas-kurios-buvo-anksciau
.. date: 2009-06-03 09:27:00 UTC+02:00
.. tags: floss, linux, shell
.. type: text

.. default-role:: literal

Tikriausiai žinote, kad labai patogu laikyti `/` ir `/home` katalogus
atskiruose skirsniuose, kad vėliau iš naujo įdiegus Linux sistemą, viskas
išliktų kaip buvę.

Dažniausiai visi naudotojo duomenys laikomi namų (/home) kataloge.  Tačiau,
dažnai būna daug programų, kurias įdiegėte ir norėtumėte vėl turėti tą patį.

Susigrąžinti visas anksčiau įdiegtas programas labai paprasta, reikia vos kelių
komandų.

Šios instrukcijos tinka visoms Linux distribucijoms, kurios naudoja apt-get
paketų sistemą. Tačiau analogiškai galima daryti ir su kitomis
distribucijomis...

Prieš diegdami Linux, pasidarykite įdiegtų paketų sąrašą ir išsaugokite jį į
failą dpkg-list.old. Šį failą išsisaugokite, kad vėliau galėtumėte atstatyti
visas įdiegtas programas.

::

    $ dpkg -l | awk '/^ii/ { print $2 }' > dpkg-list.old

Šviežiai įdiegus Linux, susiraskite iš anksto padarytą dpkg-list.old failą ir
įveskite šias dvi komandas, kurių dėka, bus iš karto įdiegta tai, ką turėjote
anksčiau.

::

    $ dpkg -l | awk '/^ii/ { print $2 }' > dpkg-list.new
    $ diff dpkg-list.old dpkg-list.new | awk '/^

*Pastaba:* nepamirškite išsisaugoti ir ``/etc/apt/sources.list`` failo, nes kai
kurios programos gali būti įdiegtos iš saugyklų, kurių po įdiegimo, pagal
nutylėjimą nebus šiame faile.

Papildymas: Galimos problemos ir jų sprendimai
==============================================

Praktiškai išbandžius aukščiau aprašytas komandas susidūriau su šiokiais
tokiais sunkumais.

*Kadangi pas mane buvo labai didelis paketų skaičius įdiegimui, tai neaišku dėl
kokių priežasčių, toje vietoje kur klausiama ar tikrai norite įdiegti šiuos
paketus, apt-get nutraukdavo darbą.*

*Sprendimas:* apt-get komandai reikia perduoti -y

::

    $ diff dpkg-list.old dpkg-list.new | awk '/^

*Kadangi kai kuriuos paketus buvau įdiegęs ne iš repozitorijų, tai žinoma, jų
neradus, apt-get nutraukia darbą ir praneša, kad toks ir toks paketas
nerastas.*

*Sprendimas:* tokiu atveju geriau išsisaugoti paketų sąrašą diegimui atskirai
ir tiesiog iš to failo ištrinti tuos trūkstamus paketus::

    $ diff dpkg-list.old dpkg-list.new | awk '/^ dpkg-missing
    $ gedit dpkg-missing
    $ cat dpkg-missing | xargs sudo apt-get install -y

*Diegiant MySQL Server, atsidarė slaptažodžio įvedimo langas ir dėl kažkokių
priežasčių, nieko negalėjau įvesti, teko nutraukti diegimą su Ctrl+C. Po tokio
nutraukimo toliau diegimo negalėjau tęsti, dėl to, kad paketų sistema liko
užsirakinusi.*

*Sprendimas:* reikia perkrauti kompiuterį (gal būt yra ir paprastesnis būdas?)
ir tęsti toliau tokiomis komandomis::

    $ sudo apt-get install -f
    $ sudo dpkg --configure -a
    $ cat dpkg-missing | xargs sudo apt-get install -y

