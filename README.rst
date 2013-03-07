buildout.recipe.uwsgi
=====================

This is a `zc.buildout <http://www.buildout.org/>`_ recipe for downloading and installing uWSGI_ inside a buildout.
Forked from `shaunsephton.recipe.uwsgi <https://github.com/shaunsephton/shaunsephton.recipe.uwsgi>`_

Creates a ``bin/`` uWSGI_ executable and ``parts`` XML configuration file with which you can easily launch Buildout
sandboxed uWSGI_ processes.


Changelog
=========

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

Add a part to your ``buildout.cfg`` like so::

    [buildout]
    parts=uwsgi

    [uwsgi]
    recipe=buildout.recipe.uwsgi

Running the buildout will download and compile uWSGI_ and add an executable with the same name as your part in the ``bin/`` directory. In this case ``bin/uwsgi``. It will also create a ``uwsgi.xml`` configuration file in a ``parts`` directory with the same name as your part. In this case ``bin/uwsgi/uwsgi.xml``.

This allows you to start a uWSGI_ process configured by the generated XML file, i.e.::

    $ ./bin/uwsgi --xml parts/uwsgi/uwsgi.xml

It is also possible to use an "external" uwsgi binary (installed by the means of the OS package manager or compiled manually) and just let the recipe to generate the xml file with settings::

    [uwsgi]
    recipe=buildout.recipe.uwsgi
    use-system-binary = True

And then run it with::

    $ /usr/bin/uwsgi --xml parts/uwsgi/uwsgi.xml

You can specify any and all additional uWSGI_ configuration options as additional options of the Buildout part. These should be prefixed with ``xml-``. For instance to specify a socket and module and to enable the master process add ``xml-socket``, ``xml-module`` and ``xml-master`` options to the buildout part, i.e.::

    [buildout]
    parts=uwsgi

    [uwsgi]
    recipe=buildout.recipe.uwsgi
    version=1.2.5
    xml-socket=127.0.0.1:7001
    xml-module=my_uwsgi_package.wsgi
    xml-master=True


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


.. _uWSGI: http://projects.unbit.it/uwsgi/wiki/Doc

