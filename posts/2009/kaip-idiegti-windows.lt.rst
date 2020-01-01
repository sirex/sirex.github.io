.. title: Kaip įdiegti Windows?
.. slug: kaip-idiegti-windows
.. date: 2009-10-19 22:52:00 UTC+02:00
.. tags: windows, ubuntu, qemu, floss
.. type: text

Istorija tokia, darbe teko testuoti svetainę su IE naršyklėmis. Kadangi prie
projekto dirbau vienas ir nebuvo porininko naudojančio Windows, tai tas bjaurus
darbas teko man pačiam... :/

Darbe naudoju Ubuntu, tai jokio IE neturėjau. Ačiū `IEs4Linux projektui
<http://www.tatanka.com.br/ies4linux/>`_, kurio dėka IE6 daugiau/mažiau veikia
per `Wine (**W**ine **I**s **N**ot an **E**mulator!)
<http://www.winehq.org/>`_. Deja to pačio padaryti su IE7 nepavyko. Sprendimas
– greitai įsidiegti Windows į virtualią mašiną ir ten testuoti.

Įdiegti Ubuntu galima iš CD, USB, per tinklą ar internetą ir net gi `tiesiai į
Windows, nekeičiant disko skirsnių <http://wubi-installer.org/>`_. Kiek žinau,
Windows galima įdiegti tik per CD...

Kaip įdiegti Windows?
=====================

Virtualizacijos dėka ribotos Windows įdiegimo galimybės nesudaro jokių
problemų. Šiam reikalui pasirinkau `QEMU <http://www.qemu.org/>`_.  Kodėl?
Todėl, kad tai yra lengvas. paprastas virtualios mašinos emuliatorius.

**1. Įdiegiame QEMU:**

::

    $ sudo apt-get install qemu kqemu-source

*kqemu-source* yra Linux branduolio modulis, kuris paspartina QEMU virtualios
mašinos darbą. Viskas veiks ir be šio paketo, tačiau lėčiau.

**2. Susikuriame virtualų diską:**

::

    $ qemu-img create -f qcow2 windows.img 8G

Nors nurodyta 8G diskas, tačiau pats virtualaus disko failas užims vos kelis
kilobaitus. Failo dydis proporcingas naudojamai virtualaus disko vietai.

**3. Windows diegimas iš ISO arba CD**

::

    $ qemu -cdrom windows.iso -hda windows.img -m 256 -boot d

Jei turite nelegaliai pasidarę legalių Windows CD kopiją į ISO failą, tuomet
galite nurodyti virtualiai mašinai, kad tiesiog užsikrauto iš to ISO failo.
Tačiau galite į CD-ROM įrenginį įdėti ir legalių Windows CD, tuomet vietoje
*windows.iso* reikės nurodyti */dev/cdrom*.

Beje, viskas veiks ir su nelegalia Windows kopija :)

Po šios komandos paleidimo pasileist Windows diegimo vedlys. Įdiekite Windows
kaip visada. Jei nei karto neteko diegti Windows, paprašykite draugo pagalbos.

Priklausomai nuo jūsų kompiuterio spartos, diegimas truks apie valandą.

Po įdiegimo
===========

Kai jau turėsite veikiančius Windows, išsaugotus virtualiame diske, nebereikės
kartoti diegimo, norint vėl juos paliesti. Jau įdiegtus Windows iškviesite
taip::

    $ qemu -hda windows.img -m 256

Kadangi Windows mėgsta virusai ir kitokios nelaimės, tai siūlau pasidaryti
virtualaus disko kopiją su šviežiai įdiegtais Windows. Galite viską įsirašyti į
kokį DVD ar šiaip kur nors pasidėti. Jei kas nors nutiks, bet kada vėl galėsite
paleisti šviežiai įdiegtus Windows iš atsarginės virtualaus disko kopijos.

Pats tai išbandžiau, pavyko sėkmingai ištestuoti svetainę su IE naršykle ir
pataisyti klaidas.

Naudojantis QEMU galima testuoti ir kitas operacines sistemas, pavyzdžiui
Ubuntu Alpha ar Beta versijas. Daugiau apie QEMU galite pasiskaityti `qemu.org
<http://www.qemu.org/>`_ svetainėje.

|image0|

.. |image0| image:: files/qemu-windows.png

