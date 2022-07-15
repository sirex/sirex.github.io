.. title: Duomenų ūkio planas ateinančiam dešimtmečiui
.. slug: duomenu-ukio-planas-ateinanciam-desimtmeciui
.. date: 2022-05-13 13:28:13 UTC+03:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
.. status: draft

Nors dažniausiai kalbu apie atvirus duomenis, tačiau šį kartą noriu pakalbėti
bendrai apie valstybės duomenų ūkio vystymo tendencijas.

Mano supratimu šiuo metu sprendžiasi gan svarbūs reikalai, liečiantys bendrai
skaitmenizavimą ir duomenų valdymą. Konkrečiai kalbu apie dešimties metų planą,
pavadinimu `Valstybės skaitmeninimo plėtros programa`__.

__ https://eimin.lrv.lt/lt/ekonomikos-ir-inovaciju-ministerija/administracine-informacija/planavimo-dokumentai/pletros-programos

Gali būti, kad stipriai nusišnekėsiu, nes valstybiniame sektoriuje, esu pačioje
žemiausioje grandyje, todėl kol informacija iš aukščiausių valdymo organų
ateina iki žemiausių gali būti stipriai iškraipyta.

Tačiau, kalbant apie informacijos iškraipymą, tas pats galioja ir aukščiausiam
sluoksniui. T.y. kol informacija nukeliauja iš žemiausių sluoksnių iki
aukščiausių, gali būti daug iškraipymų. Tas labai gerai matosi skaitant tai,
kas surašyta plėtros programoje.

Kaip visada, visa informacija pateikta mano asmeniniame interneto dienoraštyje
yra mano asmeninė, subjektyvi, potencialiai realybės neatitinkanti nuomonė.

Neturiu supratimo, koks bus mano vaidmuo šioje skaitmeninimo programoje, tačiau
programos dokumentuose matau tam tikrą savo indėlį, nors ir gan iškraipytą
variantą. Todėl noriu pasidalinti originalia idėja ir valstybės skaitmeninimo
plėtros planu, taip, kaip aš asmeniškai jį matau.

Idėja, taip, kaip aš ją matau nėra su niekuo suderinta ir nėra jokių planų
tokios vizijos įgyvendinti, tai tik mano asmeninė vizija.


Pinigų lietus
*************

Kaip suprantu, šiuo metu yra skirstomi finansai, kurie bus panaudoti per
ateinančius 8 metus. Ir kaip suprantu, paskirstymas jau padarytas.

Finansai paskirstyti trims gavėjams:

- Informacinės visuomenės plėtros komitetas (IVPK) - 17 575 299 €,

- Statistikos departamentas (SD) - 18 707 000 ir

- INFOBALT (verslas) - 30 000 000 arba 15 000 000.

Neaišku ar verslui bus skirta 30 mln. ar tik 15 mln, o pusę tiek verslas turės
investuoti pats.


Kas už ką atsakingas?
*********************

IVPK
====

Mano supratimu, IVPK bus atsakingas už registrai.lt atnaujinimą ir gal būt
data.gov.lt ir get.data.gov.lt išplėtimą.

Mano nuomone, data.gov.lt ir get.data.gov.lt turėtu būti išplėstas, kad jame
būtų ne tik atviri duomenys, bet ir uždari.

Spinta
    Šiuo metu aktyviai vystoma ir gan sėkmingai naudojam duomenų, atviro kodo
    mainų sistema galėtu būti išplėsta ne tik skaitymo iš įvairių šaltiniu
    galimybėmis, bet ir rašymo.

    Spinta, kaip ir dabar veiktų kaip duomenų mainų jungtis, kuri leistų bet
    kokį duomenų šaltinį paversti API prieigos tašką.

    Visi registrai ir informacinės sistemos (R/IS) galėtų įsidiegti tokią jungtį ir
    automatiškai taptų bendro valstybinio API dalimi.

    Visi tokie individualūs R/IS API prieigos taškai iš išorės nebūtų
    pasiekiami, juos būtų galima pasiekti tik per get.data.gov.lt API vartus,
    kuri visų R/IS API prieigos taškai būtų sujungti į vieną bendrą valstybinį
    API.

    IVPK teiktų konsultacijas ir pagalbą R/IS administratoriams diegiant ir
    konfigūruojant Spinta, tačiau diegimas ir konfigūravimas turėtu būti gan
    trivialus.

