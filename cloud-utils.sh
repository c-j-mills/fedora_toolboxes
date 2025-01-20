#!/bin/bash

# Copyright Ⓒ 2025 Jack Montgomery <jack.monty.usa@gmail.com>, All rights reserved
#
#title       :toolbox_cloud-utils.sh
#description :This script will create a toolbox with Cloud-related utilities installed.
#author      :jack.monty.usa@gmail.com
#notes       :A toolbox for working with Cloud tools.

NAME=cloud-utils
RUN="toolbox run --container $NAME"
APPLICATIONS="awscli azure-cli dnf-plugins-core kubernetes-client powershell terraform "

# Create container
toolbox rm --force $NAME || true
toolbox create --container $NAME

# Install additional repositories

## Hashicorp
$RUN sudo dnf config-manager addrepo \
        --from-repofile=https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

## Microsoft
$RUN sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$RUN sudo dnf config-manager addrepo \
        --from-repofile=https://packages.microsoft.com/config/rhel/9/prod.repo \
        --save-filename=microsoft

# Install applications from repositories
$RUN sudo dnf install -y $APPLICATIONS

# Install other applications
#
## vcluster
$RUN curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" 
$RUN sudo install -c -m 0755 vcluster /usr/local/bin 
$RUN rm -f vcluster

