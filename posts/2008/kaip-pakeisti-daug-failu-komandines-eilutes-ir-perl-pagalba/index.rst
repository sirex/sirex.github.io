.. title: Kaip pakeisti daug failų komandinės eilutės ir perl pagalba
.. slug: kaip-pakeisti-daug-failu-komandines-eilutes-ir-perl-pagalba
.. date: 2008-11-07 11:54:00 UTC+02:00
.. tags: shell, perl
.. type: text

Programuodamas patekau į tokią situaciją, kurioje reikėjo surasti tam tikrus
failus, kuriuose nėra aprašytas klasės parametras ir įrašytą tą trūkstamą
parametrą į klasės vidų.

Pasinaudodamas komandine eilute ir nedideliu perl skriptu tai nesunkiai
padariau.

Perl skriptas atrodo taip:

.. code-block:: perl

    print;
    
    if (/^class/) {
        use File::Basename;
        my $layout = basename(dirname($ARGV));
        print "\n   public \$layout = '$layout';\n";
    }
    

O komanda atrodo taip:

.. code-block:: bash

    find -wholename "*/themes/*/layouts/*/config.php" \
        | xargs grep -L "public \$layout" \
        | while read f ; do \
            perl -ni /tmp/replace.pl $f ; \
        done

Naudojantis komandine eilute, labai nesunkiai galima automatizuoti įvairiausias
užduotis. Šiame pavyzdyje, vietoje to, kad keliaučiau per visus failus ir
rankomis viską keisčiau, tiesiog pasinaudojau nedidele komanda :)

