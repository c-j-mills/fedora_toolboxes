#!/bin/bash

# Copyright Ⓒ 2025 Jack Montgomery <jack.monty.usa@gmail.com>, All rights reserved
#
#title       :toolbox_rust.sh
#description :This script will create a toolbox with Rust-related tools installed.
#author      :jack.monty.usa@gmail.com
#notes       :A toolbox for working with Rust tools.

NAME=rust
RUN="toolbox run --container $NAME"
APPLICATIONS="rust cargo "

# Create container
toolbox rm --force $NAME || true
toolbox create --container $NAME

# Install applications
$RUN sudo dnf install -y $APPLICATIONS

