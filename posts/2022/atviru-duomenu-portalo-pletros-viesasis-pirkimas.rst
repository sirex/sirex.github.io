.. title: Atvirų duomenų portalo plėtros viešasis pirkimas
.. slug: atviru-duomenu-portalo-pletros-viesasis-pirkimas
.. date: 2022-03-06 10:02:34 UTC+02:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text


Pagaliau paskelbtas atvirų duomenų portalo plėtros `viešasis pirkimas`__!

__ https://cvpp.eviesiejipirkimai.lt/Notice/Details/2022-632840

.. admonition:: Įspėjimas

    Visa mano asmeniniame bloge pateikta nuomonė yra mano asmeninė subjektyvi
    nuomonė, o ne oficiali IVPK pozicija.


Kviečiu dalyvauti šio viešojo pirkimo konkurse ir prisidėti prie atvirų duomenų
proveržio!

Nors yra parengta pirkimo `techninė specifikacija`_, tačiau papildomai noriu
padaryti trumpą apžvalgą apie tai ką turime ir ko mums reikia.

.. _techninė specifikacija: https://pirkimai.eviesiejipirkimai.lt/app/rfq/publicpurchase_docs.asp?PID=611632&LID=723637&AllowPrint=1

Atvirų duomenų portalas susideda iš šių dalių:

- data.gov.lt_ - atvirų duomenų katalogas, viena vieta, kurioje galima rasti
  visus šalies atvirus duomenis.

  .. _data.gov.lt: https://data.gov.lt/

- get.data.gov.lt_ - atvirų duomenų saugykla, tai yra atvirų duomenų talpinimo
  ir publikavimo paslauga, kur duomenys publikuojami įvairiais formatais,
  per vieningą API.

  .. _get.data.gov.lt: https://get.data.gov.lt/

- Spinta_ - komandinės eilutės priemonių rinkinys skirtas duomenų
  inventorizacijai, kokybės užtikrinimui ir perdavimui publikuoti.

  .. _Spinta: https://github.com/atviriduomenys/spinta

- `Duomenų struktūros aprašas`_ - susitarimas, kaip aprašomi atveriami duomenys,
  šio susitarimo dėka atsiranda galimybė automatizuoti daugelį veiklų susijusių
  su duomenų atvėrimu. Tai yra DCAT_ išplėtimas, leidžiantis aprašyti į duomenų
  rinkinį įeinančių distribucijų turinį, tokiu formatu, kuris yra patogiausias
  valstybinių įstaigų duomenų rinkinių tvarkytojams.

  .. _Duomenų struktūros aprašas: https://atviriduomenys.readthedocs.io/dsa/index.html
  .. _DCAT: https://www.w3.org/TR/vocab-dcat-2/

- `Atvirų duomenų vadovas`_ - nuolat tobulinama dokumentacija, parašyta
  naudojant Sphinx_ ir reStructuredText_.

  .. _Atvirų duomenų vadovas: https://atviriduomenys.readthedocs.io/
  .. _Sphinx: https://www.sphinx-doc.org/
  .. _reStructuredText: https://docutils.sourceforge.io/rst.html

Vykdanti Atvirų duomenų portalo plėtros darbus, bus vystomos visos dalys.

Trumpai apie tai, kaip numatyta vykdyti šio viešojo pirkimo darbus.

- Darbai bus vykdomi vadovaujantis SCRUM_ projektų valdymo metodologija.

  .. _SCRUM: https://en.wikipedia.org/wiki/Scrum_(software_development)

- `Product owneris`_ yra programuotojas, gerai susipažinęs su projekto
  specifika ir žinantis ką reikia daryti.

  .. _Product owneris: https://en.wikipedia.org/wiki/Scrum_(software_development)#Product_owner

- Atsiskaitymas valandinis, už konkrečiai atliktus darbus, pagal iš anksto
  parengtas užduotis `GitHub platformoje`__.

  __ https://github.com/atviriduomenys/

- Kiekviena įgyvendinta funkcija turi turėti `gerą padengimą testais`__.

  __ https://en.wikipedia.org/wiki/Test-driven_development

