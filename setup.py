from setuptools import setup, find_packages

setup(
    name='buildout.recipe.uwsgi',
    version='0.0.10',
    description='Buildout recipe downloading, compiling and configuring uWSGI.',
    long_description = open('README.rst', 'r').read() + open('AUTHORS.rst', 'r').read() + open('CHANGELOG.rst', 'r').read(),
    author='Shaun Sephton',
    author_email='shaunsephton@gmail.com',
    license='BSD',
    url='http://github.com/lcosmin/buildout.recipe.uwsgi',
    packages = find_packages(),
    include_package_data=True,
    classifiers = [
        "Programming Language :: Python",
        "License :: OSI Approved :: BSD License",
        "Development Status :: 4 - Beta",
        "Operating System :: OS Independent",
        "Framework :: Buildout",
        "Intended Audience :: Developers",
        "Topic :: Internet :: WWW/HTTP :: Dynamic Content",
    ],
    install_requires = [
        'zc.recipe.egg',
    ],
    zip_safe=False,
    entry_points = {'zc.buildout': ['default = buildout.recipe.uwsgi:UWSGI']},
)
