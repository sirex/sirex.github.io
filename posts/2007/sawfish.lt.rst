.. title: Sawfish
.. slug: sawfish
.. date: 2007-07-29 17:00:00 UTC+02:00
.. tags: floss, linux, software
.. type: text

Ne kartą teko matyti kaip gražiai valdomi langai Mac OS X aplinkoje.  Viena iš
įdomiausių funkcijų langų valdyme yra ta, kad paspaudus mygtuką „Maximize“,
langas išdidinamas ne per visą ekraną, o išdidinamas iki optimalaus dydžio.
Žinoma tai smulkmena, bet labai naudinga, nes Gnome aplinkoje, nors lange yra
tik keli objektai, tačiau paspaudus „Maximize“, langas išdidinamas per visą
ekraną, ko pasekoje, pačiame lange atsiranda didžiuliai tušti plotai.

Ieškojau Internete ar yra galimybė padaryti kažką panašaus ką Mac OS X turi.
Pasirodo, pati programa turėtu pranešti langų valdytojui apie galimą optimalų
lango dydi, tačiau taip jau gavosi, kad toks dalykas nebuvo numatytas iš
pradžių, todėl visų programų neperdarysi.

Tačiau vis tik pavyko rasti langų valdytoją, pavadinimu „`Sawfish
<http://sawfish.wikia.com/>`_“. Šis langų valdytojas turi galybę funkcijų,
darbą su langais galima pritaikyti savo poreikiams iki mažiausių smulkmenų.

Pagal nutylėjimą Gnome aplinka langų valdymui naudoja „Metacity“, kuris yra dar
pakankamai jaunas ir galimybių kažką keisti jame tikrai trūksta.  Iškvietus
*gnome-session-properties* iš žymės „Current session“ galima pašalinti
„Metacity“ ir tada paleisti „Sawfish“. Po to išsaugojus sesiją, visą laiką bus
kraunama „Sawfish“, vietoje „Metacity“.

Labiausiai „Sawfish“ mane sudomino šiomis funkcijomis:

- **Maximize vertically/horizontally** - galima langą išdidinti ne tik per visą
  ekraną, bet tik vertikaliai arba tik horizontaliai. Puiki galimybė, senai to
  ieškojau.

- **Maximize fill window vertically/horizontally/full** - jei yra atidaryti
  keli langai, galima išdidinti juos taip, kad jie neuždengtų kitų langų.

- **Custom window focus** - galima pačiais įvairiausiais būdas valdyti aktyvų
  langą. Galima padaryti, kad aktyvus langas taptu aktyvus, tačiau neiššoktu
  virš kitų langų, galima numesti aktyvų langą po kitais langais, tačiau
  išlaikant jo aktyvią būseną. Galima nurodyti kad konkretus langas niekada
  netaptu aktyvus, tai reiškia, kad bet kuriuo metu paspaudus ką nors ant
  niekada aktyviu netampančiu lango, kiti langai nepraras aktyvumo. Šioje
  vietoje yra dar ir daugiau galimybių, kurių nespėjau „atrasti“ :)

- **Window matching** - panaudojus regexp, galima išrinkti atitinkančius langus
  ir priskirti jiems įvairiausius parametrus, pavyzdžiui, kad langas visada
  atsidarytų viršutiniame dešiniajame lange, arba kad jis būtų be rėmelių, arba
  naudotų tam tikrą langų rėmelių temą ir pan. Tokiu būdu gali susitvarkyti
  langus kaip tik širdis geidžia.

- **Key bindings** - galima keisti absoliučiai visus veiksmus susijusius su
  langais, jiems priskiriant tokias kombinacijas kaip tempimas kairiuoju
  klavišu ir panašiai.

- **Langų rėmeliai** - yra įvairiausių langų rėmelių temų, kur langų rėmeliai
  gali būti bet kokių formų, mygtukai gali būti išdėstyti įvairiausiose vietose
  ir pan. Taip pat kiekvienam langui gali būti priskirtas skirtinga lango
  rėmelio tema.

