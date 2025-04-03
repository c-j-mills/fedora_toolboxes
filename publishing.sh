#!/bin/bash

# Copyright Ⓒ 2025 Monty <jack.monty.usa@gmail.com>, All rights reserved
#
#title       :toolbox_publishing.sh
#description :This script will create a toolbox with publishing tools installed.
#author      :jack.monty.usa@gmail.com
#notes       :A toolbox for creating and modifying (i.e., publishing) all sorts of media.

NAME=publishing
RUN="toolbox run --container $NAME"
APPLICATIONS="asciidoctor dvdbackup ffmpeg ghostscript GraphicsMagick graphviz pandoc pdftk \
              python3-pip rclone rubygem-asciidoctor-pdf perl-Image-ExifTool "
# libdvdcss libray 

# Create container
toolbox rm --force $NAME || true
toolbox create --container $NAME

# Install additional repositories
$RUN sudo dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install publishing applications

## Install applications
$RUN sudo dnf install -y $APPLICATIONS

## Install `libray` (TODO: Not working?)
#$RUN sudo pip install libray

# Install `yt-dl'
$RUN sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dl
$RUN sudo chmod a+rx /usr/local/bin/yt-dl

