.. title: GPG
.. slug: gpg
.. date: 2009-06-10 22:14:00 UTC+02:00
.. tags: floss, gpg, shell
.. type: text

Jau senai planavau susikurti GPG raktą ir susikonfigūruoti savo pašto klientą, kad šis automatiškai uždėtu GPG parašą ant mano siunčiamų laiškų. Šiandien pagaliau nusprendžiau tai padaryti. Pamaniau gal būt dar kam nors bus įdomu sužinoti kaip tai daroma.

Kam reikalingas elektroninis parašas?
=====================================

Elektroninis parašas užtikrina, kad pasirašytasis tekstas po pasirašymo nebuvo pakeistas ir išliko lygiai toks pats, koks buvo prieš pasirašant.  Taip pat yra galimybė patikrinti ar parašo savininkas tikrai pasirašė naudodamasis savo parašu.

Trumpai tariant parašo dėka galima identifikuoti parašo savininką ir įsitikinti, kad pasirašytieji duomenys nebuvo pakeisi trečiųjų šalių.

Elektroninio parašo veikimo principas
=====================================

El. paraše esminis dalykas yra privatusis ir viešasis raktai. Privatųjį rakta žino tik to rakto savininkas, o viešasis raktas žinomas visiems.  Vienu iš šių raktų galima duomenis užkoduoti, o kitu iškoduoti. Norint pasirašyti po kokiais nors duomenimis iš pradžių sukuriamas tų duomenų vienkryptis atvaizdas (*angl.  hash*), tai reiškia kad duomenys paverčiami į nedidelę įvairių simbolių eilutę.  Vėliau panaudojant privatų raktą gautoji duomenų eilutė užkoduojama ir gaunamas parašas.  Kaip ir minėjau, kas yra užkoduota naudojant vieną raktą, kito pagalba gali būti atkoduojama. Šiuo atveju parašas gali būti atkoduotas naudojant viešąjį raktą. Atkodavus parašą gaunamas duomenų atvaizdas.  Pasirašytuosius duomenis pavertus į duomenų atvaizdą ir palyginus jį su iškoduotu raktu galima įsitikinti ar duomenys buvo keisti ar ne.

Kaip susikurti savo privatų ir viešąjį raktus?
==============================================

Susikurti savo privatų ir viešąjį raktus nesudėtinga. Paleiskite komandą ir sekite instrukcijas::

    $ gpg --gen-key

Po kurio laiko bus sugeneruoti raktai. Juos galite pamatyti įvykdę tokią komandą::

    $ gpg --list-keys

Savo viešąjį raktą reikia išeksportuoti ir paviešinti, galima jį persiųsti savo
draugams, patalpinti savo asmeninėje svetainėje arba bendruose raktų
serveriuose. Raktas išeksportuojamas taip::

    $ gpg -a --export tavo-el-pasto@adresas.lt > tavoviesasisraktas.asc

# Kaip sužinoti savo rakto ID ir fingerprint?

Įvedus tokią komandą::

    $ gpg --list-public-keys el.pastas@example.com 
    pub   11111/AAAAAAAA 2001-01-01
          Key fingerprint = AAAA AAAA AAAA AAAA AAAA  AAAA AAAA AAAA AAAA AAAA
    uid                  Name Surname <el.pastas@example.com>
    sub   22222/BBBBBBBB 2001-01-01

Į ekraną bus išvestas rakto ID ir fingerpring. Šiuo atveju rakto ID yra
`AAAAAAAA`, o fingerpring yra tai kas parašyta po „Key fingerpring = “ eilute.

# Kaip išsiųsti savo raktą į raktų serverį?

Savo raktą į raktų serverį išsiųsite taip::

    $ gpg --send-keys AAAAAAAA

# Kaip importuoti kito žmogaus raktą į savo raktinę?

Jei žinote rakto ID::

    $ gpg --recv-keys AAAAAAAA

Jei žinote tik el. pašto adresą arba rakto savininko vardą::

    $ gpg --search-keys vardas@example.com

Suradus ieškomą raktą, galima jį importuoti pagal ID, taip kaip aprašyta aukščiau.

Jei turite viešojo rakto failą, jį importuoti galima taip::

    $ gpg --import <failo/vardas.asc>

# Kaip pasirašyti kitą viešąjį raktą?

Norint pasirašyti kieno nors raktą, pirmiausia reikia importuoti to žmogaus
raktą į savo raktinę. Kai raktas jau yra importuotas į raktinę, pasirašyti
raktą galima taip::

    $ gpg --sign-key AAAAAAAA

