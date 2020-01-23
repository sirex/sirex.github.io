.. title: Atviri duomenys: 2019 metų apžvalga
.. slug: open-data-overview
.. date: 2020-01-23 19:33:38 UTC+02:00
.. tags: opendata
.. category: 
.. link: 
.. description: 
.. type: text

Jau praėjo beveik metai, kai pradėjau kurti atvirų duomenų platformą.
Platformą statau ant duomenų valdymo karkaso, kurį pavadinau Spinta_.
Pavadinimas Spinta man asociuojasi su tuo, kad kuriama platforma yra kaip
didžiulė spinta į kurią kraunami duomenys. Šiuo atveju, Spintą reikėtų labiau
įsivaizduoti kaip `Niutono Salamanderio lagaminą`__ iš `fantastiškų gyvūnų
filmo`__, kur lagaminas tikriausiai yra begalinės talpos. Panašiai ir Spinta,
kurio teoriškai galima saugoti begalinį kiekį duomenų.

.. __: https://harrypotter.fandom.com/wiki/Newton_Scamander%27s_suitcase
.. __: https://www.imdb.com/title/tt3183660/

Be Spintos yra dar vienas projektas, kurį pavadinau `Atvirų duomenų
manifestu`__. Šiuo atveju, manifestas reiškia lapelį užklijuotą ant spintos
durų. Tame lapelyje surašyta, kas yra spintos viduje - visų spintoje talpinamų
duomenų sąrašas su informacija iš kur tie duomenys atėjo, kur saugomi ir pan.

Pirmąsias Spintos kodo eilutes parašiau `2019 metų vasario 1 d.`__. Šiuo metu
prie šio projekto dirbam tryse, per metus laiko padarėm 700 kodo pakeitimų,
parašėm apie 10 tūkstančių kodo eilučių.

Noriu pasidalinti, kaip man sekėsi per praėjusius metus, kodėl priėmiau
vienokius ar kitokius sprendimus ir kur projektas yra šiuo metu.


Kodėl nusprendžiau kurti naują atvirų duomenų platformą?
========================================================


IVPK jau kuria atvirų duomenų platformą, kam kurti savo?
========================================================


Kodėl tiesiog nenaudoju RDF duomenims aprašyti?
===============================================


Kodėl duomenims aprašyti neužtenka manifesto YAML failų?
========================================================


Kodėl nuspręsta pirmiausia atverti žalius duomenis?
===================================================


Kodėl projektas taip ilgai užsitęsė?
====================================




Projekto kaina
==============

Remiantis SLOCCount_ skaičiavimais viso parašyta apie 1000 kodo eilučių,
neskaičiuojant testų (automatinių testų viso 7414 eilučių) ir numatoma bendra
projekto kaina api 250 tūkstančių €.

.. __: https://gitlab.com/atviriduomenys/spinta/commit/6ede272f66cb5875ae94c99fa76c268d559434d5

    .. class:: full-width right-align-right-col

    +----------------------------------------------------------------+--------------+
    | Total Physical Source Lines of Code (SLOC)                     |        9,576 |
    +----------------------------------------------------------------+--------------+
    | | Development Effort Estimate, Person-Years (Person-Months)    | 2.14 (25.73) |
    | | *(Basic COCOMO model, Person-Months = 2.4 * (KSLOC**1.05))*  |              |
    +----------------------------------------------------------------+--------------+
    | | Schedule Estimate, Years (Months)                            |  0.72 (8.59) |
    | | *(Basic COCOMO model, Months = 2.5 * (person-months**0.38))* |              |
    +----------------------------------------------------------------+--------------+
    | Estimated Average Number of Developers (Effort/Schedule)       |         3.00 |
    +----------------------------------------------------------------+--------------+
    | | Total Estimated Cost to Develop                              |    € 262,354 |
    | | *(average salary = $50,980/year, overhead = 2.40).*          |              |
    +----------------------------------------------------------------+--------------+

Nežinau kiek tiesos tame yra, bet kad prie projekto dirbo 3 žmonės pataikė gan
tiksliai. O pati kaina tikriausiai irgi gautūsi panaši.

.. __: https://gitlab.com/atviriduomenys/manifest

.. _SLOCCount: https://dwheeler.com/sloccount/
.. _Spinta: https://gitlab.com/atviriduomenys/spinta