- Įgyvendintoms funkcijoms bus atliekamas `code review`_.

  .. _code review: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews

- Projektai prie kurių bus dirbama yra atviro kodo (Katalogo dalis dar nėra
  atverta, bet planuojama atverti). Todėl iš esmės prie projekto vystymo gali
  prisijungti bet kas.

- Projekto užduočių sąrašas taip pat atviras ir viešai prieinamas.



data.gov.lt
===========

:projektas:
    https://data.gov.lt/

:technologija: Linux, Java

:kodas:
    https://github.com/atviriduomenys/katalogas (kol kas dar neatvertas,
    bet planuojama atverti)

:užduotys:
    https://github.com/atviriduomenys/katalogas/issues (negalutinis ir nuolat
    pildomas)

Atvirų duomenų katalogas, parašytas su Java. Yra atskira administravimo dalis
ir viešoji dalis.

Katalogas neturi automatinių testų, todėl prieš pradedant darbus, reikės
pasidengti esamą funkcionalumą testais, kad nesugriauti to, kas jau veikia.

Nemaža dalis administravimo funkcijų bus perkeliamos į viešąją dalį, siekiant
didinti patogumą naudoti, mažinti funkcijų kiekį, kurias reikia palaikyti.

Didžiausias dėmesys bus skiriamas viešajai daliai ir integracijai su duomenų
struktūros aprašo specifikacija ir Saugykla.

Esamos funkcijos, kurios turėtu išlikti arba bus minimaliai tobulinamos:

- Titulinis puslapis

- Organizacijų sąrašas

- Rinkinių sąrašas

- Partnerių API - turi būti išlaikomas atgalinis suderinamumas

- Viešasis API - turi būti išlaikomas atgalinis suderinamumas

- Prisijungimas per el. valdžios vartus

Esamos funkcijos, kurios bus perdaromos arba stipriai keičiamos:

- Bus perkeliamas visas duomenų teikėjų koordinatorių ir tvarkytojų
  funkcionalumas, integruojanti į viešąją dalį, papildant pilnu duomenų
  struktūros aprašo administravimu. Mano vertinimu, įgyvendinti tai
  administravimo dalyje bus per daug sudėtinga, be to, tai būtų dvigubas
  darbas.

- Integracija su išoriniais duomenų katalogais

- Integracija su Europos duomenų portalu

- Duomenų šaltinių sąrašas

- Duomenų peržiūra (integracija su Saugykla)

- Poreikiai ir pasiūlymai

- Panaudojimo atvejai

- Ataskaitos

- Atvėrimo planavimas

Esamos funkcijos, kurios bus perkeliamos ant esamų atviro kodo sprendimų:

- Visas administravimas, skirtas vyriausiajam administratoriui, tokių naudotojų
  yra vos keli.

- Visas turinio valdymo administravimas.

- Naujienos.

Naujas funkcionalumas:

- Integracija su Saugykla, DCAT 3.0, duomenų struktūros aprašo specifikacijos
  palaikymas, palaikymas, apraše pateikiamų metaduomenų administravimas ir
  atvaizdavimas.

- Užduočių valdymas, užduotys gali ateiti iš įvairių vietų, automatiniai
  patikrinimai, naudotojų pranešimai ir pan.



get.data.gov.lt ir spinta
=========================

:projektas:
    https://get.data.gov.lt/

:technologija: Linux, Python

:kodas:
    https://github.com/atviriduomenys/spinta

:užduotys:
    https://github.com/atviriduomenys/spinta/issues (negalutinis ir nuolat
    pildomas)

get.data.gov.lt ir spinta yra vienas projektas, viena kodo bazė, kuris veikia
kaip komandinės eilutės priemonių rinkinys ir kaip duomenų publikavimo
serveris.

Spinta projektas parašytas naudojant Python programavimo kalbą. Šis komponentas
atsakingas už automatinį duomenų publikavimą (get.data.gov.lt) ir automatinį
duomenų atvėrimą (komandinės eilutės įrankis).

Kodo padengimas testais geras, yra virš 1000 unit testų, testais padengta apie
90% kodo.