Papildomai galima nustatyti rakto patikimumo lygį naudojant šią komandą::

    $ pgp --edit-key AAAAAAAA

Paleidus šią komandą reikia įvesti subkomandą `trust` ir sekti instrukcijas. Atlikus pakeitimus reikia įvesti `save` subkomandą.

Galiausiai raktą reikia išsiųsti į raktų serverį tokiu būdu::

    $ gpg --send-keys AAAAAAAA


GPG ir mutt
===========

Kai visi reikiami raktai sukurti, galima sukonfigūruoti programas, kurios su tuo dirbs. Pašto programa *mutt* konfigūruojama labai paprastai, tiesiog faile `~/.mutt/muttrc` reikia įrašyti tokias eilutes::

    set pgp_decode_command="gpg %?p?--passphrase-fd 0? --no-verbose --batch --output - %f"
    set pgp_verify_command="gpg --no-verbose --batch --output - --verify %s %f"
    set pgp_decrypt_command="gpg --passphrase-fd 0 --no-verbose --batch --output - %f"
    set pgp_sign_command="gpg --no-verbose --batch --output - --passphrase-fd 0 --armor --detach-sign --textmode %?a?-u %a? %f"
    set pgp_clearsign_command="gpg --no-verbose --batch --output - --passphrase-fd 0 --armor --textmode --clearsign %?a?-u %a? %f"
    set pgp_encrypt_only_command="pgpewrap gpg --batch --quiet --no-verbose --output - --encrypt --textmode --armor --always-trust --encrypt-to 0xC9C40C31 -- -r %r -- %f"
    set pgp_encrypt_sign_command="pgpewrap gpg --passphrase-fd 0 --batch --quiet --no-verbose --textmode --output - --encrypt --sign %?a?-u %a? --armor --always-trust --encrypt-to 0xC9C40C31 -- -r %r -- %f"
    set pgp_import_command="gpg --no-verbose --import -v %f"
    set pgp_export_command="gpg --no-verbose --export --armor %r"
    set pgp_verify_key_command="gpg --no-verbose --batch --fingerprint --check-sigs %r"
    set pgp_list_pubring_command="gpg --no-verbose --batch --with-colons --list-keys %r"
    set pgp_list_secring_command="gpg --no-verbose --batch --with-colons --list-secret-keys %r"
    set pgp_autosign=yes
    set pgp_sign_as=0xABCABCAB
    set pgp_replyencrypt=yes
    set pgp_timeout=1800
    set pgp_good_sign="^gpg: Good signature from"

**Pastaba:** pakeiskite viešojo rakto kodą *ABCABCAB* savuoju. Jį galima sužinoti iš `gpg --list-keys` komandos išvesties (kodas yra paryškintas)::

    pub   1024D/ABCABCAB 2007-10-13
    uid                  Vardas Pavardaitis
    sub   2048g/A3BA3BA 2007-10-13

Po to, kai išsaugosite *mutt* konfigūracinį failą ir bandysite siųsti laišką, prie jo bus prisegamas parašas.

GPG ir Gajim
============

Pokalbiams naudoju Jabber klientą Gajim. Kai kurie Jabber serveriai naudoja apsaugotą SSL protokolą žinučių perdavimui. Tačiau Jabber protokolas veikia decentralizuotai, tai reiškia, kad žinutės gali keliauti ir į kitus serverius, kurie nebūtinai yra apsaugoti SSL. Jei žinutės keliauja neapsaugotais kanalais, tada bet kas gali tas žinutes perskaityti. Naudojant GPG galima žinutes užkoduoti, tada jos iš siuntėjo, iki pat gavėjo keliaus užkoduotos ir jas perskaityti galės tik tas, kam jos skirtos.

Kad žinutės keliautu užkoduotos, Gajim kontaktų sąraše reikia pasirinkti „Edit – Accounts“, atsidariusiame lange reikia pasirinkti redaguoti prieigą. Prieigos lange, „Personal Information“ žymelėje reikia nurodyti savo viešąjį raktą.  Kitas žmogus, su kuriuo bendraujama Jabber protokolu, turėtu atlikti panašius veiksmus. Taip pat reikia turėti kito pašnekovo viešąjį raktą ir jį importuoti::

    $ gpg --import kitas_pasnekovas.asc

Importavus kito pašnekovo viešąjį raktą, Gajim kontaktų sąraše, dešiniuoju pelės klavišu paspaudus ant kito pašnekovo ir pasirinkus „Assign OpenPGP Key“ nurodomas to pašnekovo raktas. Po šių veiksmų visos žinutės bus koduojamos.
