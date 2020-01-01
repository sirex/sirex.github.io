.. title: Kaip kopijuoti didelius failus konsolėje?
.. slug: kaip-kopijuoti-didelius-failus-komandineje-eiluteje
.. date: 2009-06-03 17:36:00 UTC+02:00
.. tags: shell, floss
.. type: text

Kai konsolėje bandai kopijuoti didelius failus, po komandos vykdymo nieko
nematai ir nežinai kiek dar liko kopijuoti, kada baigsis ar kopijavimas išvis
sustojo...

Ieškodamas internete radau komandos cp pačą, kuris prijungi prie komandos cp
parametrą -g, rodanti kiek liko kopijuoti. Tačiau tokie dalykai labiau tinka
Gentoo naudotojams, kur viskas kompiliuojama, o aš naudoju Ubuntu, kur viskas
jau sukompiluota ir gražiai padėta .deb paketuose.

Taip pat radau įvairių shell scriptų, kurie rodo progress barą, tačiau tie
scirptai tokie dideli ir jų veikimo stabilumas abejotinas...

Galiausiai sugalvojau pateikti pasiūlymą Ubuntu programuotojams, kad įtrauktą
tą cp pačą ir Ubuntu pagal nutylėjimą turėtu cp -g. Radau, kad toks noras jau
buvo išreikštas `#64067
<https://bugs.edge.launchpad.net/ubuntu/+source/coreutils/+bug/64067>`_.
Tačiau panašu, kad upstreame reikalas juda labai lėtai ir Debian žmonės nelabai
nori to cp -g patobulinimo: `#185152
<http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=185152>`_.

Toje pačioje vietoje radau puikų patarimą!


    Also the functionality of progress bars exists in rsync. If someone wants a
    tool with everything including the kitchen sink then using rsync works well
    and already exists.

    ::

        rsync --progress -av SOURCE DESTINATION

    Bob

Radau tai ko ieškojau! Greitai į savo ``~/.zshrc`` įrašiau eilutę:

::

     alias gcp='rsync --progress -ah'

Kopijuodamas didelius failus galiu stebėti pilnutėlę informaciją:

::

     46.99M   6%   22.40MB/s    0:00:29

