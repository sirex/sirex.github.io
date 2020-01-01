.. title: Kaip pašalinti nereikalingus keitimus su mercurial transplant?
.. slug: kaip-pasalinti-nereikalingus-keitimus-su-mercurial-transplant
.. date: 2010-01-13 08:31:00 UTC+02:00
.. tags: mercurial
.. type: text

Išsiaiškinau įdomų dalyką, nusprendžiau pasidalinti atradimu.

Tarkime turite visą eilę pakeitimu, failuose su kuriais dirbate. Visus
pakeitimus saugote Mercurial DVCS pagalba. Po kurio laiko pastebite, kad dalis
darytų pakeitimų, gadina jūsų darbą ir norite juos pašalinti.

Pateiksiu pavyzdį, su vienu failu, kad būtų aiškiau. Tarkime turiu tokių
keitimų sąrašą::

    @ changeset: 6:e17baf640494
    | user: sirex
    | date: Tue Jan 12 22:20:33 2010 +0200
    | summary: c
    |
    o changeset: 5:95fc32abe5f2
    | user: sirex
    | date: Tue Jan 12 22:20:27 2010 +0200
    | summary: b
    |
    o changeset: 4:66c0e9ff6c77
    | user: sirex
    | date: Tue Jan 12 22:20:21 2010 +0200
    | summary: a
    |
    o changeset: 3:9f0e3fcf1600
    | user: sirex
    | date: Tue Jan 12 22:20:04 2010 +0200
    | summary: b
    |
    o changeset: 2:53fb42c364d2
    | user: sirex
    | date: Tue Jan 12 22:19:57 2010 +0200
    | summary: a
    |
    o changeset: 1:c9fa842d083d
    | user: sirex
    | date: Tue Jan 12 22:19:43 2010 +0200
    | summary: b
    |
    o changeset: 0:9c2929bb13fc
      user: sirex
      date: Tue Jan 12 22:19:11 2010 +0200
      summary: a

Visi šie keitimai keičia failą ``file.txt``, kiekviename pakeitime į failą
įkelta nauja eilute su raide, kuri nurodytą keitimo aprašyme.  Galutinis failo
turinys yra toks::

    $ cat file.txt
    a
    b
    a
    b
    a
    b
    c

Mano užduotis – pašalinti visus ``b`` keitimus. Norint tai atlinkti, reikia
visus gerus pakeitimus iškelti į kitą šaką.

Prieš pradedant ``transplant`` veiksmą, grąžiname savo darbinį katalogą į
paskutinį gerą keitimą::

    $ hg up 0

Tada pradedam ``transplant`` veiksmą::

    $ hg transplant -b 6
    changeset: 1:c9fa842d083d
    user: sirex <sirexas@gmail.com>
    date: Tue Jan 12 22:19:43 2010 +0200
    summary: b
     
    apply changeset? [ynmpcq?]: ?
    y: transplant this changeset
    n: skip this changeset
    m: merge at this changeset
    p: show patch
    c: commit selected changesets
    q: cancel transplant
    ?: show this help
    apply changeset? [ynmpcq?]:

Toliau reikia tiesiog spaudyti ``y``, jei pakeitimas yra geras arba ``n``, jei
blogas.

Jei geras keitimas yra susijęs su bloguoju, mercurial gali nesugebėti įkelti
gero keitimo, nes paprasčiausiai failo turinys, kurio pagrindu buvo atliktas
gerasis keitimas pasikeitė, pašalinus blogą keitimą.

Gaila, bet ``m: merge at this changeset`` nepavyko panaudoti, todėl jei
nepavyksta sujungti keitimų, tenka tai spręsti rankiniu būdu, taip::

    applying 9e6f5cccf15b
    patching file file.txt
    Hunk #1 FAILED at 0
    1 out of 1 hunks FAILED -- saving rejects to file file.txt.rej
    patch failed to apply
    abort: Fix up the merge and run hg transplant --continue

Atsidarykite nurodytą failą ``file.txt`` ir informacinį failą su informacija
apie nesutampantį fragmentą ``file.txt.rej``. Peržiūrėkite kas nesutampa ir
pataisykite originalų failą ``file.txt``.

