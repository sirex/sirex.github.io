.. title: Muzika iš komandinės eilutės
.. slug: muzika-is-komandines-eilutes
.. date: 2010-04-05 21:43:00 UTC+02:00
.. tags: shell, floss
.. type: text

Mėgstu klausytis muzikos ir patinka, kai muzika tiesiog groja. Ilgą laiką
naudojuosi MPD muzikos demonu, kuris nuolat sukasi kompiuteryje ir klauso kas
jam liepiama daryti.

MPD yra geras tuo, kad jį galima paleisti kompiuteriu kraunantis nebijant, kad
tai apsunkins kompiuterio darbą, nes MPD demonas yra labai lengvas. Tada, bet
kuriuo metu pakanka nuspausti mygtuką klaviatūroje „Play“ ir MPD gavęs signalą,
pradeda groti muziką. Panašiai grojamą muziką galima pristabdyti, sustabdyti,
paleisti sekančią dainą ar grąžinti prieš tai buvusią.

Tačiau, jei reikia paklausyti atsitiktinę dainą arba užkrauti vieną katalogą,
MPD nėra labai patogus, nes tenka žaisti su muzikos biblioteka, įvedinėti
visokias komandas ir pan.

Greitam muzikos klausymui ir atrankai, kur kas labiau tinka muzikos grotuvas
CMUS, kuris yra paprastas, greitas ir turi panašumu su teksto redaktorių VIM.

Kad MPD ir CMUS derėtų tarpusavyje, esu pasirašęs paprastą SHELL skriptą, kurio
pagalba paspaudus „Play“ patikrinama ar yra paleistas CMUS ir jei jis veikia,
tuomet paleidžiama groti daina per CMUS, o jei jis išjungtas, tuomet naudojamas
nuolat budintis MPD. Skriptas atrodo taip:

.. code-block:: bash

    #!/bin/bash

    case "$1" in
        toggle)
            if [ -S ~/.cmus/socket ] ; then
                cmus-remote --pause
            else
                mpc toggle
            fi
            ;;

        stop)
            if [ -S ~/.cmus/socket ] ; then
                cmus-remote --stop
            else
                mpc stop
            fi
            ;;

        next)
            if [ -S ~/.cmus/socket ] ; then
                cmus-remote --next
            else
                mpc next
            fi
            ;;

        prev)
            if [ -S ~/.cmus/socket ] ; then
                cmus-remote --prev
            else
                mpc prev
            fi
            ;;

        *)
            echo "usage: $0 {toggle|stop|next|prev}"
    esac

    exit 0

CMUS
====

Kadangi CMUS yra labai paprastas, tai užtenka jį įdiegti, paleisti iš
komandinės eilutės::

    cmus

ir įkelti norima katalogą ar failą grojimui::

    :add ~/music

MPD
===

MPD yra sudėtingesnis, nes veikia, kaip serveris. Pirmiausia, prieš pradedant
jį naudot, reikia aprašyti konfigūracinį failą ``~/.mpdconf``::

    music_directory "~/music/"
    playlist_directory "~/.mpd/playlists"
    db_file "~/.mpd/mpd.db"
    log_file "~/.mpd/mpd.log"
    error_file "~/.mpd/mpd.error"
    pid_file "~/.mpd/mpd.pid"
    state_file "~/.mpd/mpdstate"

Tada į kartu su kompiuteriu paleidžiamas programas įkelkite programą *mpd*.
Norėdami patestuoti iš karto, komandinėje eilutėje įveskite *mpd* ir paruoškite
grojaraštį::

    mpc update
    mpc clear
    mpc mpc listall | mpc add
    mpc play

Viskas, MPD paruoštas, pasileis kartu su kompiuteriu ir bet kuriuo metu bus
pasiruošęs skleisti muzikos garsus.

Norėdami kontroliuoti MPD, galite naudoti komandinės eilutės klientą mpc arba
ncurses klientą *ncmpcpp*.

Media klavišai
==============

Paskutinis dalykas – media klavišų susiejimas, su aukščiau pateiktu *music.sh*
skritpu. Tai padarysite, nurodydami tokias komandas, atitinkamiems klavišams::

    /home/naudotojovardas/bin/music.sh toggle
    /home/naudotojovardas/bin/music.sh stop
    /home/naudotojovardas/bin/music.sh next
    /home/naudotojovardas/bin/music.sh prev

Audio scrobbler
===============

Ar jums įdomu ką klausote? Man, taip, todėl naudojuosi audio scrobbling
technologija klausomos muzikos statistikai vestis. Visą informaciją apie
klausytą muziką siunčiu last.fm portalui, kur vėliau galiu parodyti draugams
kokią muziką mėgstu ir pats pasižiūrėti klausomos muzikos statistiką. Mano
last.fm profilis:

http://www.last.fm/user/sirexas

MPD demonui naudoju mpdscribble_. CMUS – cmuscrobbler_.  Turint taip
sukonfigūruotą sistemą, galima pamiršti apie muzikos programas ir tiesiog
dirbant savo darbus klausytis muzikos!

.. _mpdscribble: http://mpd.wikia.com/wiki/Client:Mpdscribble
.. _cmuscrobbler: http://github.com/freshprince/cmuscrobbler

