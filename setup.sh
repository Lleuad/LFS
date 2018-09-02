#!/bin/bash
LFS="/mnt/lfs"
set -e

{
echo "label:dos"
echo ",,L"
} | sfdisk $1
mkfs.ext4 -v "$1"1
mkdir -pv $LFS
mount -v "$1"1 $LFS
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

wget "http://www.linuxfromscratch.org/lfs/downloads/8.3/wget-list"
wget "http://www.linuxfromscratch.org/lfs/downloads/8.3/md5sums" --directory-prefix=$LFS/sources
wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

pushd $LFS/sources
md5sum -c md5sums
popd

mkdir -v $LFS/tools
ln -sv $LFS/tools /

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
su - lfs bash setupLFS.sh
