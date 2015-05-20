#!/bin/bash

recipe_path=$(dirname $0)


create_buildout_cfg() {

cat << _EOF > buildout.cfg
[buildout]
develop = ${recipe_path}
parts = uwsgi

[uwsgi]
recipe = buildout.recipe.uwsgi
_EOF

}

test_that_building_works() {
    create_buildout_cfg

    echo "[+] buildout.cfg: "
    cat buildout.cfg

    # test that the buildout works
    echo "[+] running buildout"
    buildout -vN

    if [[ ! -x "bin/uwsgi" ]]
    then
        echo "[!] failed to build binary"
        exit 1
    else
        echo "[+] successful"
    fi
}

test_build_in_barebones_environment() {
    create_buildout_cfg

    # clear environment except PATH, see what happens
    echo "[+] running buildout in barebones env"
    env -i PATH=${PATH} buildout -vN

    if [[ ! -x "bin/uwsgi" ]]
    then
        echo "[!] failed to build binary"
        exit 1
    else
        echo "[+] successful"
    fi
}

echo "----------------------------------------"
echo "starting test on branch ${TRAVIS_BRANCH} (pull request: ${TRAVIS_PULL_REQUEST})"
echo "----------------------------------------"

test_that_building_works
test_build_in_barebones_environment
