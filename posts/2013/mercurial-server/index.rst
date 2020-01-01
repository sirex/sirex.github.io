.. title: Mercurial server konfigūravimas
.. slug: mercurial-server
.. date: 2013-04-17 18:03:00 UTC+02:00
.. tags: mercurial
.. type: text

Instrukcija apie tai kaip įsidiegti mercurial-server_ į savo serverį. Kartu
pateikiu ir keletą patarimų, kaip organizuoti darbą naudojant mercurial_
versijų kontrolės sistemą.

Kas yra mercurial-server?
=========================

mercurial-server_ yra nedidelis skriptų rinkinys, padedantis organizuoti darbą
su mercurial_ repozitorijomis viename serveryje, per vieną ``hg`` naudotoją.
Naudojamas SSH protokolas, o repozitorijų naudotojai identifikuojami SSH raktų
pagalba.

Įdiegus mercurial-server_, serveryje nepaleidžiami jokie nauji demonai, kadangi
visa komunikacija vyksta per ``sshd`` demoną.

mercurial-server_ suteikia galimybę paprastai kurti naujus naudotojus, tiesiog
pridedant jų SSH raktą, yra galimybė valdyti naudotojų teises. Labai paprasta
kurti naujas repozitorijas.

Prieš pradedant
===============

Čia pateikta informacija praktiškai išbandyta su Ubuntu_ 12.04 distribucija.
Instrukcija ko gero galios ir visoms kitoms Debian_ pagrindu sukurtoms
`GNU/Linux`_ distribucijoms.

Visos instrukcijos žemiau, bus naudojami tokie vardai:

``vardenis``
    Jūsų naudotojo vardas.

``skreitinukas``
    Jūsų kompiuterio vardas (angl. *hostname*).

``serveris``
    Serverio vardas (angl. *hostname*).

Diegimas
========

mercurial-server_ galima įsidiegti iš paketų repozitorijos::

    sudo apt-get install mercurial-server

SSH raktai
==========

mercurial-server_ veikia saugaus SSH protokolo ir SSH raktų pagalba. Todėl
būtina susikurti SSH raktą, jei jo dar neturite::

    ssh-keygen -C vardenis@skreitinukas

mercurial-server pirmojo naudotojo kūrimas
==========================================

Prieš pradedant bet kokį mercurial-server_ konfigūravimą, būtina susikurti
pirmąjį administratoriaus naudotoją, kuris galės keisti mercurial-server_
konfigūraciją ir suteikti prieigą prie repozitorijų, kitiems naudotojams.

Tam jums reikės įkelti savo viešąjį SSH raktą, į serverį ir paleisti
``refresh-auth`` komandą::

    scp ~/.ssh/id_rsa.pub vardenis@serveris:
    ssh vardenis@serveris
    sudo mkdir -p /etc/mercurial-server/keys/root/vardenis
    sudo cp id_rsa.pub /etc/mercurial-server/keys/root/vardenis/skreitinukas
    sudo -u hg /usr/share/mercurial-server/refresh-auth
    rm id_rsa.pub

Po šių komandų, bus sukurtas pirmasis naudotojas, kuris jau gali pilnai
naudotis visomis funkcijomis.

Naudotojų kūrimas ir valdymas
=============================

Jei norite, kad prie repozitorijų priėjimą turėtų daugiau nei vienas
naudotojas, tuomet, galite susikurti daugiau naudotojų, įkeldami kiekvieno iš
jų SSH viešąjį raktą, tokiu būdu::

    hg clone ssh://hg@serveris/hgadmin
    cd hgadmin
    mkdir -p keys/users/jonas
    cp ~/jono-raktas.pub keys/users/jonas/jonoskreitinukas
    hg add
    hg commit -m "Įkeltas Jono raktas."
    hg push

Komandos aukščiau turi būti vykdomos ``vardenis`` naudotojo kompiuteryje, o ne
serveryje. ``~/jono-raktas.pub`` yra kito naudotojo raktas. Jei naudotojai
raktą siunčia el. paštu, įsitikinkite, kad raktas nesulaužytas į kelias
eilutes, visas SSH raktas, turi būti viena eilutė.

Įvykdžius paskutinę komandą ``hg push``, serveryje, mercurial-server_
automatiškai paleist ``/usr/share/mercurial-server/refresh-auth`` skriptą ir
atnaujins konfigūraciją.

Atkreipkite dėmesio, kad administratoriaus raktas buvo įkeltas į ``keys/root``
katalogą, o paprasto naudotojo į ``keys/users``. Priklausomai nuo to, į kokį
katalogą įkeltas naudotojo raktas, tokios teisės jam ir bus suteiktos. Pagal
nutylėjimą, yra sukurtos dvi naudotojų grupės, ``root`` ir ``users``. ``users``
naudotojai, neturi priėjimo prie ``hgadmin`` repozitorijos, todėl neturi
galimybės kurti naujus naudotojus, ar keisti konfigūraciją.

mercurial-server konfigūravimas
===============================

