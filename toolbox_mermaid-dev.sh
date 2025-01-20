#/bin/bash

# Copyright Ⓒ 2025 Monty <jack.monty.usa@gmail.com>, All rights reserved
#
#title       :toolbox_mermaid-dev.sh
#description :This script will create a toolbox with Mermaid-related tools installed.
#author      :jack.monty.usa@gmail.com
#notes       :A toolbox for working with Mermaid development.

NAME=mermaid-dev
RUN="toolbox run --container $NAME"
APPLICATIONS="nodejs-npm pnpm "

# Create container
toolbox rm --force $NAME || true
toolbox create --container $NAME

# Install applications

## Install remaining applications
$RUN sudo dnf install -y $APPLICATIONS

