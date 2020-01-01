.. title: Kodėl PHP nėra programavimo kalba?
.. slug: kodel-php-nera-programavimo-kalba
.. date: 2010-03-24 22:07:00 UTC+02:00
.. tags: php
.. type: text

Nesupraskite šio įrašo antraštės tiesiogiai, taip mes juokaujam darbe
programuotojų tarpe, kai susiduriam su eiliniu PHP trūkumu...

Nors iš tikrųjų, PHP nėra pilnavertė programavimo kalba, ji yra scenarijų
kūrimo kalba, o jei tiksliau – web scenarijų kūrimo kalba.  Nepaisant didelių
PHP trūkumų, ji yra labai populiari ir dėl didelio populiarumo naudojama
daugelyje vietų, dažnai kur reikia ir kur nereikia.

Kur tinka naudoti PHP scenarijų kalbą?
======================================

Jei planuojate paleisti nedidelės apimties interneto svetainę, pavyzdžiui savo
asmeninę svetainę ar įmonės pristatomąją svetainę, tuomet PHP puikiai tam
reikalui tiks.

Kada geriau nenaudoti PHP?
==========================

PHP iš esmės sukurta interneto svetainių kūrimui, todėl niekam kitam, išskyrus
interneto svetainių kūrimui, ji nėra tinkama. Žinoma, PHP galimybės leidžia
kurti tiek programas veikiančias tekstiniame režime, tiek grafinėje aplinkoje.
Bet mano nuomone, karvė nėra tinkama jodinėjimui, nors jos galimybės tai
leidžia... Tas pats ir su PHP.

Tai gi, PHP tinka naudoti interneto svetainėms kurti, bet tik nedidelės
apimties interneto svetainėms! Tikrai nerekomenduočiau naudoti PHP didelių
įmonės intraneto sistemų kūrimui, dideliems interneto portalams ar kitoms
sudėtingesnėms sistemoms.

Sakote blogam šokėjui ir batai trukdo?
======================================

Tas tiesa, geras programuotojas ir asemblerio instrukcijomis gali programuoti,
bet kam taip kankintis, jei yra kur kas pažangesnių programavimo technologijų.

PHP programuoju jau beveik visą dešimtmetį, tačiau esu susipažinęs ir su
kitomis programavimo kalbomis, pradedant tuo pačiu asembleriu, C/C++, baigiant
Bash, Awk ir t.t. Kadangi esu susipažinęs su daugeliu programavimo kalbų, tai
galiu jas lyginti.

Kai sakau, kad PHP nėra programavimo kalba, daugelis prašo įvardinti konkrečius
trūkumus. Būtent tokių klausimų pastūmėtas ir nusprendžiau surašyti visus
pastebėtu PHP trūkumus vienoje vietoje. Jei taip pat, kaip ir aš, nuolat
susiduriate su PHP trūkumais, tai laukiu papildymo komentaruose.

Tai kodėl gi PHP nėra programavimo kalba?
=========================================

Arba kitaip sakant, kokie trūkumai apsunkina programavimo darbus su PHP?

weak typing
-----------

PHP leidžia priskirti bet ką, bet kam ir bet kaip. Iš pirmo žvilgsnio atrodo,
kad tai yra labai lankstu, bet kai reikia ieškoti skriptuose paliktų klaidų,
tai pradedi galvoti kas per žmonės sugalvojo tokią nesamonę...

Štai keli pavyzdžiai:

.. code-block:: php

    <?php

    $a = (
        false == '' &&
        false == '0' &&
        '' != '0' &&
         
        0 > -1 &&
        0 == false &&
        false < -1
    );

Spėkit, kam bus lygus kintamasis ``$a``? Jis bus lygus True, jei netikit,
išbandykite patys. Kiekvienas atidesnis programuotojas turėtų pastebėti, kad
PHP palyginimo operacijos dažnai prasilenkia su logika. Praktikoje tokie
dalykai labai apsunkina klaidų paiešką...

Klaidų apdorojimas
------------------

PHP kalboje egzistuoja tokie klaidų tipai:

crash
    o taip, pasitaiko, kad PHP tiesiog segfaultina esu su tuo susidūręs ne
    karta, ypač dirbant su PDO.

fatal error
    sintaksės ar panašios klaidos kurių negalima apdoroti, programos vykdymas
    tiesiog nutraukiamas, be jokios galimybės tai kontroliuoti

notice, warning
    dalinai kontroliuojamos klaidos aprašius klaidų apdorojimo funkciją.

exception
    pilnai kontroliuojamos klaidos

Tokios painiavos tikriausiai nesate matę? PHP neturi normalaus klaidų
apdorojimo mechanizmo. Visokie parse error, notice warning ir panašiai
susiklostė istoriškai, vėliau atsirado exception palaikymas, bet visi seni
dalykai, taip pat liko.

Štai elementariausias pavyzdys, kuriame išlenda klaidų apdorojimo trūkumai:

.. code-block:: php

    <?php

    $fp = @fopen('/etc/passwd', 'a');
    if ($fp) {
        fwrite($fp, "boo\n");
        fclose($fp);
    }
    else {
        trigger_error('Error', E_USER_WARNING);
        // or... throw new Exception('Error');
    }

Šiame pavyzdyje bandoma tvarkingai atidaryti failą ir apdoroti atvejį, kai to
failo atidaryti negalima. Deja PHP atveju, jei failo negalima atidaryti,
paprasčiausiai išspjauna warning tipo klaidą ir vienintelis būdas tokią klaidą
pagauti – pasirašyti klaidų apdorojimo funkciją su ``set_error_handler``.
Vienintelis būdas išvengti šioje vietoje nepageidaujamų klaidų pranešimų – @
(eta) simbolis, kuris iš vis panaikina bet kokius klaidų pranešimus (išskyrus
fatal tipo), bet nepaisant to, klaidos vis tiek keliauja į klaidų apdorojimo
funkciją, jei tokia aprašyta.

