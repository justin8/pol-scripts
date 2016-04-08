#!/bin/bash

if [[ ! -d $1 ]] && [[ ! -d $1/drive_c ]]
then
	echo "Please specify a wine prefix as the only argument"
	echo "e.g. $(basename "$0") ~/.PlayOnLinux/wineprefix/stardewvalley"
	exit 1
fi

mkdir -p "$HOME/.PlayOnLinux/shared-files/"{'Application Data','Desktop','My Documents','My Music','My Pictures','My Videos'}
for FOLDER in 'Application Data' 'Desktop' 'My Documents' 'My Music' 'My Pictures' 'My Videos'; do
	mkdir -p "$HOME/.PlayOnLinux/shared-files/$FOLDER"
	find "$1/drive_c/users/" -name "$FOLDER" -exec sh -c 'rm -rf "{}";ln -s "$HOME/.PlayOnLinux/shared-files/$(basename "{}")" "{}"' \;
done

exit 0
