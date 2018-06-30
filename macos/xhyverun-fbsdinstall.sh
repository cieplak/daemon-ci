#!/bin/sh

USERBOOT="$HOME/.freebsd/xhyve/test/userboot.so"
ISO="FreeBSD-11.1-RELEASE-amd64-bootonly.iso"
BOOTVOLUME="$ISO"
IMG="fbsd.img"
UUID="-U deadbeef-cafe-face-fade-decaf0000000"
KERNELENV=""
MEM="-m 2G"
SMP="-c 2"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
NET="-s 2:0,virtio-net"
LPC_DEV="-l com1,stdio"
IMG_CD="-s 3:0,ahci-cd,$ISO"
IMG_HDD="-s 4:0,virtio-blk,$IMG"
LPC_DEV="-l com1,stdio"
ACPI="-A"

xhyve $ACPI $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD $UUID -f fbsd,$USERBOOT,$BOOTVOLUME,"$KERNELENV"
