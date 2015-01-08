#!/bin/bash
set -e
source /build/buildconfig
set -x

## Create a user for the web app.
addgroup --gid 9999 dev
adduser --uid 9999 --gid 9999 --disabled-password --gecos "Development" dev
usermod -L dev
mkdir -p /home/dev/.ssh
chmod 700 /home/dev/.ssh
chown dev:dev /home/dev/.ssh

