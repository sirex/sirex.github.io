.. title: Python paketai
.. slug: pypi
.. date: 2011-08-25
.. tags: python
.. type: text

Paketo kūrimas
==============

Mano Python paketus dažniausiai sudaro tokie failai:

``setup.py``
    Pagrindinis paketo failas, kuriame aprašoma paketo meta informacija. Šio
    failo turinys atrodo taip:

    .. code-block:: python

        from distutils.core import setup

        setup(
            name='mypkgname',
            version='0.1',
            author='My Name',
            author_email='my at mail.com',
            py_modules=['pkgmodule'],
            url='pkgurl',
            license='gpl.txt',
            description='pkg description',
            long_description=open('README.rst').read(),
            classifiers=[
                'Development Status :: 5 - Production/Stable',
                'License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)',
                'Programming Language :: Python :: 3',
            ]
        )

``MANIFEST.in``
    Failas, kuriame nurodoma, kurie failai turi būti įtraukti į paketą.
    Pavyzdys::

        include *.txt
        include *.rst
        include Makefile
        recursive-include src

``Makefile``
    Failas, kuris paruošia aplinką darbui su šiuo paketu. Šis failas nieko
    bendro su Python paketais neturi, tačiau naudinga jį turėti.

``README.rst``
    Išsamus aprašymas kaip paketas veikia, kam jis skirtas ir kaip juo
    naudotis.
  
``gpl.txt``
    Licencijos failas. Pagal nutylėjimą, daugelio šalių įstatymai draudžia
    naudoti bet kokį autorinį kūrinį, jei nenurodyta, kaip ir kas galį kūrinį
    naudoti. Todėl, jei norite, kad kas nors galėtų pasinaudoti jūsų paketu,
    turite nurodyti jo naudojimo sąlygas.

    Teisiškai galiojančias naudojimo sąlygas aprašyti yra gan sudėtinga, todėl
    saugiausias pasirinkimas GPL_ licencija.

Paketo kėlimas į PyPI
=====================

Kad užregistruotumėte savo Python paketą į PyPI_ paketų repozitoriją, atlikite
šiuose veiksmus:

1. Užregistruokite naujo paketo (arba naujos seno paketo versijos) meta
   duomenis, aprašytus ``setup.py`` faile::

       python setup.py register -r pypi

   ``-r pypi`` reikia nurodyti tik tuo atveju, jei naudojate ``~/.pypirc``
   failą. Jei turite šį failą, tuomet ``pypi`` nurodo konfigūracijos sekciją,
   tame faile (``[pypi]``).

2. Įkelkite išeities teksto paketą į PyPI_::

       python setup.py sdist upload

3. Jei jūsų paketas turi dokumentaciją, įkelkite atnaujintą dokumentacijos
   versiją::

       python setup.py build_sphinx upload_sphinx

PyPI per SSH
============

Rekomenduoju naudoti pypissh_ paketą, kuris leidžia susisiekti su PyPI_
serveriu per ssh, naudojant `ssh raktus`_. Tokiu būdu nereikia atviru tekstu,
konfigūraciniuose failuose saugoti PyPI_ slaptažodžio ir nereikia kiekvieną
kartą įvedinėti slaptažodžio.

1. ``pypissh`` paketą siūlau įsidiegti į kokį nors izoliuotą virtualenvą_, nes
   jis mokeypatchina_ Python distutils_ paketą, kas gal būt gali sukelti kokių
   nors problemų į diegus į sistemą. ``pypissh`` įdiegsite taip::

       pip -E /tmp/pypissh-env install pypissh
       source /tmp/pypissh-env/bin/activate

2. Įkelkite savo ssh raktą į PyPI_, naudotojo profilio nustatymuose_.

3. Toliau reikia susikurti PyPI_ konfigūracinė falą ``~/.pypirc``, kurio
   turinys atrodo taip:

   .. code-block:: ini

       [distutils]
       index-servers =
           pypi

       [pypi]
       repository: httpssh://submit@ssh.pypi.python.org/pypi
       username: yourusername
       password: pypissh

   Nepamirškite ``yourusername`` pakeisti į savo PyPI_ naudotojo vardą,
   slaptažodis gali būti bet, koks (svarbu, ne tuščias). Jei slaptažodis nebus
   nurodytas, tada prašys jį įvesti.



.. _ssh raktus: /ssh-pamokeles.html

.. _PyPI: http://pypi.python.org/pypi
.. _distutils: http://docs.python.org/distutils/
.. _mokeypatchina: http://en.wikipedia.org/wiki/Monkey_patch
.. _nustatymuose: http://pypi.python.org/pypi?%3Aaction=user_form
.. _pypissh: http://pypi.python.org/pypi/pypissh
.. _virtualenvą: http://www.virtualenv.org/
.. _GPL: http://www.gnu.org/licenses/gpl.html

