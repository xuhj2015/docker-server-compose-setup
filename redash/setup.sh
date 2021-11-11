#!/usr/bin/env bash
# This script setups dockerized Redash on Mac OS.
set -eu

REDASH_BASE_PATH=/Users/xuhj/Documents/Docker/data/redash

create_directories() {
    if [[ ! -e $REDASH_BASE_PATH ]]; then
        mkdir -p $REDASH_BASE_PATH
        chown $USER $REDASH_BASE_PATH
    fi

    if [[ ! -e $REDASH_BASE_PATH/postgres-data ]]; then
        mkdir $REDASH_BASE_PATH/postgres-data
    fi
}

create_config() {
    if [[ ! -e $REDASH_BASE_PATH/env ]]; then
        touch $REDASH_BASE_PATH/env

        COOKIE_SECRET=$(pwgen -1s 32)
        SECRET_KEY=$(pwgen -1s 32)
        POSTGRES_PASSWORD=$(pwgen -1s 32)
        REDASH_DATABASE_URL="postgresql://postgres:${POSTGRES_PASSWORD}@postgres/postgres"

        echo "PYTHONUNBUFFERED=0" >> $REDASH_BASE_PATH/env
        echo "REDASH_LOG_LEVEL=INFO" >> $REDASH_BASE_PATH/env
        echo "REDASH_REDIS_URL=redis://redis:6379/0" >> $REDASH_BASE_PATH/env
        echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" >> $REDASH_BASE_PATH/env
        echo "REDASH_COOKIE_SECRET=$COOKIE_SECRET" >> $REDASH_BASE_PATH/env
        echo "REDASH_SECRET_KEY=$SECRET_KEY" >> $REDASH_BASE_PATH/env
        echo "REDASH_DATABASE_URL=$REDASH_DATABASE_URL" >> $REDASH_BASE_PATH/env
    fi
}

if [ -e $REDASH_BASE_PATH/postgres-data ] && [ ! -e $REDASH_BASE_PATH/env ]; then
    echo "环境变量不存在而PG文件夹存在，会导致PG数据库密码错误。"
fi

create_directories
create_config
