.. title: lftp
.. slug: lftp
.. date: 2007-09-04 23:02:00 UTC+02:00
.. tags: floss, software
.. type: text

Pakankamai dažnai tenka dirbti su internetinėmis svetainėmis, todėl dažnai
tenka perkelti failus į FTP serverį. Tam reikalui ieškojau gero FTP kliento,
kuris būtų patogus ir greitas.

Ko gero vienas iš dažniausiai pasitaikančių veiksmų, kuriuos atlieku
naudodamasis FTP klientu yra pasikeitusių failų atnaujinimas.

Per kokius 3 metus esu išbandęs 3 FTP klientus, visus bandžiau vidutiniškai po
metus. Šiuo metu naudoju ir ko gero naudosiu dar ilgai FTP klientą lftp. Taip
pat esu naudojęs yafc ir nftp.

nftp buvo mano pirmasis FTP klientas, jis turi labai daug funkcijų, tačiau
didžiausias minusas yra tas, kad nėra sftp palaikymo. Taip pat pakankamai
prastas ryšys su kitomis programomis, negalima failų sąrašo perduoti kitai
programai ir panašiai. Dar vienas minusas - negalima rekursyviai keisti failų
teisių.

yafc lengvas, paprastas FTP klientas, deje taip pat nėra sftp palaikymo, dar
vienas minusas yra tas, kad komandinėje eilutėje neautokompleetina bookmarkų
pavadinimų. Taip pat šis klientas negali rekursyviai keisti failų teisių.

lftp klientas, kurį naudoju dabar, jis palaiko sftp protokolą, taip pat turi
puikią mirrorinimo funkciją, puikus ryšys su išorinėmis programomis,
rekursyviai keičia failų teises ir t.t. Vienas labai blogas dalykas yra tas,
kad nėra wildcards palaikymo, tiksliau šios toks yra, bet padarytas labai
nepatogiai.

Po ilgų bandymų, manau kad, bent kol kas lftp yra vienas geriausių ir
patogiausių FTP klientų. Pateiksiu pavyzdy kaip atlieku dažnai pasitaikančias
užduotis:

Paprasčiausias lokaliai keistų failų atnaujinimas į serverį::

    % lftp somebookmark
    % mirror -R

Labai paprasta ir greita.

Taip pat nesunkai galima pakeisti katalogų ir failų teises::

    % glob -d chmod 0777 */*
    % glob -f chmod 0666 */*

