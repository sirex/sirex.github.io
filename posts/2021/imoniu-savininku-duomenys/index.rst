.. title: Įmonių savininkų duomenys
.. slug: imoniu-savininku-duomenys
.. date: 2021-01-22 14:28:42 UTC+02:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text

Šiandien (2020-01-22) ryte dalyvavau TILS_ organizuotoje `diskusijoje`__ apie
*įmonių savininkų duomenis*.

.. _TILS: https://www.transparency.lt/

__ https://www.facebook.com/smuravjovas/posts/10164678589295147

Jei trumpai, tai problema tame, kad `Europos komisija`_, kovodama su pinigų
plovimu, teroristų finansavimu, mažindama korupciją ir didindama skaidrumą
`reikalauja`__, kad ES valstybės narės atvertu įmonių savininkų duomenis, tai
yra asmens duomenis.

.. _Europos komisija: https://en.wikipedia.org/wiki/European_Commission

__ https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32018L0843

Tačiau `Lietuva yra viena iš keturių ES šalių`__, kurios iki šiol nėra
atvėrusios nei duomenų, nei iš vis yra įsteigusios tokį registrą. 23 (iš 27) ES
šalys jau turi *įmonių savininkų registrus*, o 13 šalių jau yra ne tik
įsteigusios registrus, bet ir pilnai atvėrusios *įmonių savininkų duomenis*.

__ https://medium.com/transparent-data-eng/ultimate-beneficial-owners-registers-in-the-eu-2020-5a868e3ff0

.. figure:: /images/2021/imoniu-savininku-duomenys/ubo-register-in-eu-2020.png
    :alt: Ultimate Beneficial Owners Registers in the EU June 2020
    :target: https://medium.com/transparent-data-eng/ultimate-beneficial-owners-registers-in-the-eu-2020-5a868e3ff0

    Ultimate Beneficial Owners Registers in the EU June 2020


Situacija Lietuvoje
===================

Kadangi, nesilaikant šio ES reikalavimo Lietuva rizikuoja gauti sankcijas iš ES,
šiais metais pradėtas kurti įmonių savininkų registras.

Tiksliau, ne visai naujas registras, o esamos JADIS_ (Juridinių Asmenų Dalyvių
Informacinė Sistema) posistemė JANGIS (Juridinių Asmenų Naudos Gavėjų
Informacinė Sistema).

.. _JADIS: https://www.registrucentras.lt/p/33

Iš vienos pusės kaip ir viskas gerai, registras bus, tikriausiai dar šiais
(2021) metais. Bet esminis klausimas, kaip tie duomenys bus teikiami.

Kiek supratau iš diskusijos, duomenys bus teikiami **mokamai**, tik
**registruotiems asmenims** ir **po vieną įrašą**, o ne visus duomenis iš karto,
o jei tiksliau, tai bus teikiami ne duomenys atvirais formatais mašininiam
apdorojimui, o tiesiog informacija susipažinimui.

Manau tokia prasta duomenų teikimo forma, apsunkina ir net gi trukdo pasiekti
Europos komisijos iškeltus tikslus, mažinti korupciją, pinigų plovimą ir
teroristų finansavimą.

Esminis `Teisingumo ministerijos`__ ir `Registrų centro`__ pasiteisinimas yra
toks, kad *asmens duomenys* negali būti atviri duomenys. Bet ar tikrai?

__ https://tm.lrv.lt/

__ https://www.registrucentras.lt/


Ar galima atverti asmens duomenis?
==================================

Aš pats iki šiol, teisininkų ir asmens duomenų apsaugos pareigūnų išplautomis
smegenimis, tikėjau, kad asmens duomenys negali būti teikiami, kaip atviri
duomenys.

Tačiau kuo labiau į tai gilinuosi, tuo labiau pradedu suprasti, kad vis dėlto
**asmens duomenys gali būti atverti** ir teikiami, kaip atviri duomenys.

Manau, teisininkus ir asmens duomenų apsaugos pareigūnus klaidina pats atvirų
duomenų apibrėžimas, kuriame dažniausiai nurodoma, kad atviri duomenys turi
būti nuasmeninti.

Tačiau nuasmeninimas yra būtinas ne visais atvejais. Viešasis interesas yra
svarbiau, nei vieno privataus asmens interesas. Todėl BDAR_ aiškiai yra
nurodyta, kad asmens duomenis galima naudoti ir be pačio asmens tiesioginio
sutikimo, tokiais atvejais:

    **Article 6: Lawfulness of processing**

    - processing is necessary for compliance with a legal obligation to which
      the controller is subject;

    - processing is necessary for the performance of a task carried out in the
      public interest or in the exercise of official authority vested in the
      controller;

    -- `GDPR, Chapter II, Principles`__

.. _BDAR: https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32016R0679

__ https://gdpr-info.eu/art-6-gdpr/

Šiuo atveju, kovai su korupcija, pinigų plovimu ir teroristų rėmimu, Europos
komisija siekia, kad įmonių savininkų duomenų valdytojais taptų visų Europos
šalių piliečiais, o patys įmonių savininkai ir tokių duomenų tvarkytojai turi
prievolę teikti duomenis:

    **Article 30**

    5. Member States shall ensure that the information on the beneficial
       ownership is accessible in all cases to:

       a. competent authorities and FIUs, without any restriction;

       b. obliged entities, within the framework of customer due diligence in
          accordance with Chapter II;

       c. any member of the general public.

       The persons referred to in point (c) shall be permitted to access at leas
       te name, the month and year of birth and the country of residence and
       nationality of the beneficial owner as well as the nature and extent
       beneficial interest held.

    -- `AMLD5, Chapter III, Beneficial ownership information`__

