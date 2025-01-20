#!/bin/bash

# Copyright Ⓒ 2025 Monty <jack.monty.usa@gmail.com>, All rights reserved
#
#title       :neovim.sh
#description :This script will create a toolbox with Neovim installed.
#author      :jack.monty.usa@gmail.com
#notes       :A toolbox for Neovim.

NAME=neovim
RUN="toolbox run --container $NAME"
APPLICATIONS="neovim python3-pip golang rust cargo java-latest-openjdk-devel chafa fd-find "

# Create container
toolbox rm --force $NAME || true
toolbox create --container $NAME

## Install applications
$RUN sudo dnf install -y $APPLICATIONS
