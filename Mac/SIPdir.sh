#!/bin/bash

#This is a program to create SIP folders for a collection.

BLUE='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}This script will create SIP templates for each item.${NC}"
echo -e "${BLUE}Please enter the four digit SPEC aquisition id in the format ACQ_#### format:${NC}"

read aquisition

if [[ "$PWD" =~ "$acquisition" ]]

then

	echo -e "${BLUE}Please enter the number of the first item you'd like a folder made for:${NC}"

	read first

	echo -e "${BLUE}Please enter the last number:${NC}"

	read last

	for x in $(seq -f %1.0f $first $last)
	do 
	eval mkdir -p -v $acquisition"_"$x/{objects,metadata}
	done

	echo -e "${BLUE}The folders for $acquisition have been built.${NC}"
else
	echo -e "${BLUE}Please change into the acquisition directory and try again.${NC}" && exit 1
fi