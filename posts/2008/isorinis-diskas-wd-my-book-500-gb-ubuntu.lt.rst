.. title: Išorinis diskas WD My Book 500 GB + Ubuntu
.. slug: isorinis-diskas-wd-my-book-500-gb-ubuntu
.. date: 2008-01-13 00:18:00 UTC+02:00
.. tags: ubuntu, floss
.. type: text

Mano laptopas jau senas ir turi tik 40 GB HDD, iš kuriu 10 GB atidaviau Ubuntu
ir 30 GB pasilikau sau. Norėdamas kažką įsirašyti, nuolat turiu ką nors
ištrinti. Backupus darau į DVD, prisijungęs prie kito laptopo, nes pas mane
nėra DVD RW... :)

Tai gi galiausiai nusprendžiau įsigyti išorinį diską. Šiandien nusipirkau WD My
Book 500 GB Home Edition. Papasakosiu su kokiomis problemomis susidūriau ir
kaip jį sukonfigūravau.

Išpakavau, prijungiau, viskas pradėjo veikti vos prijungus USB kabelį prie mano
laptopo. Ubuntu parodė langą su disko turiniu. Pirmas dalykas, kuris užkliuvo –
disko dydis, pirkau 500 GB, o Ubuntu rodo kad tėra tik 465 GB. Kur dingo 35 GB?
Pasirodo 500 GB yra marketingistų triukas ir radau paaiškinimą `Western Digital
Service and Support
<http://wdc.custhelp.com/cgi-bin/wdc.cfg/php/enduser/std_adp.php?p_faqid=615&p_created=1034613413&p_sid=eiuLrBVi&p_accessibility=0&p_redirect=&p_lva=1676&p_sp=cF9zcmNoPTEmcF9zb3J0X2J5PSZwX2dyaWRzb3J0PSZwX3Jvd19jbnQ9MTEsMTEmcF9wcm9kcz0yMjgsMjA5JnBfY2F0cz0xODQmcF9wdj0yLjIwOSZwX2N2PTEuMTg0JnBfc2VhcmNoX3R5cGU9YW5zd2Vycy5zZWFyY2hfZm5sJnBfcGFnZT0x&p_li=&p_topview=1>`_
svetainėje.

Tai gi turiu veikiantį 500 GB išorinį diską, kas toliau? Šio disko failų
sistema pagal nutylėjimą yra FAT32, kaip išsiaiškinau taip pasirinkta, kad butų
didesnis suderinamumas su daugeliu sistemų. Tačiau kaip žinia FAT32, vieno
failo maksimalus dydis gali būti tik 4 GB. Taip pat FAT32 skamba kažkaip tai
Windowsiškai... :)

Nieko nelaukdamas atsidariau gparted, (paspaudus Alt+F2)::

    gksu gparted 

Ten pasirinkau savo naująjį diską ir suformatavau jį naudodamas Ext3 failų
sistemą. Tačiau rezultatais buvau nepatenkintas. Pirmiausiai nepatiko vaizdas,
kurį išvydau:

.. figure:: files/u1/ext3-gparted.jpeg

    Gparted - Ext3

Naudojama 7.50 GiB! Kaip tai gali būti naudojama, kai ką tik suformatavau visą
diską! Vėliau išsiaiškinau, kad Ext3 failų sistema rezervuoja 5% disko vietos
root naudotojui. Taip daroma tuo tikslu, jei diskas bus perpildytas ir
programos nebeturės vietos kurti laikinus failus, taip galėsi bent jau bandyti
kažką daryti su root naudotoju, kuris dar turi rezervuotos vietos diske. Tiesa
dar skaičiau, kad kažkokiais tai būdais galima panaikinti tuos 5%, tačiau
toliau nesigilinau, nes užkliuvo dar vienas dalykas. Mano naujai suformatuotame
diske, nežinia iš kur atsirado katalogas lost+found. Išsiaiškinau, kad šis
katalogas naudojamas tuo tikslu, jei tikrinant diską su fsck bus rasta klaidų,
tai failai su tomis klaidomis, kad nebūtų sugadinti bandant taisyti klaidas
perkeliami į būtent šį lost+found katalogą.

Nepatiko man nei tie 5% rezervuoti root naudotojui, nei tas lost+found
katalogas, todėl nusprendžiau išbandyti kitą failų sistemą, kiek
pasiskaitinėjęs ir peržiūrėjęs įvairius palyginimus pasirinkau ReiserFS.  Po
formatavimo rezultatais buvau patenkintas:

.. figure:: files/u1/reiserfs-gparted.jpeg

    Gparted - ReiserFS

Jokio lost+found katalogo taip pat nebuvo, buvo tik tuštutėlis diskas, kurio
kiekvienas bitas skirtas mano poreikiams :)

Tačiau problemos tuo nesibaigė, užmontavus naujai suformatuotą diską, neturėjau
teisių į jį įrašyti, nes diską užmontavo root teisėmis. Pirmas dalykas, kuris
šovė į galvą – USB auto-mount konfigūracija, kuri randasi
/usr/share/hal/fdi/policy/10osvendor. Tačiau išbandžius visokius variantus
nieko gero nesigavo. Toliau bandžiau žaisti su /etc/fstab, tačiau taip pat
nieko gero nesigavo. Galiausiai perskaičiau, kad užtenka paprasčiausiai
rankiniu būdu pakeisti disko teises ir jos išliks tokios pačios kito
užmontavimo metu! :) Elementaru... :D

Tai gi užmontavau tuščią diską ir įvykdžiau tokią komandą::

      sudo chmod -R 0777 /media/disk 

Sekantį kartą užmontavus, teisės nepakito ir galėjau normaliai dirbti su disku,
su savo naudotoju.

Dar vienas dalykas, iki pilnos laimės - katalogo, pavadinimas. Man nepatiko,
kad mano didysis diskas užmontuojamas tokiu pačiu pavadinimu, kaip ir kitos USB
atmintinės – ``disk``. Įvykdžiau tokias komandas::

    sudo mkdir /media/mybook
    sudo echo "/dev/sdb1 /media/mybook reiserfs rw,user,nodev,nosuid,noauto 0 0" >> /etc/fstab

Ir nuo šiol mano didysis diskas užmontuojamas pavadinimu ``mybook``.

**Dėmesio**, jei bandysite tai padaryti su savo disku, nepamirškite pakeisti
/dev/sdb1 į savo disko kelią, kurį galite sužinoti mount komandos pagalba, kai
diskas yra užmontuotas.

Beje štai kaip atrodo naujasis diskas:

.. figure:: files/u1/wdmybook.jpg

    WD My Book 500 GB

