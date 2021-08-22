#!/bin/sh
WORKDIR=/home/connor/.var/app/org.libretro.RetroArch/config/retroarch/downloads/*/
for dir in $WORKDIR
do
 echo "Processing $dir"
 for f in "$dir"*
  do
   if [ "${f##*.}" = "zip" ]
    then
     echo "Processing $f"
     unzip "$f" -d "$dir"
     rm "$f"
   fi
  done
done