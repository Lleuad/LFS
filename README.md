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
```
$ make rBinutilsPass1
$ make rGCCPass1
$ make rAPIHeaders
$ make rGlibc
$ make rLibstdc++
...
```
or
```
$ make TempSys
```
### Chapter 5.35
```
$ make strip
```
or
```
$ make stripFull
```
