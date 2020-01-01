.. title: Svetainės istorija
.. slug: svetaines-istorija
.. date: 2011-07-15
.. tags: sirex
.. type: text


2007-05-05
==========

.. thumbnail:: /images/u1/drupal_logo.png
   :alt: Drupal
   :align: right

Deja nėra daug laiko tobulinti savo svetainę, todėl pasiskaitinėjęs pagalvojau,
kad reikia išbandyti Drupal_ ir tuo pačiu ant jo perkelti savo svetainę/blogą.

Na pasibandysim ir žiūrėsim ar Drupal iš ties geras daigtas :)

2009-02-09
==========

Jau 100 metų ruošiausi ir šį savaitgalį, netikėtai prisiruošiau atsinaujinti
savo blogo vidurius. Dar penktadienį sukosi Drupal 5.1, o jau dabar, šviežiai
paleistas Drupal 6.9 :)

Buvau nustebintas, bet migravimo procesas iš 5.1 į 6.9 buvo visiškai sklandus
ir nesusidūriau su jokiomis problemomis. Šiaip tai jau kelis kartus planavau
pakeisti Drupal kuo nors kitu, dėl jo didumo ir tokio, ganėtinai keisto
svetainės administravimo būdo, nekalbant apie pačios sistemos kodo struktūrą.
Tačiau vis tik tūkstančiai modulių, paruoštų visiems gyvenimo atvejams duoda
savo... :)

Dažnai sugalvoju, kad reikėtų vieno ar kito. Vos tik žvilgtelėjus
`drupalmodules.com <http://drupalmodules.com>`_, tas noras akimirksniu tampa
realybe... Kadangi jau prisiruošiau pereiti prie Drupal 6.9, tai tikriausiai
pasiliksiu su juo dar ilgam.

Štai sąrašas modulių, kuriuos įdiegiau į naująją versiją (abėcėlės tvarka):

- **admin\_menu** – puikusis administravimo meniu.

- **captcha** – apsauga nuo spamo.

- **cck** – Content Construction Kit, būtent jo pagalba labai paprastai
  realizavau skiltį `Darbai </darbai>`_, ką padaryti planavau jau labai senai.

- **comment\_notify** – galimybė sekti komentarus.

- **commentrss** – galimybė užsiprenumeruoti komentarų RSS.

- **extlink** – mažas moduliukas, kuris sužymi išorines nuorodas ir el.  pašto
  adresus.

- **feedburner** – FeedBurner integracija.

- **geshifilter** – šį naudoju kodo spalvinimui ir net gi pats parašiau Zenburn
  spalvų schemą... :)

- **google\_analytics** – Google Analytics integracija.

- **google\_cse** – Google Custom Search Engine integracija.

- **gravatar** – Gravatar integracija.

- **poormanscron** – modulis, kuris neįpareigoja naudoti serverio crono.

- **tagadelic** – šoninis žymių debesis.

- **twitter** – Twitter integracija.

- **views** – nuostabusis ir puikusis Views modulis, būtent su juo generuoju
  `„Darbų“ </darbai>`_ skilties sąrašą.

Nors Drupal modulių yra visa galybė, tačiau vieno modulio surasti taip ir
nepavyko – OpenID laukas komentaruose. Bet radau forumuose užsimezgusias
diskusijas, tai gal greitu laiku, kas nors tai padarys. O gal ir pačiam reikės
tuo užsiimti. Bus matyt.

Be visų modulių ir kitokio gėrio, visiškai perrašiau savo blogo Drupal temą,
kuri dabar yra kur kas lengvesnė ir labiau išbaigta.

Be viso to, kas akivaizdžiai matosi, nuveikiau dar labai daug. Visų
pirmiausiai, pagaliau prisiruošiau sukonstruoti skriptą, kuris automatiškai
darytų blogo atsargines kopijas, nes vieną kartą palūžus serveriui, jei esu
praradęs šiek tiek duomenų. Tačiau pasidaręs pirmą atsarginės kopijos archyvą,
pastebėjau, kad per laiką yra susikaupę visa galybė šlamšto, tiek duomenų
bazėje, tiek pačiame serveryje. Išvalyti serverį buvo labai nesudėtinga::

    sudo rm -rf *

Tačiau su duomenų baze tai turėjau šiek tiek vargo. Kadangi per apsileidimą
niekaip nesuradau laiko sutvarkyti Drupal crono, tai buvo susikaupę labai daug
lankomumo žurnalo įrašų ir visa galybė spaminių komentarų, dar nuo tų laikų,
kai nebuvau įdiegęs CAPTCHA modulio. Tačiau šiek tiek įsigilinus į duomenų
bazės lenteles ir pasitelkus subselectus, gan sėkmingai pavyko viską išvalyti.
Duomenų bazė prieš tai svėrė 350 Mb, o po išvalymo 7.5 Mb.

Tai gi, reziumuojant, šis savaitgalis buvo praleistas labai turiningai,
išvalytas serveris, išvalyta duomenų bazė, numigruota prie Drupal 6.9,
perrašytas Drupal tema ir įdiegta daug visokių modulių...

Jei, kas pastebėsite kokių nors netikslumų, kurių tikėtina gali atsirasti, tai
rašykit. Kol dar neišblėso entuziazmas, sutvarkysiu :)

2011-07-15
==========

Visas svetainės turinys perkeltas iš Drupal_ į Pelican_.


2019-12-31
==========

Visas svetainės turinys perkeltas iš Pelican_ į Nikola_.

.. _Drupal: http://drupal.org/
.. _Pelican: link://slug/pelican
.. _Nikola: https://www.getnikola.com/
