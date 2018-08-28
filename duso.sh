#!/bin/sh

# ensure dev dir
DEV_DIR="$HOME/dev"

if [ ! -d "$DEV_DIR" ]; then
	echo "DEV_DIR does not exist. Exiting..."
    sleep 5
    exit 1
fi

if [ -z "$(which sudo)" ]; then
    echo "Stripping 'sudo' from 'linux' repo"
    $DEV_DIR/linux/bin/util/rp.sh -a sudo $DEV_DIR/linux
fi