Galiausiai turėsite naują šaką, tik su gerais pakeitimais::

    @ changeset: 9:e17baf640494
    | user: sirex
    | date: Tue Jan 12 22:20:33 2010 +0200
    | summary: c
    |
    o changeset: 8:c4671106cf7a
    | user: sirex
    | date: Tue Jan 12 22:20:21 2010 +0200
    | summary: a
    |
    o changeset: 7:f45376781321
    | parent: 0:9c2929bb13fc
    | user: sirex
    | date: Tue Jan 12 22:19:57 2010 +0200
    | summary: a
    |
    o | changeset: 6:e17baf640494
    | | user: sirex
    | | date: Tue Jan 12 22:20:33 2010 +0200
    | | summary: c
    | |
    o | changeset: 5:95fc32abe5f2
    | | user: sirex
    | | date: Tue Jan 12 22:20:27 2010 +0200
    | | summary: b
    | |
    o | changeset: 4:66c0e9ff6c77
    | | user: sirex
    | | date: Tue Jan 12 22:20:21 2010 +0200
    | | summary: a
    | |
    o | changeset: 3:9f0e3fcf1600
    | | user: sirex
    | | date: Tue Jan 12 22:20:04 2010 +0200
    | | summary: b
    | |
    o | changeset: 2:53fb42c364d2
    | | user: sirex
    | | date: Tue Jan 12 22:19:57 2010 +0200
    | | summary: a
    | |
    o | changeset: 1:c9fa842d083d
    | | user: sirex
    | | date: Tue Jan 12 22:19:43 2010 +0200
    | | summary: b
    |/
    o changeset: 0:9c2929bb13fc
      user: sirex
      date: Tue Jan 12 22:19:11 2010 +0200
      summary: a

Grįžtame atgal į pagrindinę šaką ir prijungiame atrinktus geruosius keitimus,
visiškai eliminuojant bloguosius::

    $ hg up 6
    $ hg --config ui.merge=internal:other merge 9
    $ hg ci -m "Atstatyti tik gerieji keitimai."

Galiausiai gausite tokį *file.txt* turinį::

    $ cat file.txt
    a
    a
    a
    c

Ir tokį keitimų medį::

    @ changeset: 9:e17baf640494
    | user: sirex
    | date: Tue Jan 12 22:20:33 2010 +0200
    | summary: Atstatyti tik gerieji keitimai.
    |\
    | o changeset: 9:e17baf640494
    | | user: sirex
    | | date: Tue Jan 12 22:20:33 2010 +0200
    | | summary: c
    | |
    | o changeset: 8:c4671106cf7a
    | | user: sirex
    | | date: Tue Jan 12 22:20:21 2010 +0200
    | | summary: a
    | |
    | o changeset: 7:f45376781321
    | | parent: 0:9c2929bb13fc
    | | user: sirex
    | | date: Tue Jan 12 22:19:57 2010 +0200
    | | summary: a
    | |
    o | changeset: 6:e17baf640494
    | | user: sirex
    | | date: Tue Jan 12 22:20:33 2010 +0200
    | | summary: c
    | |
    o | changeset: 5:95fc32abe5f2
    | | user: sirex
    | | date: Tue Jan 12 22:20:27 2010 +0200
    | | summary: b
    | |
    o | changeset: 4:66c0e9ff6c77
    | | user: sirex
    | | date: Tue Jan 12 22:20:21 2010 +0200
    | | summary: a
    | |
    o | changeset: 3:9f0e3fcf1600
    | | user: sirex
    | | date: Tue Jan 12 22:20:04 2010 +0200
    | | summary: b
    | |
    o | changeset: 2:53fb42c364d2
    | | user: sirex
    | | date: Tue Jan 12 22:19:57 2010 +0200
    | | summary: a
    | |
    o | changeset: 1:c9fa842d083d
    | | user: sirex
    | | date: Tue Jan 12 22:19:43 2010 +0200
    | | summary: b
    |/
    o changeset: 0:9c2929bb13fc
      user: sirex
      date: Tue Jan 12 22:19:11 2010 +0200
      summary: a
