# LFS 8.3
LFS installer scripts. This collection of scripts and makefiles is meant to make builds easier, not saver. Instructions are left intentionally vague. It is highly advised to always follow the book (http://www.linuxfromscratch.org/lfs/downloads/8.3/)

### Chapter 2.2
```
# bash version-check.sh
```
### Chapter 2.4 - 4.4
The *setup* script will reformat de given disk to one big ext4 partition, any data on that disk **will be lost**. If you wish to use a *swap* partition create and initialise it yourself.
<pre>
# bash setup.sh /dev/sd<em>X</em>  #wipes disk
</pre>
### Chapter 5.4 - 5.34
To build packages individually
```
$ make rBinutilsPass1
$ make rGCCPass1
$ make rAPIHeaders
$ make rGlibc
$ make rLibstdc++
...
$ make rUtil-Linux
$ make rXz
```
or to make the temporary system in one go
```
$ make TempSys
```
Packages are only build once. Meaning that if you wish to time the first build or for any other reason build the first few packages individually, `make TempSys` will continue where you left off.
### Chapter 5.35
```
$ make strip
$ exit
```
or to also remove documentation and other unneeded files
```
$ make stripFull
$ exit
```
### Chapter 5.36 - 6.4
```
# bash system.sh
```
### Chapter 6.5 - 6.6
```
# cd sources
# make FileSystem
```
### Chapter 6.7 - 6.8 (0.2 SBU)
```
# make sAPIHeaders
# make sMan-pages
```
### Chapter 6.9 (24 SBU)
<pre>
# make [Tz=<em>Area/Location</em>] sGlibc
</pre>
To set the timezone `tzselect` will be called during the build, unless Tz is set with a valid timezone name.

### Chapter 6.10 - 6.19 (10.1 SBU)
```
# make Toolchain
# make sZlib
# make sFile
# make sReadline
# make sM4
# make sBc
# make sBinutils
# make sGMP
# make sMPFR
# make sMPC
```

### Chapter 6.20 (0.2 SBU)
```
# make sShadow
# passwd root
```

### Chapter 6.21 (92 SBU)
```
# make sGCC
```
Check the test results
```
# ../contrib/test_summary
```
and continue the installation.
```
# make sGCCinstall
```
