.. title: Kaip paleisti Web serverį, per 5 sekundes su Python
.. slug: kaip-paleisti-web-serveri-per-5-sekundes-su-python
.. date: 2009-09-23 21:39:00 UTC+02:00
.. tags: floss, python, shell
.. type: text

Jei kada nors prireiks greitai paleisti Web serverį ir nenorėsite gaišti laiko
konfigūruodami Apache ar panašiai, tuomet Python jums padės!

Python savo didžiulėje standartinėje bibliotekoje turi HTTP serverio modulį.
Panaudoję šį labai paprastą HTTP serverio modulį, labai greitai galite paversti
bet kurį katalogą į Web serverio šakninį katalogą. Tam reikės turėti tik
įdiegtą Python.

Tai labai naudinga, jei norite tinkle ar internete paviešintį kokius nors
failus. Serveris paleidžiamas vienos komandos pagalba.

Tarkime norite paviešinti katalogą ``/home/vardenis/public/``. Tokiu
atveju įveskite šias komandas::

    $ cd /home/vardenis/public/
    $ python -m http.server

Ir viskas! Tai tiesiog veikia, galite tuo įsitikinti naršyklėje atvėrę šį
adresą:

-  `localhost:8000 <http://localhost:8000/>`_

Plačiau apie tai galite pasiskaityti `linuxjournal.com
<http://www.linuxjournal.com/content/tech-tip-really-simple-http-server-python>`_.

