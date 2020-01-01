.. title: Pencijų fondai
.. slug: penciju-fondai
.. date: 2016-09-22 07:35:00 UTC+03:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text

Duomenys imami iš `Lietuvos Banko svetainės`__.

.. __: https://www.lb.lt/ii_pakopos_pensiju_fondu_irr_rodiklis

Fondai lyginami pagal `IRR rodiklį`__.

.. __: https://www.lb.lt/ii_pakopos_pensiju_fondu_irr_rodiklis

IRR (*internal rate of return* – vidinė grąžos norma) parodo, kiek per metus
vidutiniškai paauga (procentais) kiekvienas iš atliktų SODRA pervedimų
(investicijų) į pensijų fondus. IRR atsižvelgia į visus pensijų fondų
atskaitymus bei į lėšų pervedimo laiką.

Palyginimui paimti duomenys 3 metų trukmės fondo veiklos laikotarpio.

..
    import os
    import re
    import collections
    import numpy as np
    import pandas as pd
    import matplotlib as mpl
    import requests
    import bs4
    import matplotlib.pyplot as plt
    from IPython.display import display

..
    mpl.rc('figure', figsize=(16, 10))

Duomenų surinkimas ir valymas
=============================

Lietuvos bankas, duomenis apie pensijų fondus pateikia formatu, kurį sunku
analizuoti, todėl, pirmiausia reikia susirinkti duomenis ir juos susitvarkyti,
taip, kad būtų galima atlikti duomenų analizę.

Pirmiausiai parsisiunčiame visus ataskaitų failus:

.. code-block:: ipython

    resp = requests.get('https://www.lb.lt/ii_pakopos_pensiju_fondu_irr_rodiklis')
    soap = bs4.BeautifulSoup(resp.content, 'lxml')
    files = [x['value'] for x in soap.select('select.samewin option') if x['value'] != '#']
    with open('urls', 'w') as f:
        for x in files:
            f.write('https://www.lb.lt/%s\n' % x)
    !wget --quiet --input-file urls


Analizei bus naudojami šių ataskaitų duomenis:

.. code-block:: ipython

    !cat urls

::

    https://www.lb.lt/irr_2016-06-30
    https://www.lb.lt/irr_2016-03-31
    https://www.lb.lt/irr_2015-12-31
    https://www.lb.lt/irr_2015-09-30
    https://www.lb.lt/irr_2015-06-30
    https://www.lb.lt/irr_2015-03-31
    https://www.lb.lt/irr_2014-12-31
    https://www.lb.lt/irr_2014-09-30
    https://www.lb.lt/irr_2014-06-30
    https://www.lb.lt/irr_2014-03-31
    https://www.lb.lt/irr_2013-12-31
    https://www.lb.lt/irr_2013-08-31
    https://www.lb.lt/irr_2013-05-31
    https://www.lb.lt/irr_2012-12-31
    https://www.lb.lt/irr_2012-08-31
    https://www.lb.lt/irr_20120531
    https://www.lb.lt/irr_20120229
    https://www.lb.lt/irr_20110831
    https://www.lb.lt/irr_20110331
    https://www.lb.lt/irr_20110228
    https://www.lb.lt/irr_20101231
    https://www.lb.lt/irr_20100930
    https://www.lb.lt/irr_20100331
    https://www.lb.lt/irr_20091231
    https://www.lb.lt/irr_20090615

Išvalome ir sujungiame visus duomenų failus:

.. code-block:: ipython

    sheet_names = {
        'irr_20090615': 'IRR',
    }
    clean = []
    # Atidarome visus duomenų failus
    data = [
        (x, pd.read_excel(x, sheetname=sheet_names.get(x, 0)))
        for x in os.listdir() if x.startswith('irr_')
    ]
    for i, (filename, d) in enumerate(data):
        try:
            # Randame eilutę, kurioje yra 'IRR*' stulpelis.
            column_row = next(x.Index for x in d.itertuples() if 'IRR*' in x or 'IRR' in x)
            # Ataskaitos failo data.
            match = re.match('Suskaičiuota (.+) dienai', d.columns[0])
            if match:
                dt = pd.to_datetime(match.group(1))
            else:
                dt = pd.to_datetime(d.columns[1])
            # Keičiame lentelės stulpelių pavadinimus į eilutę, kurioje radom 'IRR*' stulpelį.
            d.columns = d.ix[column_row].values
            # Konvertuojame 'IRR*' stulpelį į skaitinį tipą.
            d['IRR'] = pd.to_numeric(d['IRR*'] if 'IRR*' in d else d['IRR'], errors='coerce')
            # Pridedame naują stulpelį į lentelę su ataskaitos data.
            d['Data'] = dt
            # Pašaliname visas eilutes iš lentelės, kurios neturi IRR reikšmės.
            d.dropna(subset=['IRR'], inplace=True)
            # Kai kuriose ataskaitose nepateikiama pensijų kaupimo bendrovė
            if 'Pensijų kaupimo bendrovė' not in d.columns:
                d['Pensijų kaupimo bendrovė'] = None
                d['Pensijų fondo pavadinimas'] = d['Fondas']
            # Iš lentelės pasirenkame mus dominančius stulpelius.
            d = d[['Pensijų kaupimo bendrovė', 'Pensijų fondo pavadinimas', 'Data', 'IRR']]
            # Išsisaugome išvalytę lentelę.
            clean.append(d)
        except:
            print(i)
            print(filename)
            display(d)
            raise
    # Sujungiame visų ataskaitų lenteles į vieną lentelę.
    d = pd.concat(clean)