get.data.gov.lt
    Dabartinė atvirų duomenų saugykla, galėtu būti išplėsta, suteikiant
    galimybę pasiekti ne tik atvirus, bet ir uždarus duomenis.

    Tai galėtu veikti, kaip API vartai (API gateway), kur pateikus duomenų
    užklausą, jie būtų paimami iš vienos are kelių vietų.

    Tai galėtu būti kažkas panašaus į Estų X-Road sistema, tik žymiai geriau ir
    šiuolaikiškiau.

    get.data.gov.lt duomenis perduotų Spinta duomenų mainų jungties pagalba
    įdiegtos kiekvienoje R/IS. Tai reiškia, fiziškai duomenys būtų saugomi
    vidinėse R/IS duomenų bazėse per get.data.gov.lt būtų perduodami realiu
    laiku, be tarpinių kopijų, tačiau ne fiziniu, o koncepciniu modeliu. Tačiau
    atviri duomenys būtų kopijuojami į get.data.gov.lt duomenų bazę, kad
    nesutrikdyti R/IS veikimo suteikiant neribotą prieigą prie duomenų.

    Saugykla arba API vartai būtų skirtas grynai integracijai tarp sistemų ir
    duomenų mainams, tai nebūtų paslauga skirta plačiajai visuomenei, bet
    daugiau sistema - sistema bendravimui.

    API vartai veiktų dinamiškai, duomenų struktūros aprašų pagalba. T.y.
    struktūros aprašas būtų naudojamas, kaip API kontraktas tarp šaltinio, API
    vartų ir API naudotojų.

data.gov.lt
    Būtų metaduomenų repozitoriumas, išplėstas ne tik atvirų duomenų
    rinkiniais, bet ir uždarų, pakartotiniam naudojimui skirtais, duomenų
    rinkiniais.

    Būtų glaudžiai integruotas su get.data.gov.lt ir veiktų, kaip duomenų
    prieigos naudotojo sąsaja skirta plačiajai visuomenės daliai.

    Iš esmės, tai būtų metaduomenų katalogas, arba duomenų rinkinių vitrina,
    kur vieno langelio principu būtų galima gauti visus, tiek atvirus, tiek
    uždarus, tiek `savo duomenis`__.

    __ https://mydata.org/declaration/

    Įdiegus Spinta į R/IS, pilna šaltinio duomenų struktūra būtų perduota į
    data.gov.lt, kur toliau struktūros aprašas būtų administruojamas per
    data.gov.lt metaduomenų administravimo naudotojo sąsają.

    data.gov.lt užtikrintu ir visus BDAR reikalavimus tai reiškia,
    kiekvienas duomenų subjektas galėtų žinoti kokie subjekto duomenys ir
    kuriuose R/IS yra kaupiami, kokiais tikslais naudojami, galėtu vienu kartu
    iš visų R/IS gauti savo duomenis ir pan.

    Per data.gov.lt būtų administruojama prieiga prie duomenų.


registrai.lt
    Būtų registrų ir informacinių sistemų administravimo sistema, kurioje būtų
    pateikta išsami informacija apie visus valstybės informacinius išteklius,
    kur jie fiziškai saugomi, kas prie jų turi prieigą, kas už ką atsakingas ir
    pan.

    registrai.lt būtų glaudiai integruoti su data.gov.lt. Visi metaduomenys
    susiję su duomenų rinkiniais ir struktūros aprašais būtų administruojami
    per data.gov.lt, o visi duomenys apie atsakomybes, R/IS roles ir pan., būtų
    administruojami per registrai.lt.

    Jei kyla klausimų, kas yra tam tikros valstybinės informacinės sistemos
    administratorius, arba kas turi prieigą prie duomenų arba prie serverių,
    kuriame potinklyje yra konkretus serveris ir pan, visus tokio pobūdžio
    atsakymus būtų galim gauti iš registrai.lt.

