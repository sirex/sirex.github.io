.. title: Duomenų atvėrimo techninė specifikacija
.. slug: duomenu-atverimo-technine-specifikacija
.. date: 2020-12-14 16:46:58 UTC+02:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text

Paskelbta II duomenų atvėrimo etapo `viešojo pirkimo`__ išankstinė `techninė
specifikacija`__ aptarimui. Aptarinėti bus galima iki 2020 gruodžio 23 d.

.. __: https://cvpp.eviesiejipirkimai.lt/Notice/Details/2020-692551
.. __: https://pirkimai.eviesiejipirkimai.lt/app/rfq/publicpurchase_docs.asp?PID=555045

Oficialiai, pastabas reikėtų teikti per viešųjų pirkimų sistemą. Neoficialiai,
šiaip laisvam aptarimui (kam įdomu), pastabas galima teikti per `Google Docs`__.

.. __: https://docs.google.com/document/d/1mFOiOJQo1_dkZuRcIG6ODKfgdrdKP_M-sgYSYFHBVsY/edit?usp=sharing

Viso II duomenų atvėrimo etape dalyvauja 50 įstaigų, tačiau konkrečiai šiame
centralizuotame pirkime dalyvauja 29 įstaigos. Likusios 21 įstaiga duomenis
atvers savo jėgomis arba su rangovų pagalba.

Centralizuotas pirkimas išskaidytas į 29 dalis, tai reiškia, kad kiekvieną dalį
gali laimėti skirtingi tiekėjai arba vienas tiekėjas gali laimėti visas dalis.
Su viešaisiais pirkimais, kaip visada, nežinia ką gausi. Viešuosius pirkimus
laiminčios įmonės yra suinteresuotos gauti kuo daugiau pelno ir padaryti kuo
mažiau darbo. Tikiuosi, kad į techninę specifikaciją pavyko sudėti pakankamai
saugiklių, kad išlaikyti gerą kainos ir darbo santyki.


Techninė specifikacija
======================

Pati techninė specifikacija yra gan glausta ir didžiąja dalimi remiasi `atvirų
duomenų vadovu`__. Atvirų duomenų vadove yra pateikta išsami `Duomenų
struktūros aprašo specifikacija`__ (DSA).

.. __: https://data.gov.lt/page/vadovas
.. __: https://data.gov.lt/page/aprasas

DSA yra kažkas panašaus į DSL_ vienos lentelės pavidalu. DSA lentelės pagalba
galima atlikti duomenų inventorizacija, aprašant, kokie duomenys yra
valstybinių įstaigų duomenų bazėse, atlikti tam tikras transformacijas
gerinant duomenų brandos lygį ir generuoti DSA pagrindu veikiantį API, kuris
leidžia duomenis konvertuoti į eilę formatų. DSA yra suderinamas su DCAT
duomenų katalogo standartu ir su eile kitų duomenų formatų.

.. _DSL: https://en.wikipedia.org/wiki/Domain-specific_language

Tai iš esmės, tiekėjas turės atlikti du esminius darbus:

1. Parengti įstaigos duomenų DSA lentelę (arba tiksliau ADSA).

.. _ADSA: https://atviriduomenys.readthedocs.io/inventorinimas.html#adsa

2. Atverti įstaigos duomenis ir juos publikuoti taip, kad jie atitiktų parengtą
   ADSA lentelę.

Būtų tobula, tiesiog gauti komandą, su kuria galėtume dirbti prie duomenų
atvėrimo, bet deja, tenka naviguoti visokiais viešųjų pirkimų aplinkeliais.

Bet kokiu atveju, pagrindinis noras, kad duomenų atvėrimas vyktų sistemingai ir
vieningai. Priešingu atveju, duomenų atvėrimas bus labai neefektyvus, jei
kiekviena įstaiga bandytų duomenų atvėrimą darytis nuo nulio.

Techninėje specifikacijoje rekomenduojama naudoti vieningus įrankius duomenų
atvėrimui, o iš kitos pusės keliami pakankamai aukšti reikalavimai, kad
bandant duomenis atverti kiekvienai įstaigai nuo nulio, tiesiog bus
neišsitekta biudžete.

