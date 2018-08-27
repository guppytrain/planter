#!/bin/sh

if [ -z "$(which sudo)" ]; then
    echo "Stripping 'sudo' from 'linux' repo"
    $DEV_DIR/linux/bin/util/rp.sh -a sudo $DEV_DIR/linux
fi
