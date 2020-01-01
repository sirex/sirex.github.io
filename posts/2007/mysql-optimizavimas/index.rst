.. title: MySQL optimizavimas
.. slug: mysql-optimizavimas
.. date: 2007-05-17 21:24:00 UTC+02:00
.. tags: mysql
.. type: text

.. default-role:: literal

Neperseniausiai žiūrėjau `konferenciją apie tai, kaip galima optimizuoti MySQL
duombazę
<http://video.google.com/videoplay?docid=2524524540025172110&q=google+engedu>`_.
Iš esmės daugelis dalykų buvo jau žinoma iš anksčiau arba tiesiog suvokiami
pasitelkus loginį mąstymą. Tačiau sužinojau ir keletą naujų dalykų.

Nauji dalykai susiję su kešavimu. Daugelis programuotojų, rašydami programas,
bando išrasti dviratį ir bando optimizuoti savo pačių kodą.  Reikia atminti,
kad tokie dalykai kaip mysql, savyje turi taip pat labai daug visokių
optimizacijų. Dėl šios priežasties nereikia stengtis kažką išrasti, o reikia
tiesiog naudoti tai, kas yra padaryta. MySQL turi tokų dalyką kaip „query
cache“, šio dalyko pagalba, jei dar kartą iškviečiama tokia pati užklausą ir
duomenys praktiškai nepakito, tada tiesiog grąžinamas užkešuotas rezultatas
neatliekant jokių veiksmų pačioje duombazėje. Dėl kešavimo taip pat reikia
žinoti, kad atliekant operacijas su datomis, kai reikia palyginti su šios
dienos data, reikia naudoti funkciją `CURRENT_DATE()`, o ne `DATE()`. Nes jei
kreipiamasi į funkciją `CURRENT_DATE()`, tada gautasis rezultatas kešuojamas, o
funkcijos `DATE()` rezultatas nekešuojamas, nes ši funkcija grąžiną tikslų
laiką.

Tai gi mano manymu, daugiausią ką gali padarti optimizuodamas yra kešavimas.
Jei generuojami kažkokie duomenys ir kiekieną kartą pateikiamas veinodas
rezultatas, būtina išvengti to generavimo ir sugeneruotus duomenis kešuoti, kad
vėliau būtų galima gražinti tiesiog paruoštus duomenis, neatliekant jokių
papildomų operacijų.  Su kešavimu taip pat susije ir tokie dalykai, kaip
lentelėje esančių įrašų skaičius. Gera praktika saugoti lentelės įrašų skaičių,
kitoje lentelėje, tokių atveju tiesiog kiekvino duomenų įterpimų, ištinimo metu
reikia padidinti arba sumažiniti skaičių. Žinoma tai naudinga tada, kai dažnai
reikalinga žinoti lentelėje esančių įrašų sakičių.  Kita labai svarbus dalykas
yra indeksai. Kiekvienam, kuris turi reikalo su duombazėmis siūlau labai gerai
susipažinti su visokiomis indeksavimo plonybėmis, nes tai gali **labai**
pagreitinti duombazės darbą.
