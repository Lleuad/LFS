#!/bin/bash
LFS="/mnt/lfs"
set -e

{
echo "label:dos"
echo ",,L"
} | sfdisk $1

Partition="$1"1
mkfs.ext4 -v $Partition
mkdir -pv $LFS
mount -v $Partition $LFS
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

cp -r build_scripts $LFS/sources
chmod +x $LFS/sources/build_scripts/*
wget "http://www.linuxfromscratch.org/lfs/downloads/8.3/wget-list" --continue
wget "http://www.linuxfromscratch.org/lfs/downloads/8.3/md5sums" --continue --directory-prefix=$LFS/sources
wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

pushd $LFS/sources
md5sum -c md5sums
popd

mkdir -pv $LFS/tools/bin
ln -sv $LFS/tools /
ln -sv ../../sources/build_scripts/confirmation $LFS/tools/bin/

cp -v makefile $LFS/sources

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
chown -v lfs $LFS/tools
chown -v lfs:lfs $LFS/tools/bin
chown -v lfs $LFS/sources


cat > /home/lfs/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > /home/lfs/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
cd $LFS/sources
EOF

su - lfs