__ https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:02015L0849-20180709#tocId43

\

    **Article 41**

    2. Personal data shall be processed by obliged entities on the basis of this
       Directive only for the purposes of the prevention of money laundering and
       terrorist financing as referred to in Article 1 and shall not be further
       processed in a way that is incompatible with those purposes. The
       processing of personal data on the basis of this Directive for any other
       purposes, such as commercial purposes, shall be prohibited.

    -- `AMLD5, Chapter V, Data protection, record-retention and statistical
    data`__

__ https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:02015L0849-20180709#tocId60

Be to, `Europos atvirų duomenų reglamentas`__ numato, kad įmonių ir įmonių
savininkų duomenys turi būti atviri ir kad tai yra aukštos vertės atviri
duomenys:

__ https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32019L1024

    List of thematic categories of high-value datasets

    1. Geospatial

    2. Earth observation and environment

    3. Meteorological

    4. Statistics

    5. **Companies and company ownership**

    6. Mobility

    -- `Open data and the re-use of public sector information, Annex 1`__

__ https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32019L1024#d1e32-79-1

Sprendžiant iš šių reglamentų, galima aiškiai suprasti, kad **asmens duomenys
gali būti atviri duomenys**.

Kol, Lietuva vis dar galvoja ar galima atverti įmonių savininkų duomenis, mūsų
kaimynai Latviai tokius duomenis jau `sėkmingai atvėrė`__ ir pasaulis
nesugriuvo. Štai galite pasižiūrėti `"MAXIMA Latvija" SIA`__ savininkų duomenis.

__ https://info.ur.gov.lv/

__ https://info.ur.gov.lv/?#/legal-entity/40003520643


Asmens duomenų atvėrimas
========================

Iš techninės pusės, dažnai painiojama ir teigiama, kad asmens duomenų negalima
teikti atvirais formatais. Tokie teiginiai rodo prastą supratimą apie tai, as
yra atviri duomenys.

Atviri formatai labai plačiai naudojami, tiek keičiantis atvirais, tiek uždarais
duomenimis. Uždaros sistemos, daugeliu atveju duomenimis keičiasi atvirais
formatais, bet patys duomenys teikiami tik autorizuotiems duomenų naudotojams,
saugiu duomenų perdavimo kanalu.

Tai vienas dalykas yra aiškus, kad **asmens duomenis galima teikti atvirais
formatais**. Esminis klausimas, ar tuos duomenis galima teikti tik visiems ar
tik autorizuotiems duomenų naudotojams?

Siekiant užtikrinti Europos komisijos iškeltus tikslus, mažinti korupciją,
pinigų plovimą ir teroristų finansavimą, duomenis teikti visiems,
nereikalaujant autorizacijos.

Tačiau klausimas, kaip užtikrinti, kad duomenys būtų naudojami tik Europos
komisijos iškeltais tikslais?

Naujoje DCAT_ (Data Catalog Vocabulary) versijoje atsirado toks dalykas kaip
`odrl:hasPolicy`_, kuris leidžia nurodyti kokiomis sąlygomis ir kokiu tikslu
atviri duomenys gali būti naudojami.

.. _DCAT: https://www.w3.org/TR/vocab-dcat-2/
.. _odrl:hasPolicy: https://www.w3.org/TR/vocab-dcat-2/#Property:distribution_has_policy

Atvirų duomenų naudojimo sąlygas ir tikslą galima apibrėžti naudojant ODRL_
duomenų modelį.

.. _ODRL: https://www.w3.org/TR/odrl-model/#infoModel

.. figure:: /images/2021/imoniu-savininku-duomenys/00Model.png
    :alt: ODRL Information Model
    :target: https://www.w3.org/TR/odrl-model/#infoModel

    ODRL Information Model

Tai reiškia, kad yra galimybė atverti duomenis nurodant, kad jų panaudojimo
tikslas yra ribojamas. Tai vis dar bus atviri duomenis, teikiame nemokamai,
atvirais formatais, nereikalaujant duomenų naudotojų autorizacijos. Tačiau
duomenų naudojimo tikslas bus ribojamas.

Senesnėje BDAR_ versijoje galimybės nurodyti naudojimo sąlygų nebuvo, tačiau
buvo galimybė nurodyti duomenų naudojimo licencija, kuri teoriškai taip pat
yra pakankama. Tačiau naujasis ``odrl:hasPolicy`` atributas, leidžia sąlygas
aprašyti taip, kad jas suprastu ne tik žmogus, bet būtų galimybe tai
nuskaityti ir mašininiu būdu.

Todėl įvardinant duomenų naudojimo sąlygas ir tikslą tiek `odrl:hasPolicy`_ ar
`dct:licence`_ pagalba, **galima atverti ir asmens duomenis**, jei tokių duomenų
atvėrimas yra būtinas siekiant užtikrinti viešąjį interesą ar to reikalauja
teisės aktai.

.. _dct:licence: https://www.w3.org/TR/vocab-dcat-2/#Property:distribution_license


Tikiuosi naujoji vyriausybė, `savo programoje atvirus duomenis įvardinusi kaip
esminį principą`__, laikysis žodžio ir įmonių savininkų duomenis atvers.

__ https://e-seimas.lrs.lt/portal/legalAct/lt/TAP/3955e800388111eb8c97e01ffe050e1c#part_e4e09ece1637427282423a71af4a8b69

