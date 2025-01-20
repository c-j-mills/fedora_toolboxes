#!/bin/bash

# Copyright Ⓒ 2025 Monty <jack.monty.usa@gmail.com>, All rights reserved
#
#title       :toolbox_publishing.sh
#description :This script will create a toolbox with publishing tools installed.
#author      :jack.monty.usa@gmail.com
#notes       :A toolbox for creating and modifying (i.e., publishing) all sorts of media.

NAME=publishing
RUN="toolbox run --container $NAME"
APPLICATIONS="asciidoctor dvdbackup ghostscript GraphicsMagick graphviz \
              pandoc python3-pip rclone rubygem-asciidoctor-pdf youtube-dl \
              perl-Image-ExifTool "
# libdvdcss libray 

# Create container
toolbox rm --force $NAME || true
toolbox create --container $NAME

# Install additional repositories
$RUN sudo dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install publishing applications

## Install remaining applications
$RUN sudo dnf install -y $APPLICATIONS
#$RUN sudo pip install libray

