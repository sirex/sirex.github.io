.. title: Python vs Pascal
.. slug: python-vs-pascal
.. date: 2008-12-19 00:20:00 UTC+02:00
.. tags: python, programavimas
.. type: text

Mokytis programuoti pradėjau dar neturėdamas kompiuterio ir pirmoji
programavimo kalba, kurios mokiausi buvo Pascal_. Iš patirties galiu pasakyti,
kad mokymuisi *pascal* tikrai labai nepatogi. Gal būt galima aiškintis kaip
veikia ciklas ar kiti pagrindiniai valdymo blokai, tačiau jei besimokydamas
bandai suprogramuoti ką nors rimtesnio, didžiąją laiko dalį praleidi
aiškindamasis *pascal* sudėtingas vingrybes, kurios atsiranda dėl pačios kalbos
ribotumo.

.. _Pascal: https://en.wikipedia.org/wiki/Pascal_(programming_language)

Nors *pascal* kalba po truputį tampa istorija, tačiau mokyklose jos vis dar
moko. Ko gero vienintelis ir pagrindinis argumentas, kodėl taip yra ir turėtu
būti: mokomoji medžiaga. Kadangi *pascal* mokoma jau nuo seno, tai yra paruošta
pakankamai mokomosios medžiagos.

Kadangi IT srityje viskas keičiasi tiesiog žaibiškai greitai, tai minėtasis
argumentas tiesiog netenka prasmės. IT sparčiai tobulėja, todėl mokyklos tikrai
neturėtu atsilikti, vien tik tam, kad mokytojai neturi iš ko mokyti... Manau
atsiradus poreikiui, greitai atsirastu ir mokomoji medžiaga, ypač naudojantis
šiuolaikinėmis, bendro turinio rengimo priemonėmis (Lietuviška Vikipedija
puikus pavyzdys).

Kad kalbos, neliktu kalbomis, bandysiu trupai pateikti kelias pagrindines
programavimo pamokas *pascal* ir *python* kalbomis.

Pirmoji pamoka – Sveikas pasauli
================================

Pamokos tikslas – sukirti pačią paprasčiausią programa ir ją paleisti.

**python**

Naudojantis, bet kokiu teksto redaktoriumi sukuriamas programos tekstas. Ir
paleidžiama pati programa::

    python programa.py

**pascal**

Naudojantis, bet kokiu teksto redaktoriumi sukuriamas programos tekstas.
Programos tekstas sukompiliuojamas į mašininį kodą::

    fpc programa

Paleidžiama pati programa::

    ./programa

**python** programos tekstas:

.. code-block:: python

    print("Sveikas pasauli")

**pascal** programos tekstas:

.. code-block:: pascal

    program SveikasPasauli;
    begin
        writeln('Sveikas pasauli');
    end.

*Trūkumai:* Pascal programas reikia kompiliuoti, nėra interpretatoriaus.

*Trūkumai:* Pascal sintaksėje yra daug visokių raktinių žodžių ir simbolių
kuriuos reikia prisimint. Paskutinis programos žodis *end* būtinai turi baigtis
tašku.

Antroji pamoka – Kintamieji
===========================

Pamokos tikslas – pažintis su kintamaisiais.

**python**

.. code-block:: python

    a = 2
    b = 3
    c = a + b + 5
    print("a + b + 5 =", c)

**pascal**

.. code-block:: pascal

    program Kintamieji;
    var a, b, c: integer;
    begin
        a := 2;
        b := 3;
        c := a + b + 5;
        writeln('a + b + 5 = ', c);
    end.

*Trūkumai:* Statiškai tipizuojami kintamieji.

Trečioji pamoka – Sąlygos sakiniai
==================================

Pamokos tikslas – pažintis su kintamaisiais.

**python**

.. code-block:: python

    a = input("Įveskite skaičių: ")

    if a > 5:
        print("Daugiau už 5")
    else:
        print("Mažiau už 6")

**pascal**

.. code-block:: pascal

    program Kintamieji;
    var a: integer;
    begin
        write('Įveskite skaičių: ');
        read(a);
        if a > 5 then
            writeln('Daugiau už 5')
        else
            writeln('Mačiau už 6');
    end.

*Trūkumai:* Reikia įrašyti keistai atrodančią eilutę (``encoding: utf-8``).
Tačiau ši problema sekančioje python versijoje bus išspręsta.

*Trūkumai:* Reikia atsiminti, kad prieš else negalima dėti kabliataškio, kaip
visur kitur.

Ketvirtoji pamoka – Ciklo sakinys
=================================

Pamokos tikslas – pažintis su ciklais.

**python**

.. code-block:: python

    for i in range(10):
        print(i)

**pascal**

.. code-block:: pascal

    program Ciklas;
    var i: integer;
    begin
        for i := 0 to 9 do
        begin
            writeln(i);
        end;
    end.

*Trūkumai:* Reikia atsiminti, kad kai kur reikia naudoti bigin end, o kai kur
ne.

Penktoji pamoka – Procedūrinio programavimo pagrindai
=====================================================

Pamokos tikslas – pažintis su procedūrinio programavimo principais.

**python**

.. code-block:: python

    def ciklas():
        for i in range(10):
            print(i)

    ciklas()

**pascal**

.. code-block:: pascal

    program Proceduros;
    var i: integer;

    procedure ciklas;
    begin
        for i := 0 to 9 do
        begin
            writeln(i);
        end;
    end;

    begin
        ciklas;
    end.

*Trūkumai:* Reikia atsiminti, kad procedūros ir funkcijos aprašomos skirtingai.

*Trūkumai:* Reikia žinoti kurioje tiksliai vietoje ir kokia tvarka reikia
surašyti procedūras.

*Trūkimai:* Ganėtinai sudėtinga parametrų sistema.

Šeštoji pamoka – objektinio programavimo pagrindai
==================================================

Pamokos tikslas – pažintis su objektinio programavimo principais.

**python**

.. code-block:: python

    class ObjektoAprasas:
        parametras = 0

        def metodas(self):
            self.parametras = 1

    objektas = ObjektoAprasas()
    print(objektas.parametras)
    objektas.metodas()
    print(objektas.parametras)

**pascal**

.. code-block:: pascal

    program Objektai;

    {$mode objfpc}
    type TObjektoAprasas = Class(TObject)
        public parametras: integer;
        procedure metodas;
    end;

    procedure TObjektoAprasas.metodas;
    begin
        parametras := 1;
    end;

    var objektas: TObjektoAprasas;

    begin
        objektas := TObjektoAprasas.create;
        writeln(objektas.parametras);
        objektas.metodas;
        writeln(objektas.parametras);
    end.

*Trūkumai:* Labai daug informacijos, kurią reikia žinoti, norint programuoti
objektiškai su *pascal*.

Išvados
=======

*pascal* kalboje, mokantis programavimo, reikia atsiminti labai daug kalbos
specifinių aspektų, kas trukdo suvokti programavimo esmę.  Mokomasi daugiau ne
programuoti, o *pascal* sintaksės ir jos išimčių.  Tuo tarpu *python* kalboje
daugelis pagrindinių programavimo principų realizuojama visiškai paprastai.

*pascal* kalbos pagalba galima iš bėdos demonstruoti nebent elementariausius
programavimo pavyzdžius, tačiau labai sudėtinga aiškinti ir demonstruoti
sudėtingesnius, tačiau šiuolaikinėje programuotojų visuomenėje labai plačiai
taikomus programavimo principus.  Manyčiau, kad *pascal* mokymas mokykloje,
prilygsta aukštosios matematikos mokymui pradinėse klasėse.

