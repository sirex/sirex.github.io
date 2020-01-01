.. title: SSH pamokėlės
.. slug: ssh-pamokeles
.. date: 2010-02-04 19:41:00 UTC+02:00
.. tags: ssh, floss, shell
.. type: text

Kas yra SSH?
============

SSH yra Secure SHell.

Kas yra Shell?
==============

Shell yra programa suteikianti naudotojui tam tikrą sąsają. Linux pasaulyje,
Shell vadinama programa, kurios sąsajos dėka galite valdyti kompiuterį.

Kuo skiriasi Shell nuo SSH?
===========================

Paprasta Shell programa suteikia galimybę valdyti kompiuterį, kuriame ji
paleista, tuo tarpu SSH, suteikia galimybę valdyti kitą tinklo kompiuterį,
nuotoliniu būdu.

Tarkime, norint iškviesti Shell programą ``bash``, reikia::

    bash

Norint iškviesti Shell programą bash kitame kompiuteryje reikia::

    ssh kitas-kompiuteris bash

Kaip matote, viskas, ką daro SSH, tai suteikia saugią prieigą prie nutolusio
kompiuterio Shell programos.

Kas yra SSH raktas?
===================

SSH suteikia saugią prieigą prie kito kompiuterio, todėl jungiantis visą laiką
prašomas kito kompiuterio naudotojo prieigos slaptažodis. SSH raktų dėka,
galima susikurti vieną raktį nuo visų durų. Tai daroma taip::

    ssh-keygen -C jusu@elpastas.lt
    scp ~/.ssh/id_rsa.pub kitas-kompiuteris:.ssh/authorized_keys

Nuo šiol, prie kito kompiuterio galėsite jungtis be slaptažodžio, jei turite
veikiantį taip vadinamą, raktų agentą. Ubuntu sistemoje raktų agentas veikia,
todėl jungiantis prie kito kompiuterio, jūsų tik vieną kartą paklaus
slaptažodžio nuo raktinės.

Kas yra ssh-keygen?
===================

ssh-keygen yra programa, kuri sukuria viešąjį (``~/.ssh/id_rsa.pub``) ir
privatųjį (``~/.ssh/id_rsa``) SSH raktus. Raktai išsaugomi failuose, kuriuos
nurodžiau skliausteliuose.

Kas yra ~/.ssh/authorized\_keys
===============================

Tai yra paprasčiausias tekstinis failas, kuriame gali būti surašyti viešieji
naudotojų raktai, kurie gali prisijungti naudodamiesi savo privažiuoju raktu.

Faile, vienas viešasis raktas saugomas vienoje eilutėje.

Kas yra scp?
============

``scp`` yra Secure CoPy. Veikiai labai panašiai, kaip komanda cp, tik kopijuoja
iš vieno kompiuterio, į kitą::

    cp failas-a.txt failas-b.txt
    scp failas-a.txt kitas-kompiuteris:failas-b.txt

Kas yra sftp?
=============

``sftp`` yra SSH File Transfer Protocol, veikia panašiai, kaip FTP, tik naudoja
tą patį SSH. Štai paprastas būdas prisijungti prie kito kompiuterio, per
``sftp``, naudojantis failų naršymo programa nautilus::

    nautilus sftp://kitas-kompiuteris

Ar galiu apjungti Shell ir SSH komandas?
========================================

Taip. Tarkime norite iš kitas-kompiuteris eksportuoti MySQL duomenų bazę ir
importuoti ją į savo kompiuterio MySQL duomenų bazę::

    ssh kitas-kompiuteris 'mysqldump tavodb' | mysql manodb

Šiame pavyzdyje, nutolusiame kompiuteryje iškviečiate komandą ``mysqldump
tavodb``, kuri į ekraną išveda visą duomenų bazės turinį.  Toliau simbolio
``|`` pagalba, tai kas išvedama į ekraną, nukreipiate į kitą komandą 'mysql
manodb', kuri surenka visą duomenų bazės turinį ir importuoja jį į jūsų duomenų
bazę.

Pasitaiko, kad tarp kompiuterių yra mažas tarptinklinis pralaidumas, todėl kad
pagreitinti duomenų perdavimą, galima perduodamus duomenis suspausti::

    ssh kitas-kompiuteris 'mysqldump tavodb | gzip -c' | gunzip -c | mysql manodb

Tai tiek. Tikiuosi „pagavote kampą“ kas yra SSH, ir kaip paprastai galima juo
naudotis sutaupant daug laiko.

