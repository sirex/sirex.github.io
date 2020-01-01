.. title: Ubuntu 10.10
.. slug: ubuntu-1010
.. date: 2010-10-17 22:50:00 UTC+02:00
.. tags: ubuntu
.. type: text

Nesenai vykusioje Ubuntu 10.10 Release Party mini konferencijoje vedžiau
install fest, net 2 valandas! Kad išsamiai ir nuosekliai viską nupasakočiau,
buvau pasiruošęs visą sąrašą dalykų, kuriuos reikia paminėti. Nusprendžiau
paskelbti šį sąrašą ir čia.

Tik noriu iš kart įspėti, kad sąrašas netvarkytas ir kai kuriose vietose gali
būti neaiškus.

Ar verta diegti Ubuntu?
=======================

- Taip, nebent:

  - Esate priklausomas nuo video žaidimų, kurie veikia tik Windows aplinkoje.

  - Kiekvieną dieną dirbate su specializuotomis programomis, tokiomis kaip
    AutoCAD ir pan., kurios veikia tik Windows aplinkoje.

  - Turite kompiuterį, kuris yra nesuderinamas su Linux

Pasiruošimas diegimui
=====================

- Upgrade versus fresh install

  - Rekomenduoju daryti Fresh Install

- Iš kur gauti Ubuntu?

  - `http://www.ubuntu.com/desktop/get-ubuntu/download
    <http://www.ubuntu.com/desktop/get-ubuntu/download>`_

- LTS vs ne LTS

  - Jei esate koncervatyvus ir bijote naujovių, tuomet rinkitės LTS

- 32bit VS 64bit

  - Jei jūsų kompiuteris yra 64bit architektūros, rinkitės 64bit

- desktop VS alternate

  - Rinkitės desktop diegimo variantą

- ubuntu VS kubuntu VS xubuntu VS baltix VS UNE VS ...

  - Dažniausiai patartina rinktis Ubuntu

  - kubuntu skirtas KDE naudotojams, tačiau ši aplinka kitose distribucijose,
    kokiose, kaip OpenSuse yra labiau išbaigta

  - Xubuntu skirtas silpniems kompiuteriams

  - Baltix, pritaikytas Lietuvai

  - Ubuntu Netbook Edition skirtas internetiniams kompiuteriams su mažais
    ekranais

- Atsisiuntus patikrinti MD5SUM::

      md5sum -c MD5SUMS

- CD VS USB

  - Jei jūsų kompiuteris gali užsikrauti iš USB, diegimą atlikite iš USB,
    greičiau ir patogiau

- Kaip įsirašyti CD?

  - Reikia įrašinėt bootable CD

- Kaip įsirašyti USB?

  - Sistema - Administravimas - Paleidimo laikmenos kūrimas

  - Jei turite problemų su SYSLINUX:

    - `http://mirrors.kernel.org/ubuntu/pool/main/s/syslinux/
      <http://mirrors.kernel.org/ubuntu/pool/main/s/syslinux/>`_

- Wubi

  - Patariu naudoti tik Ubuntu testavimui

- Atsarginių kopijų darymas naudojant `Ubuntu One <#ubuntu%20one>`_

  - Katalogų sinchronizavimas su Ubuntu One

  - Tomboy užrašų sinchronizavimas su Ubuntu One

- Konfigūracinių failų saugojimas Mercurial repozitoriume

- Naudojamų programų sąrašo išsaugojimas ir atstatymas:

  .. code-block:: sh

      # Prieš naujai įdiegiant Ubuntu:
      dpkg --get-selections > old

      # Po įdiegimo
      dpkg --get-selections > new

      # Išrenkam paketus, kurių nėra
      comm -23 old new > sel

      # Peržiūrim ko reikia
      vim sel

      # Įdiegima tai, kas atrinkta
      sudo dpkg –set-selections < mypackages.txt
      sudo apt-get dselect-upgrade

  Idėja: `http://brainstorm.ubuntu.com/idea/25839/
  <http://brainstorm.ubuntu.com/idea/25839/>`_

- Atsarginių kopijų darymas, rekomenduoju Back In Time, taip pat: sbackup
  (Simple Backup Suit) arba grsync

  - Prieš naujai įdiegiant Ubuntu, atsarginių kopijų darymas turi būti
    paskutinis dalykas ir tai reikia daryti išjungus visas programas.

- Namų katalogo išvalymas, prieš darant fresh install

Diegimas
========

- BIOS nustatymai

- Kalba: geriau rinktis lietuvių, nes:

  - Vertimus daro patys Ubuntu naudotojai, o ne užsakomos firmos

  - Automatiškai sukonfigūruojami visi Lietuvai ir Lietuviams būdingi
    nustatymai

  - Automatiškai įdiegiami gramatikos tikrinimo žodynai ir t.t.

- Disko skirsniai

  - Ubuntu gali pats suskaldyti diską, taip, kaip reikia (pagal nutylėjimą
    sukuriama tik root ir swap skirsniai)

  - Jei turite keturis ar mažiau skirsnių, nėra jokios būtinybės kurti
    „extended“ skirsnius

  - ``/home`` katalogą rekomenduojama iškelti į atskirą skirsnį

  - Dažniausiai skirsnių eilės tvarka yra tokia:

    - sistema, kur laikomi įkrovimo failai ( / )

    - swap

    - home (``/home``)

  - Rekomenduojama Ext4 failų sistemą, veikia greičiausiai

  - Swap yra nebūtinas, bet rekomenduotinas

  - Swap skirsnis gali būti ir pirminis ir loginis

  - Kiek vietos išskirti Swap'ui?

    - Jei naudojate hibernate funkciją, tada swap turi būti ne mažesnis, kaip
      RAM, jei nenaudojate hibernate ir turite daug RAM, tada swap gali būti
      ir 1G

  - Rekomenduojamu išskirti 10G sistemai, Swap, ir kas liko home

Po įdiegimo
===========

- Keyring slaptažodis

  - Jei neįvesite jokio slaptažodžio, tada jūsų slaptažodžiai bus nesaugūs,
    bet keyring neklausinės kas kartą įvesti slaptažodžio

- Rekomenduojama įsidiegti visus atnaujinimus iš karto po įdiegimo

- Įsidiegti paketą: ubuntu-restricted-extras

- Susikonfigūruokite Ubuntu One

- Compiz įjungimas (veikia ne visur, jei veikia jūsų kompiuteryje, tai bus
  įjungtas pagal nutylėjimą)

- Pašto klientas, rekomenduoju Thunderbird

  - Calendar Extension for Thunderbird - Google Calendar support

  - Thunderbird plėtinys „Enigmail“

  - Calendar Extension for Thunderbird

  - Indicators for Thunderbird `https://launchpad.net/libnotify-mozilla
    <https://launchpad.net/libnotify-mozilla>`_

  - FireTray

  - Lightning

- Gwibber

- Chat

- Žodynas: GoldenDict arba OpenDict, rekomenduoju GoldenDict

- Gnome panelė:

  - tomboy užrašai

  - procesoriaus apkrovimas

- Gnome-do - must have
