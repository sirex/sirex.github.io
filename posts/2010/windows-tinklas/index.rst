.. title: Windows tinklas
.. slug: windows-tinklas
.. date: 2010-03-08 23:59:00 UTC+02:00
.. tags: tinklas, floss
.. type: text

Kartas nuo karto, vis tenka susidurti su SAMBA serveriais, tiksliau su M$
Windows naudotojų šarinamais failais. Dažniausiai su tuo būna įvairiausių
problemų. Šį kartą vėl susidūriau su panašia problema.

Papasakosiu viską nuosekliai, kaip naudojantis komandine eilute, pilnavertiškai
prieiti prie pašarintų failų.

Pirmas dalykas - reikia įsidiegti reikalingus paketus::

    $ sudo apt-get install smbclient smbfs

Toliau - tikrinam tinkle esančius kompiuterius, kurie teikia vienokas ar
kitokias SAMBA paslaugas::

    $ smbtree -U%

Šios komandos pagalba paprasčiausiai bus grąžintas sąrašas visų kompiuterių
tinkle, kurie turi kokių nors pašarintų failų, spausdintuvų ir pan. Parametras
**-U%** nurodo, kad jungiamasis be jokio naudotojo, kaip svečias. Jei norite
jungtis tam tikru naudotojų, tada šis parametras turėtu atrodyti taip:
**-Unaudotojovardas%slaptazodis**.

Kartais prireikia sužinoti tinklo naudotojo IP adresą, pagal jo sambos vardą,
tai galima sužinoti tokios komandos pagalba::

    $ nmblookup KOMPIUITERIO_PAVADINIMAS

Kai jau žinomas kompiuterio pavadinimas, prie kurio galima jungtis, tada reikia
sužinoti ką jis šarina, tai galima sužinoti tokios komandos pagalba::

    $ smbclient -L KOMPIUTERIO_PAVADINIMAS -U%

Jei greitai reikia parsisiųsti kokį nors vieną failą, tai paprastai galima
padaryti prisijungus prie smbclient'o::

    $ smbclient //KOMPIUTERIO_PAVADINIMAS/SARINAMAS_KATALOGAS -U%
    $ ls
    $ cd kitas_katalogas
    $ ls
    $ get failo_pavadinimas

Viskas, failas bus parsiūstas. Prisijungus šiuo būdu, gaunamas šelas, kuriame
galima naudoti standartines komandas, tokias kaip *cd*, *ls* ir panašiai. Kad
sužinotumėte kokios dar komandos yra, galite paprasčiausiai parašyti *help*.

Jei norite panašyti po katalogus ir išsirinkti tai ko reikia, patogiausia tai
daryti primontavus šarinamą katalogą::

    $ sudo mount -t smbfs \
        -o username=password=//KOMPIUTERIO_PAVADINIMAS/SARINAMAS_KATALOGAS /mnt

Po šios komandos tinklo kompiuterio šarinamas katalogas bus pasiekiamas lyg jis
būtų lokalus jūsų kompiuterio katalogas. Toliau galite spausit F2 ir atsidaryti
*/mnt* katalogą, kuriame ir bus tinklo kompiugterio failai.

