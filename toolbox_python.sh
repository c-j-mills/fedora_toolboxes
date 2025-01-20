#!/bin/bash

# Copyright Ⓒ 2025 Monty <jack.monty.usa@gmail.com>, All rights reserved
#
#title       :toolbox_python-tools.sh
#description :This script will create a toolbox with Python-related tools installed.
#author      :jack.monty.usa@gmail.com
#notes       :A toolbox for working with Python.

NAME=python-tools
RUN="toolbox run --container $NAME"
APPLICATIONS=" cmake poetry pylint "

# Create container
toolbox rm --force $NAME || true
toolbox create --container $NAME

## Install applications
$RUN sudo dnf install -y $APPLICATIONS
