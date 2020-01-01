.. title: Kaip paleisti darbinį LAMP serverį su buildout?
.. slug: kaip-paleisti-darbini-lamp-serveri-su-buildout
.. date: 2009-10-16 18:38:00 UTC+02:00
.. tags: python, floss, buildout
.. type: text

Jei kada bandėte programuoti su PHP, tikriausiai susidūrėte su LAMP serverio
diegimu ir konfigūravimu. Žinoma Ubuntu aplinkoje tai padaroma vienos komandos
pagalba, tačiau turi šiokių tokių minusų:

- PHP, Apache ir MySQL versijos yra tokios, kokias pateikia distribucija

- Pagal nutylėjimą, web-root katalogas yra /var/www ir turi ne itin draugiškas
  failų ir katalogų teises.

- Įdiegus LAMP, kiekvieną kartą paleidus kompiuterį, automatiškai startuoja
  Apache ir MySQL.

Yra kur kas paprastesnis ir švaresnis būdas programuoti su PHP, panaudojant
puikųjį buildout'ą. Nesiplečiant, štai komandos, kurių dėka turėsite pilnai
paruoštą darbui LAMP serverį::

    $ sudo apt-get install mercurial python-setuptools
    $ hg clone http://bitbucket.org/sirex/lamp-buildout/ web
    $ cd web
    $ python bootstrap.py
    $ bin/buildout

Paskutinė komanda parsisiųs naujausius Apache, PHP, MySQL, PhpMyAdmin,
Supervisor ir kitų paketų išeities tekstus, juos sukompiliuos, įdiegs į uždarą
buildout aplinką, sukonfigūruos ir paruoš pilnai veikiantį LAMP serverį.

Apache ir MySQL paleisti galėsite taip::

    $ bin/supervisord

Tai, kas paleista, galėsite kontroliuoti Web aplinkoje, adresu `localhost:9001
<http://localhost:9001/>`_. Pats Web'as bus pasiekiamas adresu: `localhost:9002
<http://localhost:9002/>`_. Portus galėsite keisti buildout.cfg faile.

PHP skriptus galėsite rašyti savo naudotojo teisėmis, web/htdocs kataloge.
Viskas, kas bus įdiegta visiškai nesipjaus su jūsų sistema.  Redaguodami
buildout.cfg failą, galėsite nusistatyti ką tik norite.  Galėsite nurodyti
kitas paketų versijas, įtraukti papildomus paketus, nurodyti PHP ar MySQL
kompiliavimo parametrus ir pan. Vėliau,

išsisaugoję šį failą, labai nesunkiai galėsite vėl atkurti viską, ką turėjote.

Mintį radau šioje svetainėje:

    http://aclark.net/team/aclark/blog/a-lamp-buildout-for-wordpress-and-other-php-apps