Visas duomenų valdymo funkcionalumas yra dinaminis, interpretuojant tai, kas
yra parašyta `duomenų struktūros apraše`__. Nors yra padarytas tam tikras
karkasas, tačiau gali tekti susidurti su `interpretatoriaus lygio kodo`__
rašymu.

__ https://atviriduomenys.readthedocs.io/dsa/index.html
__ https://en.wikipedia.org/wiki/Interpreter_(computing)

Esamos funkcijos, kurios bus tobulinamos:

- Duomenų struktūros aprašo ir duomenų kokybės tikrinimas, pateikiant aptiktas
  klaidas pačiame duomenų struktūros apraše, komentarų pavidalu.

- Struktūros aprašo schemos keitimų valdymas (migracijos).

- Duomenų filtravimo funkcionalumo tobulinimas.

- Optimizavimas, greitaveikos ir stabilumo didinimas.

Naujas funkcionalumas:

- Naujų duomenų šaltinių palaikymas: CSV, JSON, XLSX, XML, HTML.

- Naujų publikavimo formatų palaikymas: RDF, TTL, SQL.

- Duomenų vizualizacija (pagal duomenų tipą).

- Naujų transformacijos funkcijų palaikymas.

- Struktūros aprašų valdymas per API.

- API klientų valdymas per API.

- Trūkstamų duomenų struktūros aprašo specifikacijos punktų įgyvendinimas.

- Ribojamo panaudojimo tikslo duomenų publikavimas.

- SPARQL paieška.


Istorija
========

Tiems, kam patinka platesnis vaizdas, truputis istorijos, kaip iki čia atėjome.
Tai nėra pilna istorija, tik ta dalis, kuri mano manymu turėjo tiesioginę įtaką
po to sekusiems įvykiams.

Aš pats į veiklą susijusią su atvirais duomenimis įsitraukiau nuo 2012 metų.

- `2006-10-10`__ - Pradėtas pildyti informacijos rinkmenų sąrašas.

  __ https://ivpk.lrv.lt/lt/naujienos/pradetas-pildyti-informacijos-rinkmenu-sarasas

- `2012-07-31`__ - Ūkio viceministras Rimantas Žylius pradėjo kalbėti apie
  atvirus duomenis.

  __ https://atviriduomenys.wordpress.com/2012/07/31/rimantas-zylius-apie-atvirus-duomenis/
  .. https://www.slideshare.net/ukmin/atviri-valdios-duomenys-13812310

- `2012-10-08`__ - sukurta Lietuvos atvirų duomenų naudotojų el. pašto grupė.

  __ https://groups.google.com/g/atviriduomenys

- `2013-01-05`__ - atvirų duomenų galimybių studija (Kurk Lietuvai).

  __ https://kurklt.lt/projektai/viesojo-sektoriaus-duomenu-atverimas-visuomenei-i/

- `2014-10-09`__ - atvirų duomenų galimybių studija (IVPK).

  __ http://www.cvpp.lt/index.php?option=com_vpt&theme=new&task=view&tender_id=207685

- `2014-10-27`__ - pradėjau savo atvirų duomenų platformos vizijos įgyvendinimo
  darbus, tuo metu projektą vadinau kodiniu pavadinimu ``databot``, vėliau šio
  projekto pagalba esu `atvėręs 15-os oranizacijų duomenis`__.

  __ https://github.com/sirex/databot
  __ https://github.com/sirex/databot-bots/tree/master/bots

- `2015-05-26`__ - pradėjau atvirų duomenų bendruomenės vystomą projektą
  atviriduomenys.lt, kaip alternatyvą tuo metu veikiančiam opendata.gov.lt.

  __ https://github.com/sirex/atviriduomenys.lt

- `2016-08-29`__ - atvirų duomenų platformos investicijų projektas.

  __ http://www.cvpp.lt/index.php?option=com_vpt&theme=new&task=view&tender_id=301773

- `2017-07-31`__ - perkėliau opendata.gov.lt į ckan.opendata.gov.lt.

  __ https://github.com/sirex/opendata.gov.lt-mysql-import

