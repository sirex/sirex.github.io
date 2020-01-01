.. title: Linux + GPS
.. slug: linux-gps
.. date: 2009-11-19 00:01:00 UTC+02:00
.. tags: openmoko, linux, gps, floss
.. type: text
.. previewimage: /images/neo.png

.. thumbnail:: /images/neo.png
    :alt: Neo Freerunner
    :class: previewimage

Pastaruoju metu gan dažnai tenka naudotis GPS įranga, todėl nusprendžiau
pasidalinti informacija, kaip tai sekasi daryti su Linux.

Naudojama Įranga
================

Iš esmės tinka bet kuris GPS imtuvas, pageidautina, suderinamas su
`OpenStreetMap <http://www.openstreetmap.org/>`_ žemėlapiais ir žinoma Linux.
Konkrečiai naudoju tokią įrangą:

- `Neo Freeruneer <http://www.openmoko.com/freerunner.html>`_

- `Automobilinis USB pakrovėjas
  <http://www.svp.co.uk/sport-and-leisure/in-car-equipment/satellite-navigation/vivanco-usb-car-charger-adapter-vivanco056_in-car-usb-charger-adapter.html>`_

- `Lenovo ThinkPad X61 Tablet
  <http://www.thinkwiki.org/wiki/Category:X61_Tablet>`_

Programinė įranga
=================

- `gpsd <http://gpsd.berlios.de/>`_

- `TangoGPS <http://www.tangogps.org/>`_

- `Navit <http://www.tangogps.org/>`_

- `JOSM <http://josm.openstreetmap.de/>`_

Žemėlapiai
==========

- `OpenStreetMap <http://www.openstreetmap.org/>`_

Neo FreeRunner
==============

Tai yra atviras „telefonas“, puikiai suderinamas ir pritaikytas darbui su Linux
ir turintis GPS įrangą. Jame galima kompiliuoti, naudotis komandine eilute,
prisijungti per SSH ir daryti ką tik nori. Įrenginyje veikia visa aukščiau
išvardinta programinė įranga. Į FR galima įrašyti `visą gausybę Linux
distribucijų <http://wiki.openmoko.org/wiki/Distributions>`_, pastaruoju
naudoju `SHR <http://wiki.shr-project.org/>`_.

Laikant visą laiką įjungtą ekrano apšvietimą ir GPS, Neo baterija laiko apie
3-4 valandas, tačiau nustačius automatinį ekrano išjungimą po 2 minučių ir
automatinį užmigdymą, po 2:30 minučių, naviguotis galima visą dieną ir ilgiau.
Neo pabunda iš užmigdymo stadijos labai greitai, o signalą pasigauna taip gan
greitai, per 1-5 minutes, priklausomai nuo signalo stiprumo.

Važiuojant mašina, dažnai praverčia USB adapteris, kadangi Neo gali įsikrauti
per USB laidą, tai visas komplektas puikiai veikia ir nebaisu, kad viduryje
kelionės išsikraus baterija.

Openstreetmap
=============

Iš pradžių bandžiau naudoti `maps.lt <http://maps.lt/>`_ duomenis, tačiau jie
nesuderinami su jokiais paplitusiais formatais, bandžiau naudoti `Google Maps
<http://maps.google.com/>`_ duomenis, tačiau gauti jų žemėlapius taip pat gan
sudėtinga, nes siuntimai ribojami tiek apsaugant paveiksliukų adresus, tiek
įvairiai ribojant atsiųstų paveiksliukų kiekį, per tam tikrą laiką. Be to abiem
atvejais, galima gauti tik paveiksliukus, o ne vektorinius duomenis.
`Openstreetmap <http://www.openstreetmap.org/>`_ netaiko jokių ribojimų, galima
gauti ir paveiksliukus ir vektorinius duomenis, be to žemėlapius galima ir
pačiam taisyti. Vis tik atviras kodas yra atviras kodas... :)

Openstreetmap veikia panašiu į Wiki principu, kur kiekvienas gali kurti turinį,
kadangi tą turinį stebi daug akių, tai apsaugo nuo klaidingų duomenų patekimo.
OSM žemėlapiais naudojuosi jau gal metus laiko, per visą tą laiką teko
susidurti gal su dviem netikslumais, kuriuos iš karto pataisiau.

