#!/bin/sh
WORKDIR=/home/connor/.var/app/org.libretro.RetroArch/config/retroarch/downloads/*/

main () {
  traverse_dir $WORKDIR
  for dir in $WORKDIR
    do
    traverse_dir "$dir"
  done
}

traverse_dir () {
  echo "Processing $1"
  for f in "$1"*
    do
    #echo "File $f"
    # Unzip to destination directory (default: cwd)
    if [ "${f##*.}" = "zip" ]
      then
      unzip "$f" -d "$1"
      rm "$f"
    fi

    # Found directory - search it for zip files
    if [ -d "$f" ]
      then
      traverse_dir "$f"/
    fi
  done
}

main