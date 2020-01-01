.. title: Dell Inspiron 1501 + Ubuntu Jaunty + Ext4
.. slug: dell-inspiron-1501-ubuntu-jaunty-ext4
.. date: 2009-06-02 22:32:00 UTC+02:00
.. tags: ubuntu, ext4, floss
.. type: text

Nesenai pakeičiau darbo kompiuterį, gavau Dell Inspiron 1501. Deja diegimo ir
kompiuterio paruošimo darbui procedūra vyko ne itin sklandžiai...

Aprašysiu visas problemas, jei kas susidurs, gal ši informacija padės.

WiFi
====

Jei naudojate Linux, venkite Broadcom BCM4311 WLAN plokščių... Nes jos neveikia
„out of the box“.

Tačiau, jei turite galimybę prisijungti prie interneto laidų, tai didesnių
problemų neiškils:

    Sistema » Administravimas » Aparatinės įrangos valdyklės

Atsidariusiame „Aparatinės įrangos valdyklės“ lange, pasirinkite „Broadcom B43
wireless driver“ ir spauskite mygtuką „Activate“.

Nors ši WLAN plokštė neveikia iš karto, tačiau diegimas, kaip matote, nėra
sudėtingas.

**Klaikus pypsėjimas**

Sekantis, erzinantis ne tik mane, bet ir mano bendradarbius, reiškinys

– pypsėjimas išsijungiant ir ką nors ne taip paspaudus terminalo lange.
  Sprendimas labai paprastas::

    $ sudo rmmod pcspkr
    $ sudo sh -c 'echo blacklist pcspkr >> /etc/modprobe.d/blacklist'

Ext4 – kol kas nerekomenduočiau
===============================

Kadangi kartu su Jaunty versija atsirado galimybė naudoti Ext4 failų sistemą,
kuri buvo gausiai afišuota. Tai žinoma net nedvejodamas pasirinkau Ext4 visuose
skirsniuose.

Tačiau toks pasirinkimas buvo didelė klaida! Problemos pasireiškė jau diegimo
metu, kai praktiškai viską įdiegus Ubuntu ėmė ir sustingo, teko daryti „hard
reboot“.

Pradžiai pamaniau, kad tai tik koks nors atsitiktinis nesklandumas ir
nekreipiau į tai dėmesio. Tačiau tą pačią dieną sustingimas vėl pasikartojo.
Dėl to apkaltinau ATI vaizdo tvarkykles. Kadangi po to sustingimų nebuvo kelias
savaites, tai nieko nedariau.

Praėjus kelioms savaitėms, testavau programą, kurios veikimo metu kuriama daug
mažų failų. Tuo metu ir prasidėjo visos bėdos, dėl kurių sugaišau puse darbo
dienos. Mažų failų kūrimo metu, daugeliu atveju Ubuntu sustingdavo ir tekdavo
daryti „hard reboot“. Tačiau šį dėsningumą pastebėjau ne iš karto. Įtariau ATI
vaizdo tvarkykles, tačiau po įvairių bandymu, net gi su VESA tvarkyklėmis vėl
pasikartojo sustingimas. Toliau įtarinėjau WLAN tvarkykles, tačiau jas išjungus
sustingimas vėl pasikartojo. Taip pat, pasikartojus sustingimui, bandžiau
jungtis iš kito kompiuterio per SSH, tačiau tokioje būsenoje, kompiuteris buvo
nepasiekiamas. Galiausiai atlikus kelis bandymus, galutiniai įsitikinau, kad
sustingimai atsiranda dėl Ext4 failų sistemos kaltės ir būtent tuomet, kai
failų sistema intensyviai naudojama atliekant operacijas su nedideliais
failais.

Ką gi, po tokių išgyvenimų, galiu drąsiai teigti – Ext4 tikrai dar nėra
pakankamai stabili, kad būtų galima ją naudoti darbo ar namų kompiuteryje,
nekalbant apie serverius...

Kadangi Ext4 vis dar nėra tinkamas kasdieniam naudojimui, nusprendžiau
paeksperimentuoti su JFS. Kol kas veikia gerai... :)