Trumpai tariant, visiška painiava. Vienintelis mano akimis žiūrint, teisingas
sprendimas – į klaidas apdorojančią funkciją įrašytas exception iškvietimas.

Klaidų pranešimai
-----------------

Kadangi interneto svetainėje išvedami klaidų pranešimai yra potenciali saugumo
spraga, tai dažniausiai tie pranešimai būna išjungti ir... ir toliau kiekvienas
daro kaip išmano, kad tas klaidas sugaudytų.  Standartiškai PHP turi galimybę
visus klaidų pranešimus nukreipti į failą, tačiau tame faile nurodyta tik vieta
kur įvyko klaida ir nieko daugiau, kai išsamus traceback'as padėtų kur kas
labiau. Žinoma yra išsigelbėjimas pavadinimu xdebug, tačiau production
serveriuose jo tikrai niekas nenaudoja, o ir nederėtų.

Didesnė blogybė yra ta, kad dažniausiai, pagal nutylėjimą apie klaidas
pranešama tyliai, tai reiškia, kad daugelis mažiau patyrusių programuotojų iš
vis nesirūpina klaidų pranešimais, ko pasekoje susilaukia daug problemų.

Namespace
---------

Kuriant didelės apimties sistemas, anksčiau ar vėliau susidursite su vardų
erdvės problema, priešingu atveju teks naudoti tokius funkcijų pavadinimus:
``ManoPaketas_ManoModulis_ManoStrukturosElementas_ManoFunkcija``, be galimybės
kažką keisti.

PHP daugelį metų neturėjo vardų erdvių, tik visiškai nesenai, nuo 5.3 versijos
atsirado vardų erdvių galimybė, bet pati realizacija taip pat neguodžia...

References
----------

Prieš PHP 5.0, referencas buvo kuriamas tik tada, kai nurodomas & simbolis, po
PHP 5.0 prasidėjo linksmybės, nes visi objektai automatiškai perduodami kaip
referencai, o visi ne objektai, kaip kopijos. Tačiau techniškai, pati perdavimo
procedūra, naudojant referencus iš tikrųjų kuria kopijas, užima daugiau
atminties ir apsunkina skriptą. Sunku suprasti, bet liūdna tiesa yra ta, kad
geriau nenaudoti PHP referencų, nors teoriškai referencų perduodant
kintamuosius yra efektyvesnis. Plačiau apie tai galite pasiskaityti čia:

http://schlueters.de/blog/archives/125-Do-not-use-PHP-references.html

Objektai ir referencai
----------------------

Nuo PHP 5.0, visi objektai, automatiškai perduodami kaip referencai, o tai
reiškia, kad atmintyje objekto kintamieji susiejami ryšiais. PHP turi tokią
ydą, kad jei objektas atmintyje yra susietas su kitu objektu, tuomet tas
objektas pasidaro nesunaikinamas ir nuolat sėdi atmintyje.  Tai puikiausiai
iliustruoja žemiau pateiktas pavyzdys:

.. code-block:: php

    <?php

    class MyParent {
         
        public $child;
         
        public function __construct() {
            $this->child = new MyChild($this);
        }
         
    }
     
    class MyChild {
     
        public $parent;
         
        public function __construct($parent) {
            $this->parent = $parent;
        }
         
    }
     
    foreach (range(0, 10) as $i) {
        echo memory_get_usage()."\n";
        $a = new MyParent;
    }

Gausime tokį rezultatą::

    335508
    336160
    336696
    337232
    337768
    338320
    338856
    339392
    339928
    340464
    341000

Kaip matote, atminties naudojimas vis auga, nors cikle objektas turėtų būti
sunaikintas, o jo naudota atmintis atlaisvinta. Bet deja taip nėra.  Išvada –
programuojant PHP, geriau nenaudoti objektų.

Round funkcijos klaida ar funkcionalumas?
-----------------------------------------

Spėkit, kam bus lygus kintamasis ``$a``?

.. code-block:: php

    <?php

    $a = (string) round(-0.1);

Neatspėjote, ``$a`` bus lygus ``"-0"`` :)

Jei manote, kad šioje vietoje PHP yra teisus ir kaltos kreivos rankos, štai dar
vienas pavyzdys:

.. code-block:: php

    <?php

    $a = round(-0.1) === 0;

Kintamasis ``$a`` bus lygus ``false``...

Išvados
=======

Programuojant PHP geriau nenaudoti objektų, geriau nenaudoti referencų, geriau
išvis nenaudoti PHP :)

Kol kas pateikiau tik kelis pavyzdžius, bet jų yra kur kas daugiau. Kai tik
turėsi laiko, papildysiu įrašą pateikdamas daugiau pavyzdžių.

Nuorodos
========

-  `What I don't like about PHP <http://www.bitstorm.org/edwin/en/php/>`_

-  `Experiences of Using PHP in Large Websites
   <http://www.ukuug.org/events/linux2002/papers/html/php/index.html>`_

-  `I’m sorry, but PHP sucks
   <http://maurus.net/resources/programming-languages/php/>`_

-  `PHP IN CONTRAST TO PERL <http://tnx.nl/php.html>`_

-  `I hate PHP <http://keithdevens.com/weblog/archive/2003/Aug/13/HATE-PHP>`_

