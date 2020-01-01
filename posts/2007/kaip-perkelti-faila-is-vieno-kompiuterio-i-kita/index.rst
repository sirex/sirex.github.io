.. title: Kaip perkelti failą iš vieno kompiuterio į kitą?
.. slug: kaip-perkelti-faila-is-vieno-kompiuterio-i-kita
.. date: 2007-09-13 08:50:00 UTC+02:00
.. tags: shell
.. type: text

Kaip perkelti failą iš vieno kompiuterio, į kitą, jei nėra pakankamai didelės
laikmenos jam pernešti ir neveikia nei samba, nei ftp, nei kiti failų
apsikeitimo protokolai? Yra tik vietinis tinklas.

Vakar kaip tik susidūriau su tokia problema, turėjau du kompiuterius, abiejuose
buvo įdiegta Ubuntu Feisty Fawn OS. Man reikėjo iš vieno kompiuterio perkelti
702 MB failą, kuris niekaip netilpo į paprastą 700 MB talpos CD. Nei viename
kompiuteryje nebuvo nei SAMBos, nei FTP.

Prisiminiau apie seną gerą programikę, kuri vadinasi NetCat, Ubuntu OS ji būna
įdiegta pagal nutylėjimą. Tai gi iš pradžių sukonfigūravau tinklą tarp dviejų
kompiuterių:

**Kompiuteris 1**::

    sudo ifconfig eth0 down
    sudo ifconfig eth0 inet 192.168.0.1 up

**Kompiuteris 2**::

    sudo ifconfig eth0 down
    sudo ifconfig eth0 inet 192.168.0.2 up

Po šių komandų abu kompiuteriai pradėjo vienas kitą matyti tinkle.  Toliau
viename kompiuteryje paleidau NetCat programą klausymosi režimu, o kitame
prisijungiau prie klausomo prievado ir perdaviau failą.  Komandos atrodo taip:

**Kompiuteris 1**::

    nc -l -p 8888 > didelis_failas.iso

**Kompiuteris 2**::

    nc 192.168.0.1 8888 < didelis_failas.iso

Ir failo persiuntimas pavyko! Pirmame kompiuteryje atsidaręs kitą konsolę
patikrinau failo didį ir jis nuolat didėjo, tada palaukiau, kol didėjimas
sustos ir nutraukiau NetCat programos veikimą paspausdamas Ctrl + C. Atsidariau
failą ir jis veikė puikiausiai.

Tai štai koks visai nesudėtingas būdas, naudojantis primityviomis priemonėmis
apsikeisti failais tarp dviejų kompiuterių. Gal būt kam nors, kada nors ši
informacija labai pravers, kaip pravertė man :)

