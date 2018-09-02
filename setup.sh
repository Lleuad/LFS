#!/bin/bash
LFS="/mnt/lfs"

{
echo "label:dos"
echo ",,L"
} | sfdisk $1 &&
mkfs.ext4 -v "$1"1 &&
mkdir -pv $LFS &&
mount -v "$1"1 $LFS &&
mkdir -v $LFS/sources &&
chmod -v a+wt $LFS/sources &&
wget "http://www.linuxfromscratch.org/lfs/downloads/stable/wget-list" &&
wget "http://www.linuxfromscratch.org/lfs/downloads/stable/md5sums" --directory-prefix=$LFS/sources &&
wget --input-file=wget-list --continue --directory-prefix=$LFS/sources &&
pushd $LFS/sources &&
md5sum -c md5sums &&
popd
