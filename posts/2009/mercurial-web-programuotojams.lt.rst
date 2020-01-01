.. title: Mercurial Web programuotojams
.. slug: mercurial-web-programuotojams
.. date: 2009-10-06 22:51:00 UTC+02:00
.. tags: mercurial
.. type: text

Kadangi `ubuntu.lt <http://www.ubuntu.lt/>`_ kodą buvo nuspręsta perkelti po
`Launchpad.net stogu <https://code.launchpad.net/~sirex/ubuntu.lt/main>`_, tai
teko šiek tiek pasidomėti `bazaar <http://bazaar-vcs.org/>`_ versijų kontrolės
sistema. Radau įdomų dalyką – `Publishing your branch
<http://doc.bazaar-vcs.org/latest/en/tutorials/tutorial.html#publishing-your-branch>`_!
Bazaar gali siųsti pakeitimus tiesiai į SFTP serverį.

Tikriausiai daugelis Web programuotojų keičia kodą savo kompiuteryje, o vėliau
tai kas pakeista siunčia per FTP į Web serverį. Aš darau būtent taip ir darau
tai labai dažnai. Iki šiol pakeitimų į Web serverį siuntimui naudojau Makefile
+ lftp. Tačiau pasiskaitęs apie Bazaar nusprendžiau pasidomėti ar Mercurial
turi kokias nors priemones „push'inti“ į FTP. Pasirodo turi! :)

Atradimas
=========

Radau Mercurial FTPExtension_, kuris daro būtent tai, ko reikia!

Trumpai aprašysiu kaip dirbu su kodu ir kaip jį siunčiu į Web serverį, per FTP.

1. Keičiu kodą::

    $ vim index.php

2. Fiksuoju tai ką keičiu::

    $ hg ci -m "Aprašymas ką ir kodėl keičiau."

3. Magija prasideda :) Siunčiu pakeistus failus į Web serverį, per FTP::

    $ hg ftp -u

``hg ftp -u`` komanda surenka visus pakeitimus nuo paskutinio siuntimo į Web
serverį ir siunčia naujus ir keistus failus, o taip pat ištrina tai, kas buvo
ištrinta. Tačiau neliečia nei vieno failo Web serveryje, kurio nėra Mercurial
repozitoriume. Tai reiškia, kad serveryje gali būti kokių tik nori failų,
tačiau atnaujinama bus tik tai, kas konkrečiai keičiasi kode. Bent jau mano
darbe tai yra labai naudingas dalykas.

Kaip įdiegti FTPExtension?
==========================

Labai paprastai::

    $ mkdir -p ~/.hgext
    $ cd ~/.hgext
    $ hg clone http://bitbucket.org/misery/hgftp/

Po šių veiksmų, galite įjungti šį praplėtimą globaliai (``~/.hgrc``), arba tik
konkrečiam repozitoriumui (*./.hg/hgrc*) į nurodytą failą įrašydami:

.. code-block:: ini

    [extensions]
    hgext.ftp = ~/.hgext/hgftp/ftp.py

FTPExtension konfigūravimas
===========================

Kai jau turite veikiantį praplėtimą, konkrečiam Web projekto repozitoriumui
galite nurodyti FTP prisijungimą, kur bus siunčiami duomenys. Tai galite
padaryti repozitormiumo konfigūraciniame faile ``./.hg/hgrc``, nurodydami:

.. code-block:: ini

    [paths]
    ftp    = ftp://[user[:pass]@]host[:port]/[path]
    myhost = ftp://andre@incubo.de/htdocs

Jei prisijungimo eilutę priskirsite specialią paskirtį turinčiam žodeliui
'ftp', tuomet šis FTP serveris bus naudojamas pagal nutylėjimą ir galėsite
tiesiog naudoti ``hg ftp -u``. Kitais atvejais, reikia nurodyti serverį taip:
``hg ftp -u myhost``.

Toliau reikia nurodyti reviziją, nuo kurios bus siunčiami atnaujinimai.
FTPExtension pakeitimus siunčia nuo revizijos, kuri pažymėta žyme
'uploaded@host'. Žinoma 'host', reikia pakeisti į konkretų hostą, tai myhost
atveju, turėtų būti 'uploaded@incubo.de'. Einamajai revizijai lokalią žymę
uždėsite taip::

    $ hg tag -l uploaded@host

Viskas, kai jau FTPExtension žino reviziją, nuo kurios siųsti pakeitimus,
galite keisti kodą, fiksuoti pakeitimus ir siųsti juos per ftp labai paprastai
ir labai greitai. Daugiau nereikės sukti galvos dėl to kas buvo keista, kada
atnaujinta ir pan.

Pabaigai, siūlau pasiskaityti daugiau apie tai, kaip naudoti šį praplėtimą::

    $ hg help ftp

Daugiau informacijos praplėtimo svetainėje:

- FTPExtension_

.. _FTPExtension: http://bitbucket.org/misery/hgftp/wiki/Home

