.. title: El. pašto klientas alot
.. slug: alot
.. date: 2013-04-14 14:36:00 UTC+02:00
.. tags: alot, mail, software
.. type: text

Po to, kai Gmail privalomai įjungė `naują laiškų rašymo funkciją`_,
nebeapsikenčiau ir nusprendžiau susirasti normalų pašto klientą.

Anksčiau ilgą laiką naudojau mutt_, bet deja, su dideliais laiškų kiekiais
viename kataloge, mutt_ veikia gan lėtai, neturi greito ir patogaus laiškų
filtravimo ir panašu, kad yra vis mažiau palaikomas.

Panašu, kad mutt_ greitu laiku pakeis sup_ ir jo klonai. sup_ gan nemažai gerų
dalykų pasiskolino iš Gmail, o tuo pačiu pakeitė visus blogus dalykus. Man,
keičiančiam Gmail, sup_ yra kaip tik tai, ko reikia. Tačiau apsižvalgius ir
apsiskaičius, radau, kad alot_ (sup_ klonas) yra net gi dar geriau.

Kol kas apsisprendžiau išbandyti alot_, žemiau pateikiu informaciją, kaip viską
sukonfigūravau, gal būt, kam nors pravers.

O konfigūravimas nėra paprastas, todėl iš karto įspėju, kad alot_ pašto
klientas skirtas daugiau patyrusiems kompiuterių naudotojams.

Slaptažodžiai
=============

Pirmiausia saugumas, rekomenduoju įsidiegti KeepPassX_ programą ir jos
pagalba susigeneruoti ilgą ir sudėtingą Gmail ar kito pašto serverio
slaptažodį, kadangi jis bus naudojamas konfigūraciniuose failuose.

Šiam žingsniui reikės įsidiegti šiuos paketus::

    sudo apt-get install python-keyring

Toliau pasirašiau nedidelį skriptą, kuris išsaugo arba nuskaito slaptažodį
iš slaptažodžių raktinės. Skripto kodas:

    https://bitbucket.org/sirex/home/src/default/bin/keyring

Laiškų katalogo šifravimas
==========================

Kadangi laiškai bus atsiųsti ir išsaugoti jūsų kompiuteryje, reikėtų juos
saugoti užšifruotame kataloge, kad niekas be jūsų negalėtų jų perskaityti.
Žinoma tai nėra privaloma, tačiau dažnai el.  paštu atsiunčiami
slaptažodžiai ir kita asmeninė informacija, todėl jei paštą tikrinate darbo
kompiuteryje, laiškų šifravimas tikrai rekomenduojamas.

Laiškų katalogo šifravimui pasirinkau encfs_ program, ją galite įsidiegti
taip::

    sudo apt-get install encfs

Toliau susikurkite užšifruotą katalogą taip::

    mkdir -p ~/.secure/mail ~/.mail
    encfs -f ~/.secure/mail ~/.mail

Sukūrus užšifruotą katalogą, slaptažodį, kurį nurodėte, įveskite į raktinę,
taip::

    keyring encfs mail --set

Visi failai esantys ``~/.mail`` kataloge bus užšifruoti, kad laiškus būtų
galima atsiūsti ir skaityti, paleiskite šią komandą::

    encfs --ondemand --idle=5 --extpass='keyring encfs mail' ~/.secure/mail ~/.mail

Ši komanda gali veikti kaip demonas, galite ją paleisti užsikrovus
kompiuteriui. Laiškų katalogas visą laiką bus užrakintas, nebent kas nors
bandys kreiptis į tą katalogą, kai tai atsitiks, ``encfs`` kreipsis į
raktinę slaptažodžio, gavus slaptažodį, automatiškai, penkioms minutėms
atrakins laiškų katalogą, o po penkių minučių vėl užrakins.

Laiškų sinchronizavimas
=======================

Laiškų sinchronizavimui pasirinkau offlineimap_ programą. Jai sukonfigūruoti
reikia dviejų konfigūracijos failų:

    https://bitbucket.org/sirex/home/src/default/.offlineimaprc
    https://bitbucket.org/sirex/home/src/default/.offlineimap.py

Nepamirškite į raktinę įkelti jūsų el. pašto slaptažodžio::

    keyring gmail vardenis.pavardenis@gmail.com --set

O taip pat įdiegti offlineimap_::

    sudo apt-get install offlineimap

Tokia offlineimap_ konfigūracija, atsiūs laiškus, kas penkias minutes,
išsaugos juos užšifruotame ``~/mail`` kataloge, Maildir_ formatu.
Kreipiantis į Gmail serverį, slaptažodį ims iš raktinės.

offlineimap_ leidžia filtruoti ir pervadinti atsiunčiamus katalogus, jūsų
atveju, katalogai gali būti pavadinti kitaip, todėl gal tekti pasitaisyti
``nametrans`` ir ``folderfilter`` funkcijas ``~/.offlineimap.py`` faile.

Patikrinti, ar katalogų filtravimas ir pervadinimas gerai veikia, galite
naudoti tokią komandą::

    offlineimap --info

Beje, ``--info`` argumentas atsirado vėlesnėje offlineimap_ versijoje, nei
yra pateikiama kartu su Ubuntu 12.04, todėl norint įvykdyti šią komandą,
jums reikės atsiųsti ir pasileisti naujesnę versiją, taip::

    git clone git://github.com/spaetz/offlineimap.git
    cd offlineimap
    git checkout v6.5.4
    ./offlineimap.py --info