Trumpai tariant, mano matymu, IVPK teiktų standartines duomenų mainų priemones
ir prižiūrėtų get.data.gov.lt, data.gov.lt ir registrai.lt paslaugas, kurios
užtikrina sklandų apsikeitimą duomenimis ir duomenų atradimą vieno langelio
principu.

auth.gov.lt
    Iš tikrųjų visam šitam reikalai yra reikalinga ir auth.gov.lt paslauga, kuri
    suteiktu normalias autorizacijos paslaugas, reikalingas prieigos prie duomenų
    valdymui ir asmenų autorizavimui. Šiuo metu veikianti Elektroninių valdžios
    vartų autorizacija yra per daug primityvi, neatitinka šiuo metu de facto OAuth
    standarto. Tokia autorizacijos paslauga galėtu būti prieinama ir verslui,
    suteikiant skirtingus autorizacijos lygmenis, nuo paprasto iki patikimo
    kvalifikuoto asmens autorizavimo.


SD
==

Mano supratimu, SD turėtu užsiimti R/IS fizinio duomenų modelio transformavimu
į koncepcinį/semantinį duomenų modelį, ką iš esmės šiuo metu ir daro.

Visi R/IS tvarkytojai įsidiegę duomenų mainų jungtį (Spinta), į data.gov.lt
automatiškai pateikia pilną savo šaltinio duomenų struktūros aprašą. Tada SD,
kartu su duomenų šaltinio tvarkytoju transformuoja šaltinio fizinį duomenų
modelį į koncepcinį/semantinį valstybinį duomenų modelį.

Atlikus tokią transformaciją, sutvarkyto šaltinio struktūros aprašo pagrindu,
paleidžiama duomenų mainų jungtis (Spinta), šaltinio infrastruktūroje, ko
pasekoje gaunamas konkretaus R/IS API prieigos taškas. Galiausiai toks API
prieigos taškas prijungiamas pie API vartų (get.data.gov.lt).

Duomenų mainų jungtis, pagal parengtą struktūros aprašą realiu laiku
transformuoja duomenis iš fizinio į koncepcinį modelį, todėl per
get.data.gov.lt API vartus duomenys perduodami vienoda ir standartizuota forma
užtikrinant duomenų integralumą tarp skirtingu R/IS.

Tada, per data.gov.lt, šaltinio tvarkytojas suteikia prieigą prie duomenų SD,
pagal poreikį. Suteikus prieigą, duomenys iš šaltinio, nurodytu periodiškumu
perduodami į SD VDV IS (Palantir) duomenų bazę, PUSH metodu. Tai reiškia, kas
duomenų tvarkytojas neturi įsileisti į savo infrastruktūrą, nei SD, nei IVPK,
jie patys kontroliuoja tiek infrastruktūros, tiek duomenų saugumą.

Esmė tokia, kad IVPK priemonių ir paslaugų pagalba, R/IS tvarkytojai su SD
pagalba parengia koncepcinį duomenų modelį ir visiškai automatizuotai
prisijungia pie bendros valstybinės duomenų mainų ekosistemos.

Rengiant šaltinio duomenų struktūros aprašus, pažymima, kurie duomenys gali
būti atveriami ir kurie gali būti naudojami pakartotinai, jų neatveriant.

Pažyminti, kurie duomenys atveriami, SD taip pat nurodo ir duomenų nuasmeninimo
taisykles.

Prijungus R/IS pie API vartų, tie duomenys, kurie pažymėti atvėrimui,
automatiškai atveriami, tie duomenys kurie pažymėti pakartotiniam panaudojimui
automatiškai gali būti pakartotinai naudojami suteikiant teises per
data.gov.lt.

Jei tiksliau, SD:

1. Gauna iš R/IS pilną šaltinio struktūros aprašą, kuris automatiškai įkeliamas
   į data.gov.lt.

2. Tada per data.gov.lt naudotojo sąsają, SD kartu su R/IS tvarkytoju
   transformuoja fizinį šaltinio modelį į koncepcinį/semantinį.

3. Pagal parengtą struktūros aprašą R/IS prijungiamas prie API vartų
   (get.data.gov.lt).

4. Per registrai.lt SD suteikiamos reikalingos teisės duomenų perdavimui į VDV
   IS (Palantir), tiek statistikos, tiek analitikos, tiek atvėrimo tikslais.

