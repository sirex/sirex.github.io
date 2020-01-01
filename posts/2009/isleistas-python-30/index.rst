.. title: Išleistas Python 3.0
.. slug: isleistas-python-30
.. date: 2009-02-09 09:05:00 UTC+02:00
.. tags: python, floss
.. type: text

Šiandien pasirodė `Python 3.0 <http://python.org/download/releases/3.0/>`_.

Nieko nelaukdamas susikompiliavau ir išbandžiau.

Štai instrukcijos kaip susikompiliuoti į Ubuntu 8.10::

    sudo apt-get install build-essential checkinstall libgdbm3
    sudo apt-get build-dep python2.5 libreadline5 libgdbm3
    cd /tmp
    wget http://python.org/ftp/python/3.0/Python-3.0.tar.bz2
    echo "28021e4c542323b7544aace274a03bed *Python-3.0.tar.bz2" > md5sum
    md5sum -c md5sum
    tar -xjf Python-3.0.tar.bz2
    cd Python-3.0
    ./configure
    make
    sudo checkinstall --pkgname=py3k make altinstall

Jei bus kokių problemų su checkinstall, panašių į šias::

    ranlib: could not create temporary file whilst writing archive: No more archived files

Tai man padėjo tokia komanda:

.. code-block:: bash

    sudo mkdir -p /usr/local/lib/python3.0/config

O visas kitas kompiliavimas vyko ganėtinai sklandžiai.

Galiausiai paleidau python3.0 ir išbandžiau kaip viskas veikia::

    $ python3.0
    Python 3.0 (r30:67503, Dec 4 2008, 20:17:48)
    [GCC 4.2.4 (Ubuntu 4.2.4-1ubuntu3)] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>> print
    <built-in function print>
    >>> print()
     
    >>> print(print.__doc__)
    print(value, ..., sep=' ', end='\n', file=sys.stdout)
     
    Prints the values to a stream, or to sys.stdout by default.
    Optional keyword arguments:
    file: a file-like object (stream); defaults to the current sys.stdout.
    sep: string inserted between values, default a space.
    end: string appended after the last value, default a newline.
    >>> ą = 1
    >>> č = 2
    >>> ž = ą + č
    >>> print(ž)
    3
    >>> def функцийа():
    ...     print('Ето работает тоже...')
    ...
    >>> функцийа()
    Ето работает тоже...

Tai gi, kaip matyti iš pavyzdžio, dabar python su unikodu tvarkosi tiesiog
puikiai ir print, nuo šiol ne kalbos dalis, o paprasčiausia funkcija.

