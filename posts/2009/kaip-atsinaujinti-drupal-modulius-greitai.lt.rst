.. title: Kaip atsinaujinti Drupal modulius greitai?
.. slug: kaip-atsinaujinti-drupal-modulius-greitai
.. date: 2009-10-19 23:09:00 UTC+02:00
.. tags: floss, drupal, shell
.. type: text

Kaip žinia, mano blogas sukasi ant Drupal. Naudoju 25 papildomus modulius.
Anksčiau ar vėliau atsiranda naujesnės tų modulių versijos.  Kadangi aš retai
atsinaujinu, tai kai prisiruošiu patikrinti, praktiškai visi moduliai
reikalauja atnaujinimo...

Koks tingus Windows naudotojas, ko gero siųstų visus atnaujinimus po vieną ir
keltį per FTP. Tačiau vikrus Linux naudotojas, toks kaip aš, darytų taip:

Iš atnaujinimų puslapio ``/admin/reports/updates`` išsaugome turinį į
``/tmp/updates.html`` ir įvedame kelias komandas:

.. code-block:: bash

    mkdir /tmp/updates && cd /tmp/updates
    egrep -o 'http.*?\.tar\.gz' /tmp/updates.html | \
      grep -v 'dev\.tar\.gz' | \
      while read f ; do \
          wget $f -O- | \
          tar -xzf - ; \
      done
    lftp manosvetaine
    lftp me@manosvetaine:/www> cd sites/all/modules
    lftp me@manosvetaine:/www/sites/all/modules> mirror -R

Aplankome ``/update.php`` ir įdiegiame visus atnaujinimus.  Žinoma, prieš
darant tokius atnaujinimus, būtina pasidaryti atsargines kopijas.

Ką tik, kaip tik taip atsinaujinau 18 modulių. Viskas suveikė sėkmingai ir be
priekaištų.

