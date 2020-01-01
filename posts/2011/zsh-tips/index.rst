.. title: ZSH Tips
.. slug: zsh-tips
.. date: 2011-10-06
.. tags: zsh, shell
.. type: text

Failų sąrašo išskleidimas
=========================

Elementariausias pavyzdys::

    ls *

Šiuo atveju, bus išskleidžiami visi failai, esantis aktyviame kataloge.

Zsh failų sąrašo išskleidimui galima naudoti modifikatorius, kuriuos reikia
nurodyti skliausteliuose. Pavyzdys::

    ls -lt **/*.rst(.om[0,8])

Pavyzdyje ``**/`` rekursyviai išskleis visus failus ir katalogus su
pakatalogiais ir failais juose. ``*.rst`` išskleidžia bet kokius failus ar
katalogus, su galūne ``.rst``. Toliau skliausteliuose nurodomi modifikatoriai,
iš kurių ``.`` išskleidžia tik paprastus failus, ``om`` rezultatą rūšiuoja
pagal failo keitimo datą, ``[0,8]`` išskleidžia tik pirmus aštuonis failus.

Failo tipo modifikatoriai
-------------------------

========== ====================================================
``*(/)``   tik katalogus
``*(.)``   tik failus
``*(@)``   tik simbolines nuorodas
``*(=)``   tik socket failus
``*(p)``   tik named pipe (FIFO)
``*(*)``   tik vykdomuosius failus (bet ne katalogus)
``*(%)``   tik įrenginių failus (simbolių arba blokų tipo)
``*(%b)``  tik blokų tipo specialiuosius failus
``*(%c)``  tik simbolių tipo specialiuosius failus
========== ====================================================

Pavyzdžiai::

    ls *(/)

Parodyti aktyviame kataloge esančius pakatalogius.

::

    ls *(*)

Parodyti aktyviame kataloge esančius vykdomuosius failus.

Failų teisių modifikatoriai
---------------------------

Pagal failų skaitymo, rašymo ir vykdymo teises:

========== ============= =========== ============
-          gali skaityti gali rašyti gali vykdyti
---------- ------------- ----------- ------------
savininkas ``*(r)``      ``*(w)``    ``*(x)``
grupė      ``*(A)``      ``*(I)``    ``*(E)``
visi       ``*(R)``      ``*(W)``    ``*(X)``
========== ============= =========== ============

Pagal tiksliai nurodytas failų teises::

    *(fCHMOD)

Išskleisti tik tuos failus, kurių teisės tiksliai atitinka nurodytą CHMOD
teisių aprašą. CHMOD turi būti septintainis skaičius, pavyzdžiui: *0755*.

Pagal specialiąsias failų teises:

========= ======================================
``*(s)``  tik setuid failus (04000)
``*(S)``  tik setgid failus (02000)
``*(t)``  tik failus su sticky bitu (01000)
========= ======================================

Pagal failų savininkus ir grupes:

============= ===================================================
``*(U)``      savininkas yra einamasis naudotojas
``*(G)``      grupė yra einamojo naudotojo grupė
``*(uUID)``   savininkas yra UID
``*(gGID)``   savininkas yra GID
============= ===================================================

Failų atidarymo ir keitimo modifikatoriai
-----------------------------------------

Gali būti tokie modifikatoriai::

    *(a[Mwhm][-|+]n)
    *(m[Mwhm][-|+]n)
    *(c[Mwhm][-|+]n)

Pirmoji raidė reiškia:

= =====================================
a failo atidarymo laikas
m failo informacijos keitimo laikas
c failo turinio keitimo laikas
= =====================================

Antroji raidė reiškia:

= ==========
M mėnuo
w savaitė
h valanda
m minutė
= ==========

Jei antroji raidė nenurodyta, laikas bus skaičiuojamas dienomis.

Trečiasis simbolis gali būti (-) - nurodo išskleisti failus, kurių nurodytas
laiko parametras yra mažesnis už *n*, (+) - nurodo išskleisti failus, kurių
nurodytas laiko parametras yra didesnis nei *n*. Jei trečiasis simbolis
nenurodytas, bus išskleidžiami tik tie failai, kurie tiksliai atitinka nurodytą
laiko parametrą.

Paskutinis simbolis arba likę simboliai yra skaičius, kuris nurodo laiko kiekį.

Pavyzdys::

    ls *(c-3)

Bus išskleisti failai, kurių turinys buvo keistas trijų dienų bėgyje.

::

    ls *(ch+5)

Bus išskleisti failai, kurių turinys buvo keistas daugiau nei prieš 5 valandas.


Naudotų komandų pernaudojimas
=============================

Pernaudoti anksčiau panaudotas komandas, galima šauktuko (``!``) simbolio
pagalba. Pavyzdžiai:

============= ===========================================================
``!!``        prieš tai įvesta komandos eilutė
``!#``        visa, šiuo metu įvesta komanda, komandų eilutėje
``!1``        pirma įvesta komanda iš komandų istorijos
``!-2``       antra nuo galo komanda
``!?ls``      paskutinė komanda iš komandų istorijos, prasidedanti ``ls``
============= ===========================================================

Komandų argumentų pernaudojimas
-------------------------------

Galima pernaudoti ne tik visą komandų eilutę, bet tik tam tikrus jos
argumentus. Žemiau pateikti pavyzdžiai su prieš tai įvesta komanda:

============= =============================================================
``!^``        pirmas argumentas
``!$``        paskutinis argumentas
``!*``        visi argumentai
``!:2``       antras argumentas
``!:3*``      visi argumentai, nuo trečio iki pabaigos
``!:3-``      visi argumentai, nuo trečio iki pabaigos, išskyrus paskutinį
``!:1-3``     argumentai, nuo antro iki trečio
============= =============================================================


Keitiniai
=========

Kelio keitiniai:

============= ==================================================================
``:h``        pašalina vieną kelio elementą, nuo kelio pabaigos
``:t``        grąžina paskutinį kelio elementą (failo ar katalogo pavadinimą)
``:r``        pašalina failo plėtinį
``:e``        palikti tik failo plėtinį
``:a``        absoliutus kelias
``:A``        absoliutus kelias, išskleidžiant simbolines nuorodas
============= ==================================================================

Raidžių keitimas didžiosiomis/mažosiomis:

============= ==================================================================
``:l``        keičia raides mažosiomis 
``:u``        keičia raides didžiosiomis
============= ==================================================================

Kabučių valdymas:

============= ==================================================================
``:q``        uždeda kabutes, kad keitinį būtų galima naudoti kitiems keitiniams
``:x``        uždeda kabutes visoms dalims, atskirtoms tarpais
``:Q``        pašalina kabutes
============= ==================================================================

Žodžių paieška ir keitimas:

============= ==================================================================
``:s``        randa ir keičia žodžius, pvz.: ``:s/abc/xyz/``
``:&``        kartoti paskutinį ``:s`` keitinį dar kartą
``:g``        globaliai taikyti ``:s`` arba ``&``
============= ==================================================================

Kita:

============= ==================================================================
``:p``        išveda keitinį, jo nevykdydamas
============= ==================================================================