Suvienodiname pasikeitusių bendrovių ir fondų pavadinimus:

.. code-block:: ipython

    renames = {
        'Danske konservatyvaus valdymo': 'Danske pensija',
        'Konservatyvaus valdymo Danske pensija': 'Danske pensija',
        
        'ERGO Life Insurance SE': 'UAB "ERGO Lietuva gyvybės draudimas"',
        'ERGO Balans': 'ERGO balans',
        'ERGO Konservatyvusis': 'ERGO konservatyvusis',
        
        # http://www.invaldalt.com/lt/main/naujienos/Kitos_naujienos?ID=1331
        'UAB "Finasta Asset Management"': 'UAB "INVL Asset Management"',
        'Finasta Konservatyvaus investavimo': 'INVL STABILO II 58+',
        'Finasta Aktyvaus investavimo': 'INVL MEDIO II 47+',
        'Finasta Racionalios rizikos': 'INVL EXTREMO II 16+',
        'Finasta Nuosaikus': 'INVL STABILO II 58+',
        'Finasta Augančio pajamingumo': 'INVL MEZZO II 53+',
        'Finasta Subalansuotas': 'INVL MEDIO II 47+',

        'UAB "MP Pension Funds Baltic"': 'UAB "INVL Asset Management"',
        'MP Stabilo II': 'INVL STABILO II 58+',
        'MP Medio II': 'INVL MEDIO II 47+',
        'MP Extremo II': 'INVL EXTREMO II 16+',

        'Invalda Konservatyvus': 'INVL STABILO II 58+',
        'Invalda Nuosaikus': 'INVL STABILO II 58+',
        'Invalda Augančio pajamingumo': 'INVL MEZZO II 53+',
        'Invalda Aktyvaus investavimo': 'INVL MEDIO II 47+',
        'Invalda Subalansuotas': 'INVL MEDIO II 47+',
        'Invalda Racionalios rizikos': 'INVL EXTREMO II 16+',

        'INVL aktyvaus investavimo': 'INVL MEDIO II 47+',
        'INVL racionalios rizikos': 'INVL EXTREMO II 16+',
    }
    def apply(x):
        if x:
            x = (
                x.strip().
                replace('Pensija', 'pensija').
                replace('Ekstra', 'ekstra').
                replace('DnB NORD', 'DNB').
                replace('DnB', 'DNB')
            )
            x = renames.get(x, x)
        return x
    d['Pensijų kaupimo bendrovė'] = d['Pensijų kaupimo bendrovė'].apply(apply)
    d['Pensijų fondo pavadinimas'] = d['Pensijų fondo pavadinimas'].apply(apply)

Atstatome bendrovių pavadinimus, lentelėse, kuriose jie nebuvo pateikti.
Bendrovių pavadinimai atstatomi pagal fondų pavadinimus.

.. code-block:: ipython

    unique = lambda x: list(collections.OrderedDict.fromkeys(x))
    bendroves = {
        x: unique(g['Pensijų fondo pavadinimas'].values)
        for x, g in d.groupby(['Pensijų kaupimo bendrovė'])
    }
    fondai = {x: k for k, v in bendroves.items() for x in v}
    d['Pensijų kaupimo bendrovė'] = d.apply(lambda x: (
        x['Pensijų kaupimo bendrovė']
        if x['Pensijų kaupimo bendrovė']
        else fondai[x['Pensijų fondo pavadinimas']]
    ), axis=1)

Galiausiai gauname išvalytą lenterę su duomenimis iš visų Lietuvos banko
ataskaitų, kuri tarodo taip:

