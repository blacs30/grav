#!/bin/bash

set -e

function configure_grav() {
    export GRAV_HOME=/var/www/html

    # Setup admin user (if supplied)
    if [ -z $ADMIN_USER ]; then
        echo "[ INFO ] No Grav admin user details supplied"
    else
        if [ -e $GRAV_HOME/user/accounts/$ADMIN_USER.yaml ]; then
            echo "[ INFO ] Grav admin user already exists"
        else
            echo "[ INFO ] Setting up Grav admin user"
            cd $GRAV_HOME

            bin/plugin login newuser \
                 --user=${ADMIN_USER} \
                 --password=${ADMIN_PASSWORD-"Pa55word"} \
                 --permissions=${ADMIN_PERMISSIONS-"b"} \
                 --email=${ADMIN_EMAIL-"admin@domain.com"} \
                 --fullname=${ADMIN_FULLNAME-"Administrator"} \
                 --title=${ADMIN_TITLE-"SiteAdministrator"}
        fi
    fi

    # install themes and plugins
    if [ ! -z $GRAV_ADDITIONS ]; then
        cd $GRAV_HOME
        for i in $(echo $GRAV_ADDITIONS | sed "s/,/ /g")
        do
            echo "[ INFO ] Installing grav plugin/theme: $i"
            bin/gpm --quiet install "$i"
        done
    fi


    # provide user pages
    if [ ! -z $DOCKER_USER_PAGES ] && [ "$DOCKER_USER_PAGES" = "true" ]; then
        echo "[ INFO ] Use docker contained grav user pages"
        cd $GRAV_HOME/user/pages && rm -rf *
        cp -r /provided/pages/* .
        chown www-data:www-data -R $GRAV_HOME/user/
    fi
}

configure_grav

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- apache2-foreground "$@"
fi

exec "$@"
