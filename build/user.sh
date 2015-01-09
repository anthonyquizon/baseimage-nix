#!/bin/bash

passwd -d root
adduser --disabled-password --gecos "Development" dev
adduser dev sudo

mkdir /nix 
chmod 777 /nix
