.. title: Naudok priemonę labiausiai tinkančią užduočiai spręsti
.. slug: naudok-priemone-labiausiai-tinkancia-uzduociai-spresti
.. date: 2010-06-17 07:40:00 UTC+02:00
.. tags: perl, floss, shell
.. type: text

Kadangi esu programuotojas, mėgstu įvairias užduotis automatizuoti.  Kartais
automatizavimas sutaupo labai daug laiko, kartais galima sugaišti labai daug
laiko automatizuojant, bet šį kartą ne apie tai...

Trumpai apžvelgsiu priemones, kurias naudoju užduočių automatizavimui.

Makefile
========

Labai naudinga priemonė ypač programuotojams, tačiau aš tai naudoju ne tik
programavime. Pavyzdžiui esu pasidaręs Neo Freerunner sinchronizavimą su
kompiuterių. Dažnai kataloge tiesiog aprašau Makefile, pamirštu ką jis daro ir
kam jis skirtas, bet jei matau, kad kataloge yra Makefile, tai nesigilindamas
rašau make ir darbas atliktas.

Tikriausiai 90% visų atviro kodo paketų naudoja Makefile, todėl įrankis tikrai
laiko ir naudotojų gausos išbandytas ir atidirbtas. Gėris.

Shell skriptai
==============

Jei kažką sunkiai sekasi aprašyti Makefile'uose, į pagalbą galima
pasitelkti shell skriptus. Jei dar nežinote, tai nustebsite kiek daug
galima pasiekti naudojant shell skriptus. Mano namų bin kataloge yra
visa gausybė shell skriptų visiems gyvenimo atvejams. Šiuo metu ten yra::

    $ ls ~/bin | wc -l
    65

65 skriptai.

Štai paprastas shell skripto pavyzdys, kuris gali praversti kas dieną:

.. code-block:: bash

    #!/bin/bash
    URL='http://translate.google.lt/translate_t?q='$1'#auto|lt'
    w3m -dump $URL 2>/dev/null | egrep '^Žodynas' -A10

Rezultatas gaunasi toks::

    test.sh shell
    Žodynas
     
    daiktavardis
     
    1. apvalkalas
    2. lukštas
    3. karkasas
    4. kiautas
    5. įdėklas
    6. šarvas veiksmažodis
    7. sluoksnis

sed, awk ir draugai
===================

Rašant shell skriptus šių komandų gan dažnai prireikia, norint apdoroti
kažkokią tekstinę informaciją. Čia daug ką kalbėti ir nebūtina, tiesiog
pateiksiu paprasčiausią pavyzdį komandos, kuri pakeičia visų lentelių
pavadinimus duomenų bazės faile::

    $ du -sh data.sql
    2,1G
    $ sed -i data.sql
    $ time sed -i 's/site1_prefix_/site2_prefix_/g' data.sql
    35,27s user 51,79s system 59% cpu 2:26,58 total

Visas failas pakeistas per 2,5 minutes! Įdomu per kiek laiko šį failą atidarytų
jūsų teksto redaktorius? :D

perl
====

Visi aukščiau išvardinti įrankiai yra puikūs, tačiau kai reikia atlikti šį tą
sudėtingesnio, visada verta prisiminti perl.

Perl yra pilnavertė programavimo kalba, tačiau turi funkcijų panšių į sed ir
awk, ne gana to, perl dirba labai greitai::

    $ time perl -i -nle 's/site1_prefix_/site2_prefix_/g; print' data.sql
    19,60s user 9,54s system 36% cpu 1:20,46 total

Perl tą patį darbą atliko minute greičiau, nei sed! Bet dirbant su perl, reikia
turėti kiek daugiau žinių, nei su sed.

Perl gali puikiausiai apdoroti tekstinius duomenis, o rezultatą įrašyti į
duomenų bazę ar panašiai, kaip tai padaryta šiame pavyzdyje:

.. code-block:: perl

    #!/usr/bin/perl -nl
     
    BEGIN {
        use DBI;
        our $dbh = DBI->connect("dbi:SQLite:dbname=/tmp/lines.db");
        our $sth = $dbh->prepare("INSERT INTO lines VALUES (?)");
    }
     
    $sth->execute($_);

