buildout.recipe.uwsgi
=====================

This is a `zc.buildout <http://www.buildout.org/>`_ recipe for downloading, installing and configuring uWSGI_ inside a buildout.
It compiles an uWSGI executable in ``bin/`` and a ``xml`` configuration file in ``parts/``.

Forked from `shaunsephton.recipe.uwsgi <https://github.com/shaunsephton/shaunsephton.recipe.uwsgi>`_ .


Changelog
=========

0.0.24

* For the paranoid: Add option ``md5sum`` to force checksum validation of
  downloaded tarball.

0.0.23

* Correctly splitting on '\\n' when dealing with multiline options

0.0.22

* Using `subprocess.check_call` for compatibility with Python 2.6

0.0.21

* Check if you need to rebuild uwsgi when updating buildout (which
  didn't work before because update didn't return the list of
  installed paths).

* Always delete the build directory (even in case of errors).

* Call uwsgiconfig.py instead of make to install uWSGI. This let you
  choose which python you want to use.

* Check the version of uwsgi if it is already installed.

* Add an option to configure the path of the generated uWSGI
  configuration file.

0.0.20

* Fixed download cache issue; if download-cache is present in the [buildout] section, it will be used for caching the source archive of uwsgi after download

0.0.19

* Setting the PYTHON_BIN env variable to the current python interpreter (for building uwsgi with the right interpreter)

0.0.18

* Fixed issue #11

0.0.17

* Add option "pythonpath-eggs-directory" to tweak base directory of generated pythonpath configuration directives

0.0.16

* Documentation enhancements

0.0.15

* Add option ``download-url`` to configure non-vanilla download url

0.0.14

* Extra-paths fixes

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
    md5sum=d23ed461d1848aee4cfa16bde247b293
    profile=default.ini
    use-system-binary=1
    xml-socket=127.0.0.1:7001
    xml-module=my_uwsgi_package.wsgi
    xml-master=True


download-url
    Specifies the url where uWSGI's source code should be downloaded from. ``{0}`` inside this url will be replaced by the value of the ``version`` option. The default value of ``download-url`` is ``http://projects.unbit.it/downloads/uwsgi-{0}.tar.gz``

version
    Version of uWSGI to download (default is ``latest``).

md5sum
    MD5 checksum for the source tarball.  An error will be raised
    upon mismatch. If left unset no check is performed.

output
    Path where the uWSGI configuration file is generated (default to a
    file called ``name of the part.xml`` in the parts directory).

profile
    uWSGI has profiles (build configurations) which can be used to configure which plugins will be built with uWSGI (see https://github.com/unbit/uwsgi/tree/master/buildconf). Default is ``default.ini``. If the specified profile is an absolute path, then that is going to be used, otherwise the profile configuration is searched in ``uwsgi``'s source folder (``buildconf/``), finally falling back to the current directory (where buildout is invoked from).

use-system-binary
    It is possible to use an "external" uwsgi binary (installed by the OS' package manager or compiled manually) and just let the recipe generate the xml configuration file only (no building uWsgi). Default is ``False``.

pythonpath-eggs-directory
    By default, the configuration generator will use absolute paths to python eggs, usually inside ``buildout:eggs-directory`` by calling ``zc.recipe.egg.Egg(...).working_set()``.
    To support setups which require using the option ``relative-paths = true``, this option allows to tweak the base directory of generated uwsgi pythonpath configuration directives, e.g.::

        pythonpath-eggs-directory = /opt/vendor/product/python/eggs


xml-*
    Any option starting with ``xml-`` will be stripped of this prefix and written to the ``xml`` configuration file; for example, ``xml-socket=127.0.0.1:7001`` will be output as ``<socket>127.0.0.1:7001</socket>``.

    For any options that should not take an argument, specify the option with a value of ``true`` (case insensitive); for example ``xml-disable-logging = true`` will be output as ``<disable-logging/>``.


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
#. `davidjb <https://github.com/davidjb>`_
#. `apoh <https://github.com/apoh>`_
#. `Jeff Dairiki <https://github.com/dairiki>`_
#. `wiseteck <https://github.com/wiseteck>`_

.. _uWSGI: http://projects.unbit.it/uwsgi/wiki/Doc
