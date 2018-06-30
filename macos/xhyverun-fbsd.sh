#!/bin/sh

USERBOOT="$HOME/.freebsd/xhyve/test/userboot.so"
BOOTVOLUME="fbsd.img"
IMG_HDD="-s 4:0,virtio-blk,$BOOTVOLUME"
UUID="-U deadbeef-cafe-face-fade-decaf0000000"
KERNELENV=""
MEM="-m 2G"
SMP="-c 2"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
NET="-s 2:0,virtio-net"
LPC_DEV="-l com1,stdio"
ACPI="-A"

xhyve $ACPI $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_HDD $UUID -f fbsd,$USERBOOT,$BOOTVOLUME,"$KERNELENV"
