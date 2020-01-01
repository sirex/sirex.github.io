.. title: Pažintis su Archlinux
.. slug: pazintis-su-archlinux
.. date: 2009-01-05 09:58:00 UTC+02:00
.. tags: floss, archlinux
.. type: text
.. previewimage: /images/arch-linux-logo.png

.. thumbnail:: /images/arch-linux-logo.png
   :alt: Archlinux Logo
   :class: previewimage

Kokią savaitę prieš naujuosius metus, įkvėptas `ubuntu.lt forumo temos apie
Archlinux <http://www.ubuntu.lt/render/Forum;thread,3203>`_, nusprendžiau ir
pats išbandyti `Archlinux <http://archlinux.org/>`_!  Labiausiai sudomino tai,
kad jis labai greitas, bent jau taip pavaizduota YouTubėje: `How fast is Arch
Linux? <http://www.youtube.com/watch?v=A5h7wtkg4Bc>`_ Užsikabinęs, nusprendžiau
`pasidomėti plačiau <http://wiki.archlinux.org/index.php/Arch_vs_Others>`_ ir
radau dar daugiau įdomių savybių:

- Arch is text-based and command-line oriented.

- `The beauty of the Arch rolling release model
  <http://wiki.archlinux.org/index.php/Beginners_Guide#The_beauty_of_the_Arch_rolling_release_model>`_

- `The Arch Philosophy, best summarized by the acronym KISS for Keep It Simple,
  Stupid <http://en.wikipedia.org/wiki/KISS_principle>`_

- `Arch is targeted at more-advanced GNU/Linux users, but some people feel
  "Arch is a good place to start".
  <http://wiki.archlinux.org/index.php/FAQ#Q.29_I_am_a_complete_GNU.2FLinux_beginner._Should_I_use_Arch.3F>`_

- `Arch User Repository <http://wiki.archlinux.org/index.php/AUR_Q_&_A>`_

Prieš naujuosius dar visą savaitę skaitinėjau, kas ir kaip, o po naujųjų, visas
išeigines dienas pašvenčiau Archlinux bandymams.

Pirmiausiai išbandžiau jį įdiegdamas į vmware virtualią mašiną, viskas suveikė
gan sklandžia, tai greitai tą patį padariau ir ant savo kompiuterio.

Bendras įspūdis
===============

Kažkaip nepastebėjau labai didelio greičio skirtumo, lyginant su Ubuntu.
Bendras visų programų veikimo ir pasileidimo greitis yra daug maž vienodas,
tačiau kai kurios programos vis tik pradėjo veikti žymiai greičiau. Labiausiai
tai matyti su `mutt <http://www.mutt.org/>`_, kuris su 10 tūkstančių laiškų
užsikrauna kokius 3 kartus greičiau nei anksčiau. Tuo tarpu Firefox užsikrauna
taip pat lėtai kaip ir anksčiau, gal keliomis sekundėmis ir greičiau,
neskaičiavau, bet aiškaus pagreitėjimo nematyti. Gal būt tas pagreitėjimas
labiau jaučiasi naudojant KDE su `KDEmod
<http://kdemod.ath.cx/about-kdemod.html>`_...  Lyginant su Ubuntu, Archlinux
yra ganėtinai nestabilus, dažnai teko susidurti su visokiomis problemomis ir
bugais. Mano kompiuterio geležis yra puikiai suderinama su Linux branduoliu,
todėl Ubuntu, po 20 minučių trukusio diegimo veikia tiesiog Out of The Box. Tuo
tarpu Archlinux diegimas ir konfigūravimas užtruko 3 dienas (ko gero
konfigūravimas dar nesibaigė ir greitai nesibaigs, tobulumui nėra ribų :) ).
Bet kokiu atveju, diegti Archlinux buvo tikrai įdomu ir apturėjau daug
malonumo...  :)

Kas patiko
==========

Rolling release
---------------

Ko gero vienas iš labiausiai patikusių dalykų yra tai, kad Archlinux
repozitorijose galima rasti pačias naujausias programų versijas iš karto po jų
išleidimo. Žinomo toks gėris kainuoja tai, kad neretai programos būna ne iki
galo ištestuotos. Bet, bent kiek labiau patyrusiam kompiuterio naudotojui tai
neturėtų būti problema.

KISS
----

Paprastumo principas Archlinux sistemoje pasireiškia tuo, kad pateikiama labai
paprasta sistema, kurią, praktiškai nuo nulio turi susikonfigūruoti pats, taip
kaip nori.

Didžiausias gėris yra tame, kad pats savo rankomis statydamas tokią sistemą,
turi galimybę iš pagrindų susipažinti su pačia sistema ir tuo, kaip ji veikia.
Tai ne tik praturtina žiniomis, bet ir atsitikus kokiai nors nelaimei, bent jau
bus daugiau/mažiau aišku ką ir kur žiūrėti.  Bet to, pati visos sistemos
struktūra yra visiškai paprasta, todėl jautiesi taip, lyg iš tikrųjų, pats
valdai sistemą nuo A iki Z.

Arch is text-based and command-line oriented
--------------------------------------------

Jau senai esu įpratęs daugelį visų veiksmų atlikti komandinėje eilutėje, žinant
vos kelias komandas ir nesivarginant kiekvienam menkniekiui ieškoti, kažkokio
automatizuoto grafinio įrankio. Archlinux tikrai yra visiškai command-line
friendly... :)