Žemėlapių detalumas, kai kuriose vietose gan skurdus, tačiau ten kur yra
padirbėja OSM aktyvistai, galima rasti visus keliukus ir šunkelius. OSM
žemėlapis keičiasi ir yra atnaujinamas kiekvieną dieną, jei atsiranda naujo
kelio statybos, tai nors kelias dar nėra baigtas, jau atsiranda žemėlapyje, tuo
tarpu nuosavybiniuose žemėlapiuose dažnai pateikiame pasenę duomenys.

Navit
=====

Ilgą laiką naudojau TangoGPS, nes tai yra labai paprasta programa, naudojanti
žemėlapio paveiksliukus, vadinamus *tiles*. Tačiau, kai susipažinau su Navit,
TangoGPS naudoju tik kaip atsarginį variantą, peržiūrėti žemėlapiams dideliu
masteliu. Tiek Navit, tiek TangoGPS, kaip ir daugelis kitų programų naudoja
gpsd demoną, informacijai apie esamą poziciją nustatyti. Taip pat abi programos
puikiai veikia ir mano kompiuteryje, todėl Neo galiu naudoti kaip GPS serverį
ir prie jo jungtis per kompiuterį, tam, kad žemėlapius ir esamą poziciją
matyčiau dideliame ekrane, improvizacijai nėra ribų... :)

Navit yra aktyviai kuriamas projektas, kol kas gan sudėtingai konfigūruojamas
per XML konfigūracinį failą, tačiau toks konfigūravimo būdas suteikia labai
daug galimybių, tereikia tik įsigilinti, kaip viskas veikia.

Mano Navit konfigūraciją galite rasti: `bitbucket.org/sirex/navit-xml/src/
<http://bitbucket.org/sirex/navit-xml/src/>`_.

O štai galutinis variantas, kaip atrodo Navit:

.. figure:: files/neo-navit.png
   :align: center
   :alt: Neo FreeRunner Navit

   Neo FreeRunner Navit

Su Navit galima:

-  Matuoti atstumus tarp pasirinktų taškų

-  Yra integruotas kompasas

-  Automatiškai pasukamas žemėlapis pagal važiavimo kryptį

-  Galima įjungti automatinį nuvažiuoto maršruto saugojimą GPX formatu

-  Automatinis greičiausio kelio skaičiavimas

-  Skaičiuojama kiek laiko truks kelionė ir kurią valandą bus pasiektas
   tikslas

-  Sąsaja pritaikyta lietimui jautriems ekranams ir valdymui pirštais

-  2d/3d režimai

Tai tik kelios Navit savybės, o jų yra kur kas daugiau.

Dėl žemėlapių, juos galite parsisiųsti iš `maps.navit-project.org/download/
<http://maps.navit-project.org/download/>`_.  Visas Lietuvos žemėlapis,
apimantis visą Latviją, dalį Estijos, pusę Baltarusijos ir nemažą gabalą
Lenkijos užima apie 60 Mb. Visos Žemės žemėlapis užima apie 2.2 Gb.

JOSM
====

Galiausiai po pasivažinėjimų su Neo, galima susirinkti visus GPX failus ir
žiūrėti kur buvo važiuota, jei OSM žemėlapyje ko nors trūksta, labai paprastai
galima įkelti visas trūkstamas vietas, surašyti pavadinimus ir t.t.

Štai kaip atrodo JOSM:

.. figure:: files/josm.png

    JOSM

O čia mano kaimo žemėlapis: `osm.org/go/0leEwu34--
<http://osm.org/go/0leEwu34-->`_

Reziume
=======

Nors tobulėti yra kur, tačiau tiek pats openstreetmap projektas, tiek
navigacijai ir darbui su žemėlapiais skirtos programos puikiai atitinka
esminius poreikius, norint sėkmingai susiorientuoti ir kur nors nuvažiuoti –
**išbandyta praktiškai, naudodamasis aprašytomis priemonėmis esu apvažiavęs
didžiąją dalį Lietuvos ir didelį gabalą Baltarusijos**.

