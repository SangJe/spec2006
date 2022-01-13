#!/bin/bash

BINDIR=`dirname $0`
pushd $BINDIR

SPECIMG=spec_cpu2006.iso
TMPMNT=tmnt
TARGET=spec_src

if [ ! -f $SPECIMG ]
then
	echo "SPEC CPU image $SPECIMG not found under $BINDIR/"
	exit 1
fi

mkdir $TMPMNT
sudo mount -o loop $SPECIMG ./$TMPMNT/
mkdir $TARGET
cp -R ./$TMPMNT/* $TARGET/
sudo umount ./$TMPMNT
rm -fr ./$TMPMNT/
sudo chown -R $USER $TARGET/
sudo chmod -R 755 $TARGET/

popd


# Reference: https://github.com/sjp38/spec_cpu_on_ubuntu