#!/bin/bash
# this script moves kryoflux output for media item into objects folder and the log into a metadata folder.

BLUE='\033[0;36m'
GREEN='\033[1;32m'
RED='\033[0:31m'
NC='\033[0m'

echo -e  "${BLUE}Please enter your collection number to initiate the move.${NC}"

read collnum

for f in `find . -name "$collnum-*.tar"`; do 
	directory=`echo "$f" | cut -d \. -f 2 | cut -d \/ -f 2`
	mv $f /Volumes/Staging/KFStreamArchive

done

for f in `find . -name "$collnum_*.tar"`; do 
	directory=`echo "$f" | cut -d \. -f 2 | cut -d \/ -f 2`
	mv $f /Volumes/Staging/KFStreamArchive

done

for f in `find . -name "$collnum-*.001"`; do 
	directory=`echo "$f" | cut -d \. -f 2 | cut -d \/ -f 2`
	mv $f /Volumes/Staging/ingest/diskImages/$collnum/$directory/objects/

done

for f in `find . -name "collnum_*.001"`; do 
	directory=`echo "$f" | cut -d \. -f 2 | cut -d \/ -f 2`
	mv $f /Volumes/Staging/ingest/diskImages/$collnum/$directory/objects/

done

for f in `find . -name "$collnum-*.img"`; do
	directory=`echo "$f" | cut -d \. -f 2 | cut -d \/ -f 2`
	mv $f /Volumes/DigArchDiskStation/Staging/ingest/diskImages/$collnum/$directory/objects/

done

for f in `find . -name "collnum_*.img"`; do
	directory=`echo "$f" | cut -d \. -f 2 | cut -d \/ -f 2`
	mv $f /Volumes/DigArchDiskStation/Staging/ingest/diskImages/$collnum/$directory/objects/

done

for f in `find . -name "$collnum-*.log"`; do 
	directory=`echo "$f" | cut -d \. -f 2 | cut -d \/ -f 2`
	mv $f /Volumes/Staging/ingest/diskImages/$collnum/$directory/metadata/

done

for f in `find . -name "$collnum_*.log"`; do 
	directory=`echo "$f" | cut -d \. -f 2 | cut -d \/ -f 2`
	mv $f /Volumes/Staging/ingest/diskImages/$collnum/$directory/metadata/

done

echo -e "${GREEN}Disk image has been transferred to diskIMages and steam files transferred to KFSteamArchive.${NC}"


