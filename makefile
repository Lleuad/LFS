SHELL=/bin/bash
#tarballs
Acl=acl-2.2.53.src.tar.gz
Attr=attr-2.4.48.src.tar.gz
Autoconf=autoconf-2.69.tar.xz
Automake=automake-1.16.1.tar.xz
Bash=bash-4.4.18.tar.gz
Bc=bc-1.07.1.tar.gz
Binutils=binutils-2.31.1.tar.xz
Bison=bison-3.0.5.tar.xz
Bzip2=bzip2-1.0.6.tar.gz
Check=check-0.12.0.tar.gz
Coreutils=coreutils-8.30.tar.xz
DejaGNU=dejagnu-1.6.1.tar.gz
Diffutils=diffutils-3.6.tar.xz
Eudev=eudev-3.2.5.tar.gz
E2fsprogs=e2fsprogs-1.44.3.tar.gz
Elfutils=elfutils-0.173.tar.bz2
Expat=expat-2.2.6.tar.bz2
Expect=expect5.45.4.tar.gz
File=file-5.34.tar.gz
Findutils=findutils-4.6.0.tar.gz
Flex=flex-2.6.4.tar.gz
Gawk=gawk-4.2.1.tar.xz
GCC=gcc-8.2.0.tar.xz
GDBM=gdbm-1.17.tar.gz
Gettext=gettext-0.19.8.1.tar.xz
Glibc=glibc-2.28.tar.xz
GMP=gmp-6.1.2.tar.xz
Gperf=gperf-3.1.tar.gz
Grep=grep-3.1.tar.xz
Groff=groff-1.22.3.tar.gz
GRUB=grub-2.02.tar.xz
Gzip=gzip-1.9.tar.xz
Iana-Etc=iana-etc-2.30.tar.bz2
Inetutils=inetutils-1.9.4.tar.xz
Intltool=intltool-0.51.0.tar.gz
IPRoute2=iproute2-4.18.0.tar.xz
Kbd=kbd-2.0.4.tar.xz
Kmod=kmod-25.tar.xz
Less=less-530.tar.gz
LFS-Bootscripts=lfs-bootscripts-20180820.tar.bz2
Libcap=libcap-2.25.tar.xz
Libffi=libffi-3.2.1.tar.gz
Libpipeline=libpipeline-1.5.0.tar.gz
Libtool=libtool-2.4.6.tar.xz
Linux=linux-4.18.5.tar.xz
M4=m4-1.4.18.tar.xz
Make=make-4.2.1.tar.bz2
Man-DB=man-db-2.8.2.tar.xz
Man-pages=man-pages-4.16.tar.xz
Meson=meson-0.47.1.tar.gz
MPC=mpc-1.1.0.tar.gz
MPFR=mpfr-4.0.1.tar.xz
Ninja=ninja-1.8.2.tar.gz
Ncurses=ncurses-6.1.tar.gz
OpenSSL=openssl-1.1.0i.tar.gz
Patch=patch-2.7.6.tar.xz
Perl=perl-5.28.0.tar.xz
Pkg-config=pkg-config-0.29.2.tar.gz
Procps=procps-ng-3.3.15.tar.xz
Psmisc=psmisc-23.1.tar.xz
Python=Python-3.7.0.tar.xz
Python_Documentation=python-3.7.0-docs-html.tar.bz2
Readline=readline-7.0.tar.gz
Sed=sed-4.5.tar.xz
Shadow=shadow-4.6.tar.xz
Sysklogd=sysklogd-1.5.1.tar.gz
Sysvinit=sysvinit-2.90.tar.bz2
Tar=tar-1.30.tar.xz
Tcl=tcl8.6.8-src.tar.gz
Texinfo=texinfo-6.5.tar.xz
Time_Zone_Data=tzdata2018e.tar.gz
Udev-lfs_Tarball=udev-lfs-20171102.tar.bz2
Util-linux=util-linux-2.32.1.tar.xz
Vim=vim-8.1.tar.bz2
XML_Parser=XML-Parser-2.44.tar.gz
Xz_Utils=xz-5.2.4.tar.xz
Zlib=zlib-1.2.11.tar.xz
#Patches
Bzip2Patch=bzip2-1.0.6-install_docs-1.patch
CoreutilsPatch=coreutils-8.30-i18n-1.patch
GlibcPatch=glibc-2.28-fhs-1.patch
KbdPatch=kbd-2.0.4-backspace-1.patch
NinjaPatch=ninja-1.8.2-add_NINJAJOBS_var-1.patch
SysvinitPatch=sysvinit-2.90-consolidated-1.patch

TempSysFiles=rBinutilsPass1 rGccPass1 rHeaders rGlibc

define PreBuild
	tar -xf $(1)
	pushd $(basename $(basename $(1)))
endef
define PostBuild
	popd;\
	rm -rf $(1)
endef

define Build
	tar -xf $(1)
	cd $(basename $(basename $(1))) && ../build_scripts/$(2)
	rm -rf $(basename $(basename $(1)))
endef

TempSys: $(TempSysFiles)

rBinutilsPass1: $(Binutils)
rGccPass1: $(GCC)
rAPIHeaders: $(Linux)
rGlibc: $(Glibc)
	$(call Build,$<,$@)
