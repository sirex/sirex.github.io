.. title: Radio stočių surinkimas į audacious
.. slug: radio-stociu-surinkimas-i-audacious
.. date: 2011-07-21
.. tags: shell, floss, audacious
.. type: text

Internete galima rasti daug nuorodų į internetines radio stotis. Štai vienas iš
pavyzdžių:

http://rock-radio.50webs.com/

Ten pateikta gan nemažai nuorodų į internetines radio stotis. Šiuo metu kai
rašau, yra 42 nuorodos. Peržiūrėti ir paklausyti visas šias radio stotis yra
gan sudėtinga, jei kiekvieną nuorodą reikėtų įkelti į grojaraštį rankiniu būdu.

Štai būdas, kaip visas nuorodas galima surinkti ir įkelti į audacious:

.. code-block:: sh

    wget http://rock-radio.50webs.com/ -O- | \
        egrep -o 'http://[^"]+' | \
        egrep '(pls|m3u)$' | \
        while read url ; do \
            audacious2 -e $url ; \
        done

Įvykdžius šią komandą, visos nuorodos į radio stotis, pateiktos toje svetainėje
atsidurs audacious grojaraštyje, vienu sartu.

Tą patį galima padaryti ir su `lietuviškomis radio stotimis`__:

.. __: http://www.klausyk.lt/lt/visos_radijo_stotys/

.. code-block:: sh

    wget http://www.klausyk.lt/lt/visos_radijo_stotys/ -O- | \
        egrep -o 'http://[^"]+' | \
        egrep '(pls|m3u)$' | \
        while read url ; do \
            audacious2 -e $url ; \
        done

Gero klausymosi.

.. note::

    Pateikta informacija tinka visoms unix-like operacinėms sistemoms.
