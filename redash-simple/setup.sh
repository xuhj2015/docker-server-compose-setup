#!/usr/bin/env bash
# This script setups dockerized Redash on Mac OS.
set -eu

REDASH_BASE_PATH=/Users/xuhj/Documents/Docker/data/redash-simple

REDASH_REDIS_URL="redis://192.168.1.211:6379/0"
REDASH_DATABASE_URL="postgresql://postgres:123456@192.168.1.211/redash"

create_directories() {
    if [[ ! -e $REDASH_BASE_PATH ]]; then
        mkdir -p $REDASH_BASE_PATH
        chown $USER $REDASH_BASE_PATH
    fi
}

create_config() {
    if [[ ! -e $REDASH_BASE_PATH/env ]]; then
        touch $REDASH_BASE_PATH/env

        COOKIE_SECRET=$(pwgen -1s 32)
        SECRET_KEY=$(pwgen -1s 32)

        echo "PYTHONUNBUFFERED=0" >> $REDASH_BASE_PATH/env
        echo "REDASH_LOG_LEVEL=INFO" >> $REDASH_BASE_PATH/env
        echo "REDASH_REDIS_URL=$REDASH_REDIS_URL" >> $REDASH_BASE_PATH/env
        echo "REDASH_COOKIE_SECRET=$COOKIE_SECRET" >> $REDASH_BASE_PATH/env
        echo "REDASH_SECRET_KEY=$SECRET_KEY" >> $REDASH_BASE_PATH/env
        echo "REDASH_DATABASE_URL=$REDASH_DATABASE_URL" >> $REDASH_BASE_PATH/env
    fi
}

create_directories
create_config
