#!/bin/sh

### Configuration Variables

export IMAGE_URL=https://download.freebsd.org/ftp/releases/ISO-IMAGES/11.2/FreeBSD-11.2-RELEASE-amd64-bootonly.iso
export PROJECT=$HOME/.freebsd

mkdir $PROJECT
cd    $PROJECT

### Download a FreeBSD Image

wget $IMAGE_URL

### Install the xhyve hypervisor

brew install --HEAD xhyve

### Or build xhyve, which compiles in seconds
#
# git clone https://github.com/mist64/xhyve
# cd xhyve
# make
#
###
