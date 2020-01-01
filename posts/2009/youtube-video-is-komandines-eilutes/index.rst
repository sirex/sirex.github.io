.. title: Youtube video iš komandinės eilutės
.. slug: youtube-video-is-komandines-eilutes
.. date: 2009-06-04 22:41:00 UTC+02:00
.. tags: youtube, shell
.. type: text

Ar bandėte kada nors žiūrėti Youtube video, HD formatu? Nežinau, kaip pas jus,
bet pas mane tuos HD rodo labai sunkiai. CPU dirba pilnu pajėgumu, o video
rodymas labai stabdo...

Kas iš tos HD kokybės, jei vis tiek ja negali pasidžiaugti.. :) Visiškai
nesenai, radau paprastą sprendimą:

`youtube-dl <http://bitbucket.org/rg3/youtube-dl>`_

Tai python skriptas, kuris geba parsiųsti video failą į kompiuterį vėlesniam
peržiūrėjimui. Tai, kas parsiųsta, galima žiūrėti su mplayer, be jokio
stabdymo, kaip normalų filmą.

Nerašysiu kaip įsidiegti youtube-dl, pateiksiu tik keletą variacijų, kaip jis
gali būti naudojamas.

*Tarkime gavote youtube nuorodą ir nenorite jungti naršyklės, norite tik
peržiūrėti video.*

Sprendimas::

    $ youtube-dl -g "http://www.youtube.com/watch?v=EWBwWHHD1Pc" | xargs mplayer

Jei turite greitą interneto ryšį, pridėjus -b parametrą, bus siunčiama
geriausia prieinama video kokybė.

*Tarkime, naršote Youtube ir ieškote įdomių filmukų, kuriuos norėsite
peržiūrėti vėliau.*

Sprendimas: surašykite visas rastas filmukų nuorodas į vieną failą ir šios
komandos pagalba, iš karto galėsite viską parsisiųsti::

    $ youtube-dl -bta failas-su-nuorodomis.txt

Čia tik keli pavyzdžiai, kaip galima panaudoti šį skriptą.

Atsiminkite, kad yra toks skriptas, pasitelkite išradingumą, fantaziją ir
ateityje tikrai rasite kur jį pritaikyti.

