# LFS 8.3
LFS installer scripts. Still a work in progress, can easily wipe your system.

### Chapter 2.2
```
# bash version-check.sh
```
### Chapter 2.4 - 4.3
```
# bash setup.sh /dev/sdX  #wipes disk
# su - lfs
```
### Chapter 4.4
```
$ bash setupLFS.sh
$ cd $LFS/sources
```
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
```
or to also remove documentation and other unneeded files
```
$ make stripFull
```
