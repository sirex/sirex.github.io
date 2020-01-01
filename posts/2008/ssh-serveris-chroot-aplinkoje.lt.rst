.. title: SSH serveris chroot aplinkoje
.. slug: ssh-serveris-chroot-aplinkoje
.. date: 2008-12-23 09:06:00 UTC+02:00
.. tags: ubuntu, floss, shell, ssh
.. type: text

Jau seniai esu girdėjęs ir daugiau mažiau žinojau chroot aplinkos veikimo
principus, tačiau pačiam to dar neteko daryti. Prieš kelias dienas
konfigūruodamas vieną kompą su Ubuntu Server Hardy Herron OS, pagaliau teko ir
man patirti šį malonumą, chroot aplinkos pakūrimą... :) Pasirodo tai kur kas
paprasčiau nei maniau! Tai gi pasidalinsiu patirtimi ir su kitais.

Viską pavyko padaryti sekant vieno `ubuntuforums.org įrašo nuorodomis
<http://ubuntuforums.org/showthread.php?t=408019>`_. Labai neišsiplėsdamas
paprasčiausiai pakartosiu kas ten rašoma ir kai kur pakomentuosiu.

1. Žingsnis
===========

::

    sudo apt-get install dchroot debootstrap
    sudo mkdir /chroot/
    sudo echo "hoary /chroot" >> /etc/dchroot.conf
    sudo debootstrap --arch i386 hardy /chroot/ http://lt.litnet.lt/pub/ubuntu
    sudo chroot /chroot/ dpkg-reconfigure locales

Su šiuo žingsniu manu viskas labai aišku ir paprasta. Puikiojo įrankio
debootstrap dėka, savo OS viduje sukuriama nauja sistema, o tiksliau
paprasčiausiai parsiunčiami jos failai. Taip pat nurodžiau Lietuvišką Ubuntu
repozitoriumo serverį, ko dėka, su gera interneto linija į Lietuva, šis
procesas vyks labai greitai.

2. Žingsnis
===========

Šiame žingsnyje pasileiskite kitą terminalo langą, nes pirmame žingsnyje jūs
esate chroot viduje, o naujame terminale turėtumėte būti išorėje.

::

    echo "http://ftp.litnet.lt/pub/ubuntu hardy main restricted universe multiverse" >> /chroot/etc/apt/sources.list
    echo "http://security.ubuntu.com/ubuntu hardy-security main restricted universe multiverse" >> /chroot/etc/apt/sources.list

3. Žingsnis
===========

Vėl grįžkite į chroot vidų ir tęskite::

    apt-get update ; apt-get upgrade

4. Žingsnis
===========

Vėl grįžkite į kitą terminalą, kuri būtų išorėje (ne chroot aplinkos viduje)::

    sudo cp /etc/passwd /chroot/etc/
    sudo cp /etc/shadow /chroot/etc/
    sudo cp /etc/group /chroot/etc/
    sudo cp /etc/sudoers /chroot/etc/
    sudo cp /etc/hosts /chroot/etc/
    echo "/tmp /chroot/tmp none bind 0 0" >> /etc/fstab
    echo "/dev /chroot/dev none bind 0 0" >> /etc/fstab
    echo "/proc /chroot/proc proc defaults 0 0" >> /etc/fstab
    sudo mkdir -p /chroot/usr/share/fonts
    echo "/usr/share/fonts /chroot/usr/share/fonts none bind 0 0" >> /etc/fstab

5. Žingsnis
===========

Dabar ko gero sudėtingiausia dalis, kurią bandžiau visaip apeiti, nenorėdamas
kompiluoti kažkokio nežinomo kodo dėl saugom... Tačiau nieko nepavyko ir teko
susikompiluoti pateiktą C kodą, po ko viskas pradėjo veikti.

Tai gi, prieš kompiliuojant, jei išmanote C kodą, siūlau užmesti akį į
`chrootshell.c <http://kegel.com/crosstool/current/chrootshell.c>`_ ir tada
tęsti chroot išorėje::

    cd /tmp
    wget http://kegel.com/crosstool/current/chrootshell.c cc chrootshell.c -o chrootshell
    sudo install -o root -m 4755 chrootshell /sbin/chrootshell
    echo "/sbin/chrootshell" >> /etc/shells

6. Žingsnis
===========

Galiausiai chroot išorėje, faile ``/etc/passwd``, visiems naudotojams, kurie
prisijungimo metu turės būti nukreipiami į chroot aplinką, reikia pakeisti namų
katalogą į ``/chroot``, o shellą į ``/sbin/chrootshell``.

Pavyzdys::

    petras:1000:1000:Petras Petraitis:/chroot:/sbin/chrootshell

6. Žingsnis
===========

Vidiniame ``/etc/passwd`` faile turi būti tokie patys naudotojai, tik su
tikrais duomenimis, su tikru, chroot viduje egzistuojančiu namų katalogu ir
shellu.

Pavyzdys::

    vardas:1000:1000:Vardas Pavardenis:/home/vardas:/bin/bash

Jei naudotojus kūrėte, tiesiog sukurdami įrašą ``/etc/passwd`` failo viduje,
tada kiekvienam sukurtam naudotojui reikia sukurti ir po namų katalogą, tam
puikiai tinka toks paprastas shell skriptas, kuris turėti būti paleistas chroot
išorėje:

.. code-block:: bash

    awk -F ":" '/chrootshell/ { print $1 }' /etc/passwd | while read chrootusr ; do
        if [ ! -d /chroot/home/$chrootusr ] ; then 
            echo "Creating home dir for: $chrootusr"
            sudo mkdir -p /chroot/home/$chrootusr
            sudo chown $chrootusr:$chrootusr /chroot/home/$chrootusr
            sudo chmod 700 /chroot/home/$chrootusr
        fi
    done

7. Žingsnis
===========

Galiausiai bandykite jungtis, kaip chroot įkalintas naudotojas::

    ssh petras@localhost

Tai tiek informacijos. Viskas labai paprastai pasidaro. Pasinaudojant
``debootstrap`` ir ``chroot`` įrankiais, labai nesunkiai, galima susikurti
testinę aplinką, kuri nedarys jokios įtakos jūsų darbinei aplinkai ir ten
testuotis kokias nors serverio konfigūracijas ar panašiai. ``debootstrap``
įrankio sukurta aplinka užima vos 300 Mb disko vietos, su minimalia Ubuntu
serverio instaliacija. Na, tikrai puikus dalykas... :)

Informacijos šaltiniai
======================

-  `ubuntuforums.org <http://ubuntuforums.org/showthread.php?t=408019>`_

