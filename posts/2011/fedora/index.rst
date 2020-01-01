.. title: Fedora 15
.. slug: fedora
.. date: 2011-07-08 01:40:00 UTC+02:00
.. tags: linux
.. type: text

Kas nepatiko
============

- Chromium naršyklės nėra oficialiame repozitorijoje.

- Pagal nutylėjimą neįdiegta komanda ``wget``, vietoje jos reikia naudoti 
  ``curl -O``.

- Paketų valdymo programa Gnome PackageKit nė iš tolo neprilygsta Ubuntu
  programų centrui, nors kitą vertus GPK pasileidžia nepalyginamai greičiau.
  Tačiau surasti norimą įdiegti programą GPK programoje labai sunku, nes
  rastos programos rūšiuojamos pagal abėcėlę, sąraše pakeikiami visi
  rezultatai, įskaitant programų bibliotekas, kalbų paketus ir t.t.

  GPK panaudojęs vos kelis kartus, nusprendžiau, kad ``yum search`` ir ``yum
  install`` yra kur kas patogiau.

- XTerm pagal nutylėjimą neįdiegtas.

- Nėra Flash grotuvo.

- Nėra LibreOffice programų.

- Fedora neturi tokio dalyko kaip ``ubuntu-restricted-extras``, todėl visus
  „restricted“ paketus tenka įsidiegti rankomis atskirai.

Kas patiko
==========

- Paketų valdymo programa ``yum`` yra šiek tiek patogesnė ir paprastesnis nei
  ``apt-get``. Pavyzdžiui, norint atnaujinti sistemą su ``apt-get`` reikia::
  
      apt-get update
      apt-get dist-upgrade
  
  ``yum`` analogas::
  
      yum upgrade
  
  ``yum`` atveju paketų šaltinių atnaujinti nereikia, nes jie atnaujinami
  kiekvienos komandos vykdymo metu.

Naudingos nuorodos
==================

Naudingos nuorodos pradedantiesiems, kurios man padėjo įsivažiuoti:

- http://www.fedorafaq.org/

- https://help.ubuntu.com/community/SwitchingToUbuntu/FromLinux/RedHatEnterpriseLinuxAndFedora

