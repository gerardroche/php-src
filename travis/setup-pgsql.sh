#!/bin/sh
set -ev

if test -z "$ARM64$S390X"; then
    psql -c "ALTER USER postgres PASSWORD 'postgres';" -U postgres
    psql -c "create database test;" -U postgres
fi
