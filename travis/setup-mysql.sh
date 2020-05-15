#!/bin/sh
set -ev

if test -n "$ARM64"; then
    mysql -vvv -e 'CREATE USER "travis"@"localhost" IDENTIFIED BY ""'
    mysql -vvv -e 'GRANT ALL PRIVILEGES ON *.* TO "travis"@"localhost"'
fi

mysql -vvv -e "CREATE DATABASE IF NOT EXISTS test"