Bet to, diegimo meto, kol sukonfigūruojama grafinė aplinka, reikia nemažai
padirbėti visiškai tekstiniame režime. Todėl gerai susikonfigūravau ne tik
grafinę aplinką, bet ir tekstinio režimo daly, be grafinės aplinkos. Grub meniu
yra net gi du punktas, vienas – paleisti su grafine aplinka, kitas, be grafinės
aplinkos... :)

AUR
---

Ganėtinai įdomus pasirodė paketų vystymo procesas.  `AUR
<http://wiki.archlinux.org/index.php/ArchLinux_User-community_Repository_(AUR)>`_
yra toks paketų repozitoriumas, kur pateikiami Archlinux naudotojų source
paketai, kuriuos gali parsisiųsti ir pats susikompiliuoti, patikrindamas ar
viskas gerai. Kompiliavimo procesas, naudojant `Yaourt
<http://wiki.archlinux.org/index.php/Yaourt>`_ yra visiškai automatizuotas ir
labai paprastas. Po kompiliavimo, jei paketas sudarytas gerai ir veikia
puikiai, galima balsuoti už tą paketą, kad jis iš AUR, butų perkeltas į
Community repozitoriumą ir įgytų patikimo paketo statusą.

Gal būt ir yra šioks toks pavojus dėl kokių nors nepatikimų paketų, bet
vis tik, mano manymų, tai yra puikiai sumanyta paketų vystymo sistema.

Kita...
-------

Kol kas Archlinux naudoju vos kelias dienas, todėl manau, kad bus dar daug gerų
dalykų. Kol kas nebandžiau `ABS
<http://wiki.archlinux.org/index.php/ABS_-_The_Arch_Build_System>`_ ir
tikriausiai dar daugiau įdomių dalykų.

Problemos
=========

Aprašysiu konkrečias problemas, su kuriomis susidūriau.

LiveCD bugas
------------

Nelaimės prasidėjo nuo livecd. Iš pradžių parsisiunčiau oficialų
archlinux-2008.06-core-i686 livecd. Tačiau paleisti iš jo live sistemos taip ir
nepavyko. Pamaniau, kad problema pačiame CD, bandžiau įrašyti tą livecd
atvaizdą gal kokius 10 į skirtingus CD visokiais greičiais ir visokiais būdais,
kol galiausiai išsiaiškinau, kad tai yra `senas bugas
<http://bugs.archlinux.org/task/11408?project=1&cat=5&dev=&sev=&status=&toggleadvanced=1&order=dateopened&sort=desc&order2=attachments&sort2=desc>`_.
Teko siųstis neoficialų archlinux-2008.12-archboot CD atvaizdą, kuris turi
ISOLINUX boot loaderį ir kuris pasileido sėkmingai.

cfdisk problema
---------------

Įpusėjus diegimą susidūriau su disko skaldymo problema, nes cfdisk pareiškė,
kad mano extention dalyje esantis disko skirsnis viršija patį extenteion
skirsnio dydį, kuriame jis yra. Ir dėl to cfdisk paprasčiausiai nepasileido
visai. Nežinau kaip tai nutiko, bet fdisk -l tikrai patvirtino, tai, ką pasakė
cfdisk. Laimei su fdisk pavyko sutvarkyti disko skirsnius, nežiūrint į
nesklandumą su extention dalies perviršiu.

XDM taip ir nepavyko paleisti
-----------------------------

Kadangi buvau apsisprendęs naudoti Fluxbox, tai kaip login managerį pasirinkau
XDM, kuris bent jau Archlinux wikyje siūlomas pagal nutylėjimą. Tačiau jo
paleisti taip ir nepavyko. Išsiaiškinau tik tiek, kad problema susijusi su hal,
į kurį XDM dėl kažkokių priežasčių nesėkmingai bando kreiptis. hal demonas
paleistas prieš XDM, todėl įtariau, kad problema slypi pačiame XDM. Galiausiai
įdiegiau kitą login managerį `slim <http://slim.berlios.de/>`_ ir problemos
baigėsi.

Problemos su paketų priklausomybėmis (dependencies)
---------------------------------------------------

Nežinau ar tai paketų priklausomybių problema ar pačių paketų problema, bet
susidūriau su tokiomis problemomis, kaip mime types failų nesugeneravimas,
reikalingų piktogramų neparsiuntimas ir pan. Konkrečiai dėl mime tipų failų
nesugeneravimo, nepasileido kai kurios programos, kurios tai naudoja, nes
paprasčiausiai tos programos negalėjo užkrauti paveiksliukų, dėl mime types
informacijos nebuvimo.

Bet kokiu atveju, savarankiškai įdiegus kažkokį tai paketą, mime types problema
išsisprendė, tačiau kai kurių piktogramų nerodo iki šiol.

Kitos problemos
---------------

Susidūriau su visa eile kitų problemų, kurios atsirado ne dėl kokios nors
Archlinux kaltės, o paprasčiausiai todėl, kad daug dalykų reikia daryti
rankiniu būdu, todėl reikia labai gerai įsiskaityti į taip, kaip viskas veikia,
kad nepadarytum kokios nors klaidos.

