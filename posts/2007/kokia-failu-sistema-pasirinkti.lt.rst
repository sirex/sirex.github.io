.. title: Kokią failų sistemą pasirinkti?
.. slug: kokia-failu-sistema-pasirinkti
.. date: 2007-05-07 17:05:00 UTC+02:00
.. tags: floss, linux
.. type: text

Anksčiau į tokius dalykais, kaip failų sistemos nelabai gilinausi, tiesiog
standartiškai rinkdavausi `Ext3 <http://en.wikipedia.org/wiki/Ext3>`_. Tačiau
netyčia `Vikipedijoje
<http://en.wikipedia.org/wiki/Comparison_of_file_systems>`_ užtikau straipsnį
apie failų sistemas, tai pasidomėjau tais dalykais plačiau.

Pasirodo pamėgtoji ir populiaroji failų sistema `Ext3
<http://en.wikipedia.org/wiki/Ext3>`_ turi nemažai trūkumų:

- Ji yra pakankamai lėta.

- Praktiškai negalima atstatyti ištrintų failų (nors kartais tai gali būti ir
  privalumas)

- Ext3 failų sistemai nėra jokio įrankio, skirto defragmentacijai.

Yra ir kitų trūkumų, labiau sisteminių.

Pagrindinis dalykas, dėl ko Ext3 yra populiari, tai stabilumas ir
puikus suderinamumas su seniau naudota Ext2 failų sistema.

Kokią gi failų sistemą geriau naudoti?
======================================

Viena iš geriausių, greičiausiai veikiančių ir populiariausių tarp super
kompiuterių, failų sistema yra `GPFS <http://en.wikipedia.org/wiki/GPFS>`_.
Taičiau ši sistema nėra labai pritaikyta paprastiems namų kompiuterių naudotojų
poreikiams ir nėra paprastai įdiegiama.

Realesnis variantas būtų `ReiserFS <http://en.wikipedia.org/wiki/ReiserFS>`_
arba `XFS <http://en.wikipedia.org/wiki/XFS>`_. Abi šios failų sistemos yra
sparčios ir turi naujausias galimybes.

Kai sekantį kartą iš naujo diegsiu Ubuntu, tai ko gero išbandysiu XFS failų
sistemą.