Dėl vieningų įrankių, techninėje specifikacijoje rekomenduojama naudoti mano jau
daugiau kaip metus laiko vystomą duomenų atvėrimo priemonę Spinta_. Tačiau,
viešuosiuose pirkimuose negalima reikalauti naudoti konkrečių priemonių, todėl
tiekėjas gali pasirinkti, bet kokias kitas priemones.

.. _Spinta: https://gitlab.com/atviriduomenys/spinta/

Nepriklausomai nuo to, ar tiekėjas tęs mano pradėtą darbą ar nuspręs viską
daryti nuo nulio, visoms įstaigoms turėtu būti pernaudojamos tos pačios
priemonės ir kiekvieną kartą atveriant vis daugiau duomenų, priemonės vis
tobulinamos.

Atrodo, kad duomenų atvėrimas yra vienkartinis darbas, bet taip nėra, kadangi
atveriami duomenys turi būti publikuojami nuolat. Todėl darant visą tai
sistemingai, pataisius problemas vienoje vietoje, jos bus išspręstos visose
įstaigose vienu kartu.

Todėl tikiuosi, kad nepriklausomai nuo to, kas laimės viešąjį pirkimą, duomenų
atvėrimas vyks vieningai, sistemingai ir efektyviai.


Dalyvių sąrašas
===============

Deja, šiame viešajame pirkime dalyvių sąrašas yra fiksuotas ir tikriausiai jo
keisti nebegalima. Kadangi viešuosiuose pirkimuose, reikia tiksliai nurodyti
perkamo dalyko kiekį, tai šiuo atveju perkamas kiekis yra duomenų rinkinių
skaičius, kuris yra fiksuotas.

Tačiau, tai liečia, tik konkrečiai šį viešąjį pirkimą. Įstaigoms niekas
nedraudžia papildomai atverti daugiau duomenų nei buvo numatyta, tik tai
reikėtu daryti ne šio pirkimo rėmuose. Yra daug pavyzdžių, kai įstaigos
atveria duomenis savarankiškai be jokių pirkimų.



Poreikio deklaravimas
=====================

Jei jums reikia kažkokių duomenų, kurių nėra II duomenų atvėrimo etape,
oficiali vieta, kur galima išreikšti poreikį yra `atvirų duomenų katalogas`_
(ADK).

.. _atvirų duomenų katalogas: https://data.gov.lt/

Teoriškai visos Lietuvos įstaigos turėtu paskirti atvirų duomenų įgaliotinį,
kuris būtų atsakingas už tos įstaigos atvirus duomenis. Įgaliotinis
registruojamas ADK ir turėtu atsakyti į visus iškilusius klausimus dėl atvirų
duomenų.

Ieškant duomenų, pirmiausiai reikėtų pažiūrėti, gal būt jie jau yra atverti
ar bent jau inventorizuoti:

https://data.gov.lt/datasets

Jei ADK publikuojami duomenų rinkiniai netenkina, tada yra galimybė teikti
pastabas. Pastabas galite teikti paprasto komentaro forma arba paspaudžiant
mygtuką „Teikti poreikį duomenų rinkinio keitimui“, kuris nuves į „Registruoti
poreikį duomenų rinkinio keitimui“. Minėtoje formoje pažymėjus „Papildyti
duomenų rinkinį naujais duomenimis“ galėsite tiksliai nurodyti kokių duomenų
laukų trūksta ar gal būt reikalinga kelti tam tikrų duomenų laukų brandos lygį.

Trūkstamus duomenų laukus galite pateikti ir prisegant DSA lentelę.

Jei reikalingas duomenų rinkinys nėra registruotas ADK, tada galima
deklaruoti poreikį trūkstamam duomenų rinkiniui, tai daroma šiuo adresu:

https://data.gov.lt/requests/new

Galiausiai, užklausimas bus priskirtas konkrečiai įstaigai, kuri paklausimą
turės peržiūrėti ir atverti duomenis arba paaiškinti, kodėl duomenys negali
būti atverti.

Bent jau mano asmenine nuomone, ADK turi daug trūkumu ir nėra labai patogus ir
aiškus, bet šiuo metu tai yra vienintelė oficiali priemonė, kurios pagalba
galima deklaruoti duomenų poreikį. Todėl kviečiu šią priemonę naudoti, nes
anksčiau ar vėliau į ADK pateiktą duomenų poreikį bus atsižvelgta arba bent
jau pateiktos priežastis, kodėl duomenys negali būti atverti.