Pirmą kartą atsiunčiant laiškus, rekomenduoju paleisti offlineimap_ grafiniu
režimu::

    offlineimap

Jei turite daug laiškų, pirmas sinchronizavimas gali užtrukti ilgai, man, su
30 000 laiškų užtruko apie dvi valandas.

O nuolatiniam laiškų atsiuntimui, foniniu režimu::

    offlineimap -u quiet

Laiškų indeksavimo variklis
===========================

Greitai laiškų paieškai pasirinkau notmuch_ laiškų indeksavimo variklį.
Kito pasirinkimo ir nebuvo, kadangi nuo šio variklio tiesiogiai yra
priklausomas alot_ el. pašto klientas.

Mano konfigūracijos failas atrodo taip ``~/.notmuch-config``:

    https://bitbucket.org/sirex/home/src/default/.notmuch-config

Tokį konfigūracijos failą, galite susigeneruoti notmuch_ vedlio
pagalba::

    notmuch setup

Laiškų indeksas atnaujinamas tokios komandos pagalba::

    notmuch new

Adresų knygutė
==============

Dar vienas reikalingas dalykas, adresų knygutė, tam pasirinkau abook_,
kadangi su šia adresų knygute puikiai suderinamas alot_ el. pašto klientas.

Laiškų išsiuntimas
==================

Kadangi postfix_ yra labai sudėtingas, o ssmtp_ reikalauja saugoti
slaptažodžius atviru tekstu konfigūraciniame faile, tai Python_ pagalba
pasirašiau savo laiškų išsiuntimo skriptą:

    https://bitbucket.org/sirex/home/src/default/bin/sendgmail

Šis skriptas slaptažodį ima iš raktinės, taip pat, kaip ir raktinės skriptas::

    keyring gmail vardenis.pavardenis@gmail.com

Beje, rekomenduoju išbandyti ir msmtp_ MUA, kuris atrodo daro lygiai tą patį ir
tikriausiai geriau.

El. pašto klientas
==================

Galiausiai viskas susijungia į vieną vietą alot_ programos pagalba.

Mano konfigūracijos failas atrodo taip:

    https://bitbucket.org/sirex/home/src/default/.config/alot/config

Rekomenduoju alot_ paleidinėti tokiu būdu::

    notmuch new && alot

Taip, automatiškai bus atnaujinamas indeksas ir tik tada pasileis el. pašto
klientas. Nebūtina alot_ laikyti nuolat atidarytą, kadangi jis atsidaro labai
greitai, nepriklausomai nuo laiškų kiekio.

Mano konfigūraciniame faile f5 klavišas aprašytas taip::

    f5 = shellescape --refocus=true 'notmuch new' ; refresh

Tai, reiškia, kad paspaudus f5, bus atnaujintas laiškų indeksas ir atnaujintas
laiškų sąrašas alot_ el. pašto kliente.

Demonai
=======

Viskam, kas čia aprašyta, reikalingi du demonai, vienas laiškų katalogo
dešifravimui, kitas laiškų sinchronizavimui.

Rekomenduoju naudoti supervisord_ demonų valdytoją, kuris puikiai moka
tvarkytis su demonais, gali juos paleisti iš naujo, jei jie išsijungia dėl
klaidos, galima stebėti demonų būklę, juos perkrauti ir t.t.

Supervisord įdiegsite taip::

    sudo apt-get install supervisor

Kadangi naudosime lokalų supervisord_, tai jei neplanuojate naudoti sisteminio,
galite jį išjungti taip::

    sudo update-rc.d -f supervisor disable

Supervisord_ veikimui, reikia sukurti šį katalogą::

    mkdir -p ~/.supervisor/logs

Taip pat reikia tokių konfigūracinių failų:

| https://bitbucket.org/sirex/home/src/default/.supervisor/supervisord.conf
| https://bitbucket.org/sirex/home/src/default/.config/autostart/supervisord.desktop
| https://bitbucket.org/sirex/home/src/default/bin/supervisor-bootstrap
| https://bitbucket.org/sirex/home/src/default/bin/encfs-daemon

Supervisord_ būklę galite stebėti taip::

    supervisorctl -c ~/.supervisor/supervisord.conf


.. _naują laiškų rašymo funkciją: http://gmailblog.blogspot.com/2012/10/introducing-new-compose-in-gmail.html
.. _offlineimap: http://offlineimap.org/
.. _encfs: http://www.arg0.net/encfsintro
.. _gpg-fuse: http://superuser.com/a/127176
.. _sup: http://sup.rubyforge.org/
.. _alot: https://github.com/pazz/alot
.. _notmuch: http://notmuchmail.org/
.. _gkeyring: https://launchpad.net/gkeyring
.. _KeepPassX: http://www.keepassx.org/
.. _Maildir: http://cr.yp.to/proto/maildir.html
.. _abook: http://abook.sourceforge.net/
.. _supervisord: http://supervisord.org/
.. _mutt: http://www.mutt.org/
.. _Postfix: http://www.postfix.org/
.. _ssmtp: https://wiki.archlinux.org/index.php/SSMTP
.. _msmtp: http://msmtp.sourceforge.net/
.. _Python: http://www.python.org/