.. code-block:: ipython

    d.head()

== ========================================== ========================== =========== ======
#  Pensijų kaupimo bendrovė                   Pensijų fondo pavadinimas  Data        IRR
== ========================================== ========================== =========== ======
4  UAGDPB "AVIVA Lietuva"                     Aviva Europensija          2014-06-30  0.0302
5  UAB "Danske Capital investicijų valdymas"  Danske pensija             2014-06-30  0.0316
6  UAB "DNB investicijų valdymas"             DNB pensija 1              2014-06-30  0.0257
7  UAB "ERGO Lietuva gyvybės draudimas"       ERGO konservatyvusis       2014-06-30  0.0272
8  UAB "INVL Asset Management"                INVL STABILO II 58+        2014-06-30  0.0507
== ========================================== ========================== =========== ======

Transformuojame lentelę į tokį pavidalą, kuris leidžia palyginti IRR įvairiais
pjūviais.

.. code-block:: ipython

    pivot = pd.pivot_table(d, index='Data', values='IRR', columns=[
        'Pensijų kaupimo bendrovė',
        'Pensijų fondo pavadinimas',
    ])
    pivot.ix[:3,:6]


=============================== ======================= ======================= =============== =============== =============== ===========
Pensijų kaupimo bendrovė        UAB "Citadele investicijų valdymas"             UAB "DNB investicijų valdymas"
------------------------------- ----------------------------------------------- -----------------------------------------------------------
Pensijų fondo pavadinimas       Citadele pensija 1      Citadele pensija 2      DNB pensija 1   DNB pensija 2   DNB pensija 3   ERGO balans
=============================== ======================= ======================= =============== =============== =============== ===========
Data                            \                       \                       \               \               \               \          
------------------------------- ----------------------- ----------------------- --------------- --------------- --------------- -----------
2009-06-15                      NaN                     NaN                     0.019374        0.001624        -0.020811       NaN
2009-12-31                      NaN                     NaN                     0.076045        0.161496        0.219199        NaN
2010-03-31                      NaN                     NaN                     0.034633        0.041592        0.041157        NaN
=============================== ======================= ======================= =============== =============== =============== ===========

Pensijų kaupimo bendrovių palyginimas
=====================================

Visų bendrovių, visų fondų vidutinis IRR
----------------------------------------

.. code-block:: ipython

    fig = plt.figure()
    plt.fill_between(pivot.index, pivot.min(axis=1), pivot.max(axis=1), color='grey', alpha=0.15)
    frame = pivot.groupby(axis=1, level=0).mean()
    frame[frame.mean().sort_values(ascending=False).index].plot(grid=True, colormap='jet', figsize=(16, 12), ax=fig.axes[0])
    plt.ylabel('IRR')

.. thumbnail:: /images/2019/pensiju-fondai/vidutinis-irr.png
   :alt: Visų bendrovių, visų fondų vidutinis IRR
   :class: whitebg

Kievienos bendrovės fondų palyginimas
-------------------------------------

Žemiau pateikiamas sąrašas grafikų, kuriuose pavaizduoti kiekvienos bendrovės
fondų IRR rodikliai, laike. Šviesiai pilkas fonas rodo geriausių ir blogiausių
fondų IRR ribas, o tamsiai pilkas fonas parodo visų fondų vidurkio standartinio
nuokrypio ribas.

.. code-block:: ipython

    names = pivot.groupby(axis=1, level=0).mean().mean().sort_values(ascending=False).index
    fig, axes = plt.subplots(len(names), 1, figsize=(16, 10 * len(names)))
    mean, std = pivot.mean(axis=1), pivot.std(axis=1)
    for i, name in enumerate(names):
        axes[i].fill_between(pivot.index, pivot.min(axis=1), pivot.max(axis=1), color='grey', alpha=0.15)
        axes[i].fill_between(pivot.index, mean-std, mean+std, color='grey', alpha=0.15)
        pivot[name].plot(grid=True, ax=fig.axes[i])
        axes[i].set_ylabel('IRR')
        axes[i].get_legend().set_title(name)


.. thumbnail:: /images/2019/pensiju-fondai/fondai.png
   :alt: Kievienos bendrovės fondų palyginimas
   :class: whitebg

Visų fondų IRR rodiklio vidurkis
--------------------------------

.. code-block:: ipython

    pivot.groupby(axis=1, level=0).mean().mean().sort_values().plot.barh()

.. thumbnail:: /images/2019/pensiju-fondai/irr-vidurkis.png
   :alt: Visų fondų IRR rodiklio vidurkis
   :class: whitebg
