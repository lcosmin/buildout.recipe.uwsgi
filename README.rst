buildout.recipe.uwsgi
=====================

Forked from https://github.com/shaunsephton/shaunsephton.recipe.uwsgi

    
**Buildout recipe downloading, compiling and configuring uWSGI.**

Creates a ``bin/`` uWSGI_ executable and ``parts`` XML configuration file with which you can easily launch Buildout sandboxed uWSGI_ processes.

.. contents:: Contents
    :depth: 5


Changelog
---------

0.0.10
 
 * Added the version option to allow downloading a specific version of ``uwsgi``
 * Added the possibility of specifying a certain build profile
 * Options that should go in the generated ``.xml`` file should be ``xml-`` prefixed 



Usage
-----

Add a part to your ``buildout.cfg`` like so::

    [buildout]
    parts=uwsgi

    [uwsgi]
    recipe=buildout.recipe.uwsgi

Running the buildout will download and compile uWSGI_ and add an executable with the same name as your part in the ``bin/`` directory. In this case ``bin/uwsgi``. It will also create a ``uwsgi.xml`` configuration file in a ``parts`` directory with the same name as your part. In this case ``bin/uwsgi/uwsgi.xml``.

This allows you to start a uWSGI_ process configured by the generated XML file, i.e.::

    $ ./bin/uwsgi --xml parts/uwsgi/uwsgi.xml


You can specify any and all additional uWSGI_ configuration options as additional options of the Buildout part. These should be prefixed with ``xml-``. For instance to specify a socket and module and to enable the master process add ``xml-socket``, ``xml-module`` and ``xml-master`` options to the buildout part, i.e.::

    [buildout]
    parts=uwsgi

    [uwsgi]
    recipe=buildout.recipe.uwsgi
    version=1.2.5
    xml-socket=127.0.0.1:7001
    xml-module=my_uwsgi_package.wsgi
    xml-master=True
    

.. _uWSGI: http://projects.unbit.it/uwsgi/wiki/Doc

