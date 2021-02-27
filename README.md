# unrecycle

Linux Bash script that reads a Windows recyclebin directory (f.ex. from a mounted windows drive) and restores the files by reading the $I* files and copy the $R* files to a new location with the old file name (before deletion).
The original recyclebin folder is untouched. All files are copied to new output folder which is specified as second parameter to the script.
The first parameter is the recyclebin folder where to read from.

## Syntax

```
./unrecycle.sh inputfolder outputfolder
```
f.ex.
```
./unrecycle.sh /mnt/windowshd/\$RECYCLE.BIN /tmp/\$RECYCLE.BIN-recovery
```
