.. title: Myliu komandinę eilutę ❤
.. slug: myliu-komandine-eilute
.. date: 2009-06-03 17:36:00 UTC+02:00
.. tags: shell, floss
.. type: text

.. TODO: update command to use tail instead awk, and ``bar`` for progress bar.

Tiesiog norėjau pasidalinti neįtikėtinai geru jausmu, kuris aplanko, kai
rezultatai naudojantis komandine eilute pranoksta lūkesčius!

Kadangi esu Web programuotojas, tai kartais testavimams reikia iš vienos
duomenų bazės pasiimti keletą duomenų ir juos persikelti į savo darbinę mašiną.
Tai gi, užduotis komandinei eilutei gan paprasta.

Reikia iš nuotolinio serverio MySQL duomenų bazės išeksportuoti tam tikrų
lentelių duomenis. Tuos duomenis perkelti į savo kompiutery, sukeisti
išeksportuotų lentelių prefiksus ir galiausiai visą tai importuoti į savo
lokalią MySQL duomenų bazę.

Šiai užduočiai realizuojama man prireikė tik vienos komandos:

.. code-block:: sh

    mysql -u -p -h  \
          -e 'show tables like "some_table_fragment_%"' | \
      awk '{ if (NR > 1) print $1 }' | \
      xargs mysqldump -u -p -h  | \
      sed 's/prefix1/prefix2/g' | \
      mysql -u -p -hlocalhost

Nors komanda iš pirmo žvilgsnio gal būt atrodo sudėtinga, tačiau įsigilinus į
atskiras jos dalis matyti, kad nieko sudėtingo nėra. Kad parašyti šią komandą
tereikia šį tą žinoti apie mysql, awk, sed komandas. Na ir žinoma kad tas
atskiras komandas apjungti, reikia žinoti kaip komandinėje eilutėje veikia
išvesties nukreipimas. Tai tiek.

Jei nesinaudoti komandine eilute, tai tikriausiai tektu prisijungti prie kokio
tai phpMyAdmin, ten susirast ir sužymėti reikiamas lenteles ir jas eksportuoti.
Eksporto failą parsisiuntus į savo kompiuterį, reikėtų juos atsidaryti su kokiu
nors teksto redaktoriumi, kuris nenulūžta nuo didelių duomenų kiekių ir jame
sukeisti visus lentelių prefiksus. Vėliau sukeistus duomenis reikėtų išsaugoti
ir atsidarius lokalų phpMyAdmin juos importuoti. Tai didžiulis ir bereikalingas
darbas. Naudojantis komandine eilute visą tai galima padaryti žymiai greičiau.


