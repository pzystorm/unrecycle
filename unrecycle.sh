#!/bin/bash

recyclebin=$1
outputpath=$2

# Check syntax
if [[ -z "$1" ]] || [[ -z "$2" ]] || ! [[ -z "$3" ]] || [[ $# -ne 2 ]]; then
  echo "Wrong syntax. Must be: ./unrecycle.sh inputfolder outputfolder"
  exit 1
fi
if ! [[ -d "$1" ]]; then
  echo "Input folder does not exist"
  exit 1
fi
if ! [[ -d "$2" ]]; then
  echo "Output folder does not exist"
  exit 1
fi

# Foreach file beginning with $I... 
for ifile in "$recyclebin"/\$I*; do

  # Extract old filename and build a linux style path
  ofile=`strings -e l $ifile | grep -E "^[A-Za-z]:"`
  opath=${ofile//\\//}
  opath=${opath//:/}
  ofile=`basename "$opath"`
  opath=`dirname "$opath"`
  rfile=`echo $ifile | sed 's/\$I/\$R/'`
   
  # Verbose output
  if [[ -d "$rfile" ]]; then
    echo "Processing dir  "`basename $ifile`"     (restore to: $opath/$ofile)"
  else
    echo "Processing file "`basename $ifile`" (restore to: $opath/$ofile)"
  fi

  # Create the folder that the file can be stored in
  mkdir -p "$outputpath/$opath"
   
  # It is possible that two or more files/directories have been deleted with the same name and parent folder
  if [[ -e "$outputpath/$opath/$ofile" ]]; then
    echo "$outputpath/$opath/$ofile already exists. Please enter a new name:"
    echo -n "$outputpath/$opath/"
    read newname
    cp -pr "$rfile" "$outputpath/$opath/$newname"
  else
    cp -pr "$rfile" "$outputpath/$opath/$ofile"
  fi
done
