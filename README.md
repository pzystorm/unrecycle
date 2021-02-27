# unrecycle

Linux Bash script that reads a Windows recyclebin directory (f.ex. from a mounted windows drive) and restores the filenames by reading the $I and $R files inside the recyclebin folder.
The original recyclebin folder is untouched. All files are copied to new output folder which is specified as second parameter to the script.
The first parameter is the recyclebin folder where to read from.

## Syntax

```
./unrecycle.sh \$RECYCLE.BIN \$RECYCLE.BIN-recovery
```
