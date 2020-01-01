.. title: Python, Django, Django CMS!
.. slug: python-django-django-cms
.. date: 2010-09-16 21:12:00 UTC+02:00
.. tags: python, django, django-cms
.. type: text

Jau senai svajojau išsilaisvinti iš PHP priklausomybės ir susirasti normalų
Python programuotojo darbą. Galiausiai apsisprendžiau ir tai padariau – išėjau
iš darbo, kuriame dirbau su PHP ir visą laiką skyriau Python programuotojo
darbo paieškoms. Susitikus su visais penkiais Vilniuje, Python darbą
siūlančiais įmonių vadovais, įsidarbinti pavyko tik penktojo susitikimo metu.

Tiek istorijos. Dabar apie tai, ką nuveikiau gero per pirmą darbo savaitę.

Django CMS
==========

Naujame darbe daugiausiai programuojame naudojant `Django karkasą
<http://www.djangoproject.com/>`_. Pats Django yra gan plikas, todėl jei
svetainė nėra labai išskirtinė, geriau darbą pradėti su `Django CMS
<http://www.django-cms.org/>`_.

`Django CMS <http://www.django-cms.org/>`_ yra tas pats Django, tik su
įrankiais skirtais turinio valdymui. Plikas Django nėra jau toks plikas, nes
turi automatizuotą administravimo sąsają. Django CMS dviračio neišradinėja ir
esamą Django funkcionalumą praplečia elementais skirtais svetainės turiniui
valdyti.

Trumpai apie Django CMS funkcijas:

- Svetainės front-end dalies administravimas

- Media duomenų (paveiksliukai, dokumentai, video medžiaga) administravimas ir
  galimybė pateikti svetainėje.

- Keičiamo svetainės turinio versijavimas

- Naudotojų ir jų teisių valdymas

- SEO optimizacija

- Kelių skirtingų svetainių palaikymas naudojant tą pačią administravimo
  sąsają.

- Ir galiausiai įskiepių ir kitokių įterpiamų programinių dalių galimybės, kas
  daro Django CMS labai lankstų ir puikiausiai suderinamu su Django.

Šios funkcijos yra tai, kas pateikiama kartu su Django CMS ir veikia out of the
box. Gan solidus pagrindas paprastai svetainei, bet daugelio dalykų dar
trūksta, tokių kaip naujienų, komentarų, galerijų, kategorijų ir pan. Šių
dalykų nėra out of the box, tačiau jie pateikiami įskiepių ar modulių pavidalu.
Viskas, būtų kaip ir gerai, bet kadangi Django CMS yra gan naujas dalykas, tai
viso to trečiųjų šalių gėrio nėra labai gausu, o tai kas yra, integruojama ne
visada sklandžiai.

Django CMS diegimas
===================

Django CMS diegimas nuo nulio nėra labai paprastas uždavinys. Reikia atlikti
gan nemažai rankinio darbo, yra nemažai vietų kur galima suklysti ir vėliau
ilgai aiškintis, kas blogai.

Kad viso to išvengti, darbe parašiau paleidimo skriptą, kurio dėka diegimas
supaprastėjo iki kelių komandų. Skriptą rasite čia:

    `http://bitbucket.org/sirex/django\_cms\_template <http://bitbucket.org/sirex/django_cms_template>`_

Django CMS diegimo instrukcija, naudojantis šiuo skriptu pateikiu žemiau.

::

    sudo apt-get install python-dev python-setuptools subversion
    sudo python-pip virtualenv mercurial
    virtualenv --no-site-packages sandbox
    cd sandbox
    ./bin/pip install -e hg+http://bitbucket.org/sirex/django_cms_template#egg=django_cms_template
    ./bin/paster create -t django_cms_21 myapp
    cd myapp
    make
    make run

Kai šios komandos atliks savo darbą, Django CMS pasileisite adresu:

    `http://localhost:8000/ <http://localhost:8000/>`_

Django CMS turi vidinį serverį, naudoja vidinę Sqlite3 duomenų bazę, todėl
absoliučiai nieko papildomo įdieginėti nereikės.

