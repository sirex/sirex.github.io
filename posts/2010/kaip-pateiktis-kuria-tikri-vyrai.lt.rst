.. title: Kaip pateiktis kuria tikri vyrai!
.. slug: kaip-pateiktis-kuria-tikri-vyrai
.. date: 2010-05-23 16:22:00 UTC+02:00
.. tags: latex
.. type: text

Paskutiniu metu teko paruošti kelias `pateiktis
<http://www.likit.lt/term/p/pateiktis.html>`_, vieną darbe, kitą `OpenCamp
renginiui <http://www.ubuntu.lt/node/522>`_. Nusprendžiau pasidalinti
patirtimi, kaip paprastai sukurti pateiktis naudojant :math:LaTeX beamer
klasę.

Daugelis tikriausiai yra įpratę rašyti pateiktis naudodamiesi M$ PowerPoint
arba `OpenOffice.org Impress
<http://www.openoffice.org/product/impress.html>`_. Pateikčių rašymas,
naudojantis šiomis priemonėmis dažnai užima gan daug laiko.  Daugiausiai laiko
atima ne idėjos dėstymas, o visokie grafiniai apipavidalinimai, efektai ir
panašiai. Tenka dažnai matyti, kai žmonės su efektais persistengia ir pateiktys
gaunasi gan neskoningai efektais perkrautos.

LaTeX yra `ženklinimo kalba
<http://www.likit.lt/term/z2/z2enklinimo_kalba.html>`_ skirta dokumentų
ruošimui. Daugelis mokslinių darbų yra parašyti būtent naudojantis LaTeX.

Kaip įdiegti?
=============

Įdiegti į Ubuntu LaTeX yra labai paprasta, užtenka įdiegti du paketus iš
programų centro (Programos - Ubuntu programų centras): *texlive* ir *littex*.

Kaip naudoti?
=============

LaTeX galima rašyti su bet kokiu teksto redaktoriumi, tačiau yra specialiai tam
skirtų programų, kurios palengvina darbą. Aš pats naudoju `Texmaker
<http://www.xm1math.net/texmaker/>`_ programą. Viskas ką reikia žinoti apie šią
programa tai ši vieta:

|image0|

Sukūrus dokumentą pirmiausia reikia paspausti rodyklę prie „PDFLaTeX“, kad
sugeneruoti PDF dokumentą, vėliau rodyklę prie „View PDF“, kad peržiūrėti PDF
dokumentą.

Visos kitos funkcijos `Texmaker <http://www.xm1math.net/texmaker/>`_ programoje
yra intuityvios.

Kaip sukurti pateiktį su Texmaker?
==================================

Naują pateiktį sukursite labai paprastai. Pirmiausia iš Texmaker meniu
pasirinkite: File - New. Tada Wizard - Quick Start. Atsiradusiame lange
nurodykite tokius duomenis:

|image1|

Kai paspausite OK, Texmaker sugeneruos dokumento griaučius:

.. code-block:: latex

    \documentclass[12pt,a4paper]{beamer}
    \usepackage[utf8x]{inputenc}
    \usepackage{ucs}
    \author{Mantas Zimnickas}
    \begin{document}
    •
    \end{document}

Nepamirškite įrašyti dvi eilutes, kurių pagalba galėsite rašyti lietuviškai:

.. code-block:: latex

    \usepackage[L7x]{fontenc}
    \usepackage[lithuanian]{babel}

Pirmoji pateiktis
=================

Štai pilnas pateikties pavyzdys su dviem skaidrėmis:

.. code-block:: latex

    \documentclass[12pt,a4paper]{beamer}

    \usepackage[utf8x]{inputenc} \usepackage{ucs}
    \usepackage[L7x]{fontenc}
    \usepackage[lithuanian]{babel}

    \author{Mantas Zimnickas}
    \title{Mano pirmoji pateiktis}

    \begin{document}

    \frame{\titlepage}

    \frame {
        \frametitle{Sveikas pasauli!}
        Mano pirmoji pateiktis.
    }

    \end{document}

Išsaugokite šį dokumentą į atskirą katalogą ir naudokitės aukščiau aprašytomis
rodyklėmis.

Išvaizda
========

Beamer turi rinkinį temų, kaip jos atrodo galite apžiūrėti čia:

    http://www.pletscher.org/writings/latex/beamerthemes.php

Temą nurodyti galima taip:

.. code-block:: latex

    \usetheme{Malmoe}

Mano pateiktis
==============

Mano pateiktį, kurią paruošiau OpenCamp renginiu galite peržiūrėti čia:

    http://www.slideshare.net/sirexas/django-akllt-naujas-veidas

TeX failą prisegu žemiau.

.. |image0| image:: files/Pažymėjimas_001.png
.. |image1| image:: files/texmaker-quickstart.png