- `2017-12-29`__ - atvirų duomenų platformos projekto pradžia.

  __ https://ivpk.lrv.lt/lt/apie-ivpk/vykdomi-projektai/atviru-duomenu-platformos-igalinancios-efektyvu-viesojo-sektoriaus-informacijos-pakartotini-panaudojima-verslui-ir-jos-valdymo-irankiu-sukurimas

- `2018-02-01`__ - atvirų duomenų platformos metodikos projektas.

  __ https://cvpp.eviesiejipirkimai.lt/Notice/Details/2018-193997

- `2018-09-05`__ - mano pasiūlyta atvirų duomenų platformos vizija.

  __ link://slug/kaip-galetu-atrodyti-lietuvos-atviru-duomenu-portalas

- `2019-02-01`__ - remiantis ``databot`` projekto idėjomis ir patirtimi,
  pradėjau naują projektą, kodiniu pavadinimu ``spinta``, šio projekto
  paskirtis - duomenų atvėrimo proceso standartizavimas ir automatizavimas.

  __ https://github.com/atviriduomenys/spinta

- `2019–02–12`__ - paskelbtas atvirų duomenų portalo kūrimo viešasis pirkimas,
  šio projekto metu buvo atverti penkių įstaigų duomenys.

  __ link://slug/paskelbtas-atviru-duomenu-portalo-viesasis-pirkimas

- `2020-07-01`__ - startuoja data.gov.lt - Lietuvos atvirų duomenų portalas.

  __ https://eimin.lrv.lt/lt/naujienos/startuoja-atviru-duomenu-portalas

- `2020-10-19`__ - kadangi labai senai bendraujam ir iš esmės konkuruojam su
  IVPK atvirų duomenų srityje, galiausiai nusprendžiau įsidarbinti IVPK, kad
  galėtume apjungti jėgas siekiant vieno bendro tikslo - atvirų duomenų
  proveržio.

  __ link://slug/duomenu-atverimo-vyriausiasis-specialistas

- `2020-12-01`__ - parengta duomenų struktūros aprašo techninė specifikacija,
  kurios pagrindu sudaroma galimybė automatizuoti duomenų atvėrimą.
  Specifikacija paremta mano šešių metų patirtimi ieškant būdų, kaip
  optimizuoti ir paspartinti duomenų atvėrimą viešajame sektoriuje.

  __ https://atviriduomenys.readthedocs.io/dsa/index.html

- `2020-12-14`__ - paskelbtas II duomenų atvėrimo etapo viešasis pirkimas,
  tačiau netrukus šis pirkimas buvo nutrauktas ir Vyriausybės sprendimu
  perduotas Statistikos departamentui. Tačiau pradėti darbai standartizuojant
  ir automatizuojant duomenų atvėrimą išliko aktualūs, kadangi VDV IS nėra
  skirta duomenų atvėrimui ar publikavimui. Todėl buvo pradėta rašyti nauja
  techninė specifikacija, tiek pačio atvirų duomenų katalogo, tiek atvėrimo
  automatizavimo ir publikavimo priemonių plėtrai. Deja, toks staigus
  pasikeitimas, kainavo praktiškai metus laiko.

  __ link://slug/duomenu-atverimo-technine-specifikacija

- `2021-03-01`__ - paleista atvirų duomenų publikavimo paslauga get.data.gov.lt
  vadinama Saugykla, kuri veikia atviro kodo ``spinta`` projekto pagrindu,
  prie kurio dirbau paskutinius tris metus.

  __ https://get.data.gov.lt/

- `2021-03-31`__ - Saugykloje publikuoti pirmieji duomenys, kuriuos publikavo
  Statistikos departamento.

  __ https://get.data.gov.lt/datasets/gov/lsd/covid19/:ns

- `2021-09-06`__ - Saugykloje publikuoti pirmieji duomenys pilnai automatizuotu
  būdu, kuriuos publikavo Standartizacijos departamentas.

  __ https://get.data.gov.lt/datasets/gov/lst/terms/:ns

- `2022-02-25`__ - Paskelbtas atvirų duomenų portalo plėtros viešasis pirkimas,
  kuris realiai turėjo prasidėti daugiau nei prieš metus.

  __ https://cvpp.eviesiejipirkimai.lt/Notice/Details/2022-632840