5. SD gavęs duomenis, atnaujina struktūros aprašą per data.gov.lt, pateikiant
   nuasmeninimo ir konfidencialumo užtikrinimo parametrus.


Verslas
=======

Verslas, kuris nori gauti finansavimą iš valstybės, registruoja savo projektą
data.gov.lt ir įsipareigoja pateikti šiuos rodiklius:

- kiek buvo sukurtą naujų darbo vietų projekto dėka,

- kiek projektas uždirbo pinigų ir kiek sumokėjo mokesčiu,

- kiek naudotojų naudojasi projekto teikiamomis paslaugomis,

- kiek buvo panaudota valstybės subsidijų projekte,

- kokie duomenys buvo panaudoti projekte.

Visi kiti atvirų ar uždarų duomenų naudotojai tokių duomenų pateikti
neprivalės, prievolė turėtu atsirasti tik valstybės remiamiems projektams.

Tokiu būdu, bus aiškiai matoma, kiek ir kokių duomenų naudoja verslas ir kokį
poveikį sukuria projektai naudojantys duomenis. Tam nereikės daryti nei
apklausų nei tyrimu, poveikį bus galima stebėti realiu laiku.

Verslas galėtu naudoti tiek atvirus, tiek uždarus duomenis. Jei reikalingi
uždari duomenys, tada prieiga prie duomenų būtų suteikiama per registrai.lt.

Prieiga būtų suteikiama vadovaujantis visais BDAR reikalavimais, tai reiškia,
kad būdų suteikiama prieiga tiksliai prie tokių duomenų, kurių reikia
konkrečiam tikslui. Duomenų subjektai turėtu galimybę matyti, kas ir kokiu
tikslu jų duomenis naudoja.


Įgyvendinimas
*************

Dirbant su atvirais duomenimis, per paskutinius kelis metus yra sukaupta gan
didelė patirtis, todėl manau nėra prasmės daryti kažkokias galimybių studijas,
kurti ar pirkti naujas sistemas.

Tai, kas jau sėkmingai veikia su atvirais duomenimis, didele dalimi veiks ir su
uždarais duomenimis.

Todėl mano nuomone, reikėtų tęsti tai, kas jau yra pradėta ir vystyti toliau.
Manau jau turime pakankamai aiškų matymą, kad veikia, kas ne, ką reikia
tobulinti ir ko trūksta.

Jau yra numatyta data.gov.lt plėtra, kurią galima daryti turint mintyje
platesnę viziją. Tada sekančio plėtros etapo metu, išplėsti ne tik atvirų, bet
ir uždarų duomenų poreikiais.

registrai.lt yra morališkai pasenęs, todėl manau jį reikėtų perdaryti nuo
nulio, tačiau tai turėtu būti gan nedidelis projektas, statomas ant data.gov.lt
viršaus.

Spinta jau sėkmingai veikia ir yra naudojama dešimtyje skirtingų valstybinių
įstaigų, todėl šiuo požiūriu niekas nesikeistu, tik tai, kas šiuo metu
naudojamai duomenų peržiūrai prieš publikavimą, taptu API prieigos tašku,
jungiamu prie get.data.gov.lt. Spinta jau šiuo metu palaiko praktiškai visas
R/IS naudojamas duomenų bazes.

Šiuo metu SD daromas rankinis darbas, rašant duomenų transformacijos skriptus,
kiekvienam duomenų atvėrimo atvejui, turėtu būti visiškai automatizuotas ir
perkeltas į Spinta. Tai sutaupys daug valandų darbo.

Iš SD pusės, pagrindinis darbas vyks su struktūros aprašais. Ir tam reikia
pakankamai daug specialistų, nes darbas su struktūros aprašais pareikalaus
daugiausiai laiko, tai matosi jau dabar. Kadangi darbui su struktūros aprašais
nereikia IT specialistų, galima žymiai lengviau rasti žmonių, kurie galėtu su
tuo dirbti, suteikiant jiems specializuotus apmokymus.

get.data.gov.lt veikimas, taip pat turėtu būti išplėstas, sustiprinant saugumą
ir suteikiant galimybę duomenis gauti iš visų R/IS API prieigos taškų.

