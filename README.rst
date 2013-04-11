buildout.recipe.uwsgi
=====================

This is a `zc.buildout <http://www.buildout.org/>`_ recipe for downloading, installing and configuring uWSGI_ inside a buildout.
It compiles an uWSGI executable in ``bin/`` and a ``xml`` configuration file in ``parts/``.

Forked from `shaunsephton.recipe.uwsgi <https://github.com/shaunsephton/shaunsephton.recipe.uwsgi>`_ .


Changelog
=========

0.0.16

* documentation enhancements

0.0.15

* add option ``download-url`` to configure non-vanilla download url

0.0.14

* extra-paths fixes

0.0.13

* Minor code/documentation cleanups

0.0.12

* Fixed a bug when using 'use-system-binary' (was working backwards)
* Fixed build process when the part's name was something other than 'uwsgi'

0.0.11

* New option, use-system-binary, to skip building uwsgi

0.0.10

* Added the version option to allow downloading a specific version of ``uwsgi``
* Added the possibility of specifying a certain build profile
* Options that should go in the generated ``.xml`` file should be ``xml-`` prefixed


Usage
=====

Add a part to your ``buildout.cfg`` like this::

    [buildout]
    parts=uwsgi

    [uwsgi]
    recipe=buildout.recipe.uwsgi

Running the buildout will download and compile uWSGI and add an executable with the same name as your part in the ``bin/`` directory (e.g. ``bin/uwsgi``). It will also create a ``uwsgi.xml`` configuration file in a ``parts`` directory with the same name as your part (e.g. ``parts/uwsgi/uwsgi.xml``).

``uwsgi`` can then be started like::

    $ ./bin/uwsgi --xml parts/uwsgi/uwsgi.xml

Configuration options
=====================

You can specify a number of options for this recipe, for "fine-tuning" the build process. Below is an example of all possible options that can appear in the buildout file::


    [buildout]
    parts=uwsgi

    [uwsgi]
    recipe=buildout.recipe.uwsgi
    download-url=http://projects.unbit.it/downloads/uwsgi-{0}.tar.gz    
    version=1.2.5
    profile=default.ini
    use-system-binary=1
    xml-socket=127.0.0.1:7001
    xml-module=my_uwsgi_package.wsgi
    xml-master=True


download-url
    Specifies the url where uWSGI's source code should be downloaded from. ``{0}`` inside this url will be replaced by the value of the ``version`` option. The default value of ``download-url`` is ``http://projects.unbit.it/downloads/uwsgi-{0}.tar.gz``

version
    Version of uWSGI to download (default is ``latest``).

profile
    uWSGI has profiles (build configurations) which can be used to configure which plugins will be built with uWSGI (see https://github.com/unbit/uwsgi/tree/master/buildconf). Default is ``default.ini``.

use-system-binary
    It is possible to use an "external" uwsgi binary (installed by the OS' package manager or compiled manually) and just let the recipe generate the xml configuration file only (no building uWsgi). Default is ``False``.

xml-*
    Any option starting with ``xml-`` will be stripped of this prefix and written to the ``xml`` configuration file; for example, ``xml-socket=127.0.0.1:7001`` will be output as ``<socket>127.0.0.1:7001</socket>``.


Authors
=======

Created By
----------

#. Shaun Sephton


Fork Maintainer
---------------

#. Cosmin Luță `lcosmin <https://github.com/lcosmin>`_


Contributors
------------

#. `mooball <https://github.com/mooball>`_
#. `thefunny42 <https://github.com/thefunny42>`_
#. `rage2000 <https://github.com/rage2000>`_
#. `Andreas Motl <https://github.com/amotl>`_


.. _uWSGI: http://projects.unbit.it/uwsgi/wiki/Doc

