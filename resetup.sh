#!/bin/bash
LFS="/mnt/lfs"
set -e

cp -r build_scripts $LFS/sources
chmod +x $LFS/sources/build_scripts/*
cp -v makefile $LFS/sources