Kaip jau pastebėjote, mercurial-server_ konfigūraciniai failai laikomi dviejose
vietose, serveryje, ``/etc/mercurial-server`` kataloge ir ``hgadmin``
repozitorijoje. Rekomenduoju visą konfigūraciją laikyti versijuojamoje
``hgadmin`` repozitorijoje.

Naudotojų teisių valdymas
=========================

Naudotojų teisės valdomos per ``access.conf`` konfigūracijos failą, esantį
``hgadmin`` repozitorijoje. Pagal nutylėjimą, šis failas, serveryje
(``/etc/mercurial-server/access.conf``) atrodo taip::

    init user=root/**
    deny repo=hgadmin
    write user=users/**

Galite susikurti naują ``access.conf`` failą ``hgadmin`` repozitorijoje ir
apsirašyti naujus nustatymus, kurie įsigalios po ``hg push`` (įkėlimo į
serverį) komandos.

Viena konfigūracijos failo eilutė susideda iš tokių dalių::

    <leidimas> <taisyklė 1> <taisyklė 2> <taisyklė N> ...

Leidimai gali būti tokie:

``init``
    Leisti kurti naują, rašyti į ir skaityti repozitorijas aprašytas taisyklėse
    nurodytiems naudotojams.

``write``
    Leisti rašyti ir rašyti į ir skaityti.

``read``
    Leisti tik skaityti.

``deny``
    Drausti priėjimą prie repozitorijos.

Plačiau apie tai galite pasiskaityti `mercurial-server dokumentacijoje
<http://dev.lshift.net/paul/mercurial-server/docbook.html>`_.

Repozitorijų kūrimas
====================

Repozitorijos serveryje kuriamos labai paprastai, jei turite ``init`` teisę,
tada naują repozitoriją serveryje sukursite taip::

    hg clone lokali/repozitorija ssh://hg@serveris/nauja-repozitorija

Po šios komandos, serveryje bus sukurta nauja repozitorija pavadinimu
``nauja-repozitorija`` ir į ją bus perkeltas visas ``lokali/repozitorija``
turinys. Lokalią repozitoriją galite susikurti taip::

    hg init lokali/repozitorija

Iš serverio, į savo kompiuterį bet kurią repozitoriją, prie kurios turite
priėjimą, atsisiūsite taip::

    hg clone ssh://hg@serveris/nauja-repozitorija

Darbo organizavimas
===================

Yra daugybė būdų, kaip galima organizuoti darbus, naudojant versijų kontrolės
sistemas. Pateiksiu kelis patarimus, kuriuos esu išbandęs praktiškai.

Visų pirmą, turite suprasti, kad mercurial_ turi tris šakų tipus:

* `klonuotos šakos`_ (angl. *cloned branches*) 

* `pavadintos šakos`_ (angl. *named branches*)

* `paprastos šakos`_ (angl. *branches*)

Klonuotos šakos
---------------

Klonuotos šakos yra visiškai atskiros repozitorijos, sukurtos kitos
repozitorijos pagrindu, toks repozitorijų šakų kūrimas angliškai dažnai
vadinamas *forking*.

Klonuotos šakos yra saugios nuo bet kokių repozitorijos sugadinimų, todėl, kad
visa istorija vedama atskiroje repozitorijoje. Žinoma, esant reikalui,
klonuotas šakas galima sulieti į vieną.

Rekomenduoju šio tipo šakas naudoti kuriant naujas funkcijas, eksperimentams ir
pan. Be to, naudinga, turėti atskirą klonuotą šaką produkto (angl.
*production*) kodui, kurioje visą laiką yra tik tie pakeitimai, kurie įkelti į
veikiantį produkto serverį.

Kadangi naudinga turėti daug klonuotų šakų, todėl serveryje, repozitorijas
reikia organizuoti taip::

    ssh://hg@serveris/projektas
    ssh://hg@serveris/projektas/production
    ssh://hg@serveris/projektas/funkcija-x
    ssh://hg@serveris/projektas/funkcija-y
    ssh://hg@serveris/projektas/vardenis
    ssh://hg@serveris/projektas/vardenis/funkcija-x
    ssh://hg@serveris/projektas/jonas

Šiame pavyzdyje, pagrindinė repozitorija yra ``ssh://hg@serveris/projektas``,
šioje klonuotoje šakoje turėtų būti saugoma naujausią veikianti versija,
Subversion_ terminais kalbant, tai vadinama ``trunk``, git_ terminais
``master``.

Taip pat yra produkto šaka ``projektas/production``, kurioje turėtų būti
laikomi tokie patys pakeitimai, kurie yra produkcinėje versijoje.

Kitos šakos ``projektas/funkcija-x``, ``projektas/funkcija-y`` yra skirtos
ilgiau vystomoms funkcijoms. Taip pat, kiekvienas naudotojas gali turėti po
savo klonuotą šaką, kuri gali saugoti nebaigtus pakeitimus.

Klonuotą šaką sukursite taip::

    hg clone . ssh://hg@serveris/projektas/funkcija-x

Kad būtų paprasčiau dirbti su klonuotomis šakomis siūlau naudoti kelio
trumpinius, kuriuos galite apsirašyti repozitorijos ``.hg/hgrc`` faile:

.. code-block:: cfg

    [paths]
    default = ssh://hg@serveris/projektas
    production = ssh://hg@serveris/projektas/production
    funkcija-x = ssh://hg@serveris/projektas/funkcija-x
    funkcija-y = ssh://hg@serveris/projektas/funkcija-y
    vardenis = ssh://hg@serveris/projektas/vardenis
    jonas = ssh://hg@serveris/projektas/jonas

Turin tokius aprašus, galite naudoti trumpuosius vardus (``default`` turi
ypatingą prasmę ir šis kelias naudojamas tada, kai nenurodote nieko)::

    hg push
    hg push production
    hg push funkcija-x
    hg pull jonas

Taip pat galite naudoti Schemes_ išplėtimą, kurį įjungsite savo ``~/.hgrc``
faile taip:

.. code-block:: cfg

    [extensions]
    hgext.schemes=

    [schemes]
    p = ssh://hg@serveris/projektas

Tada dirbti galite taip::

    hg push p://production
    hg push p://funkcija-x
    hg pull p://jonas
    
Atkreipkite dėmesį, kad dirbant su klonuotomis šakomis, rekomenduojama savo
kompiuteryje, taip pat turėti panašią katalogų struktūrą, su keliomis to pačio
projekto kopijomis, skirtinguose kataloguose. Pavyzdžiui:

    Dirbate prie ``default`` šakos ir staiga atsiranda poreikis, pataisyti
    klaidą ``production`` šakoje. Tada tiesiog keičiate aktyvų katalogą
    ``../production``, ten pataisote klaidą, išsaugote pakeitimus ``hg commit``
    ir įkeliate pakeitimus į serveryje esančią repozitoriją ``hg push
    production``. Galiausiai, grįžtate atgal prie savo darbo ``../projektas``,
    ten baigiate pakeitimus, juos išsaugote ``hg commit`` ir pasiimate klaidos
    pataisymą iš kitos šakos ``hg pull production``.

Pavadintos šakos
----------------

Pavadintos šakos yra vidinės repozitorijos šakos, kurios turi pavadinimą. Šio
tipo šakos įeina į repozitorijos istoriją ir jų negalima ištrinti (t.y.
negalima ištrinti paprastai).

Siūlau šio tipo šakas naudoti pagrindinėms versijoms žymėti. Pavyzdžiu,
tarkime, kad jūsų projektas, turi dvi pagrindines ir palaikomas versijas,
``1.1`` ir ``1.2``, tuomet, galite susikurti dvi pavadintas šakas::

    hg branch 1.1
    hg ci -m "Nauja šaka versijai 1.1."

    hg branch 1.2
    hg ci -m "Nauja šaka versijai 1.2."

Pereiti prie kitos pavadintos šakos galite taip::

    hg update 1.1

Pasitikrinti, kuri šaka yra aktyvi šiuo metu galite taip::

    hg branch

Pavadintos šakos turi tokią savybę, kad joje galite atlikti naujus pakeitimus
ir ji visą laiką rodys į naujausią pakeitimą. Versijuojant, stambioms versijoms
tokia savybė labai tinka. Išleidžiant naujas galutines versijas, kuriose jau
nebegali būti daromi jokie pakeitimai, galima naudoti žymes, o pavadinta šaka,
``1.2`` visą laiką rodys į naujausią galutinę versiją.

Paprastos šakos
---------------

Paprastos šakos yra vidinės šakos ir jos susikuria automatiškai, kiekvieną
kartą, kai reikia. Pavyzdžiui:

    Naudotojas A padarė pakeitimą x, lygiai tuo pat metu naudotojas B padarė
    pakeitimą y. Naudotojas A, pirmesnis įkėlė savo pakeitimą į serverį, todėl
    naudotojui B iššoko pranešimas, kad serveryje yra naujų pakeitimų, kurių
    jis neturi. Tada naudotojas B, turi atsinaujinti (angl. *pull*) pakeitimus
    iš serverio, ko pasekoje bus automatiškai sukurta šaka, viena naudotojo A,
    kita naudotojo B. Galiausiai naudotojas B turi tas šakas sulieti (angl.
    *merge*) ir tik tada įkelti savo pakeitimus ir suliejimą į serverį.
    

.. _mercurial-server: http://www.lshift.net/mercurial-server.html
.. _mercurial: http://mercurial.selenic.com/
.. _GNU/Linux: http://www.gnu.org/gnu/linux-and-gnu.html
.. _Debian: http://www.debian.org/
.. _Ubuntu: http://www.ubuntu.com/
.. _Subversion: http://subversion.apache.org/
.. _git: http://git-scm.com/
.. _Schemes: http://mercurial.selenic.com/wiki/SchemesExtension
.. _klonuotos šakos: http://stevelosh.com/blog/2009/08/a-guide-to-branching-in-mercurial/#branching-with-clones
.. _pavadintos šakos: http://mercurial.selenic.com/wiki/NamedBranches
.. _paprastos šakos: http://stevelosh.com/blog/2009/08/a-guide-to-branching-in-mercurial/#branching-anonymously

