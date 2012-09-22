#!/bin/bash

SITE_PATH=$1
CODE_PATH=$2

if [ -z $SITE_PATH ]; then
	echo "Please enter the path to the root of your Joomla! install: "
	read SITE_PATH
fi

if [ ! -d $SITE_PATH ]; then
	echo "Invalid directory. Exiting..."
	exit
fi

if [ -z $CODE_PATH ]; then
	CWD=$(pwd)

	CODE_PATH=$CWD/code
	if [ ! -d $CODE_PATH ]; then
		PARENT=$(dirname $CWD)
		CODE_PATH=$PARENT/code
		if [ ! -d $CODE_PATH ]; then
			echo "Could not find code path.  Please enter path to the code directory of the com_jm repository:"
			read CODE_PATH
			if [ ! -d $CODE_PATH ]; then
				echo "Path to code not found"
				exit
			fi
		fi
	fi
fi

# Delete old links and create new symlinks
if [ -L $SITE_PATH/components/com_jm ]; then
	echo "Deleting old site component directory"
	rm -rf $SITE_PATH/components/com_jm
fi

if [ -L $SITE_PATH/administrator/components/com_jm ]; then
	echo "Deleting old administrator component directory"
	rm -rf $SITE_PATH/administrator/components/com_jm
fi

if [ -L $SITE_PATH/plugins/system/jm ]; then
	echo "Deleting old plugins system jm directory"
	rm -rf $SITE_PATH/plugins/system/jm
fi

# Delete old admin language files
adminlangs=( com_jm plg_system_jm )
for lang in ${adminlangs[@]}
	do
	if [ -L $SITE_PATH/administrator/language/en-GB/en-GB.$lang.ini ]; then
		echo "Deleting old $lang admin language file"
		rm -rf $SITE_PATH/administrator/language/en-GB/en-GB.$lang.ini
	fi
	if [ -L $SITE_PATH/administrator/language/en-GB/en-GB.$lang.sys.ini ]; then
		echo "Deleting old $lang.sys admin language file"
		rm -rf $SITE_PATH/administrator/language/en-GB/en-GB.$lang.sys.ini
	fi
done

# Delete old site language files
sitelangs=( com_jm )
for lang in ${sitelangs[@]}
	do
	if [ -L $SITE_PATH/language/en-GB/en-GB.$lang.ini ]; then
		echo "Deleting old $lang site language file"
		rm -rf $SITE_PATH/language/en-GB/en-GB.$lang.ini
	fi
done

ln -s $CODE_PATH/components/com_jm $SITE_PATH/components/
ln -s $CODE_PATH/administrator/components/com_jm $SITE_PATH/administrator/components/
ln -s $CODE_PATH/language/en-GB/* $SITE_PATH/language/en-GB/
ln -s $CODE_PATH/administrator/language/en-GB/* $SITE_PATH/administrator/language/en-GB/
ln -s $CODE_PATH/plugins/system/jm $SITE_PATH/plugins/system/

echo "Links created successfully"
exit
