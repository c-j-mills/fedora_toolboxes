#!/bin/bash

# Copyright Ⓒ 2025 Monty <jack.monty.usa@gmail.com>, All rights reserved
#
#title       :neovim.sh
#description :This script will create a toolbox with Neovim installed.
#author      :jack.monty.usa@gmail.com
#notes       :A toolbox for Neovim.

NAME=neovim
RUN="toolbox run --container $NAME"
APPLICATIONS="neovim \
              chafa dnf-plugins-core fd-find htop ncdu \
              dotnet-host dotnet-sdk-9.0 dotnet-sdk-8.0 \
              golang \
              python3-pip python3-isort black rustup \
              java-latest-openjdk-devel "

# Create container
toolbox rm --force $NAME || true
toolbox create --container $NAME

# Install applications
$RUN sudo dnf install -y $APPLICATIONS

# Install Lazygit
$RUN sudo dnf copr enable -y totalfreak/lazygit
$RUN sudo dnf install -y lazygit

## Install rust components
$RUN rustup-init -y --no-modify-path
$RUN cargo install stylua  # Lua linter

# Install csharp LSP
$RUN dotnet tool install --global csharp-ls

