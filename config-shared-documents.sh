#!/bin/bash

if [[ -d $1 ]] && [[ -d $1/drive_c ]]
then
	mkdir -p "$HOME/.PlayOnLinux/shared-files"
	find "$1/drive_c/" -type l -exec sh -c 'rm "{}";ln -s "$HOME/.PlayOnLinux/shared-files/$(basename "{}")" "{}"' \;
	rm -rf "$1/drive_c/users/$USER/Application Data"
	ln -s "$HOME/.PlayOnLinux/shared-files/Application Data" "$1/drive_c/users/$USER/Application Data"
	exit 0
fi

echo "Please specify a wine prefix as the only argument"
exit 1
