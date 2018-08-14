#!/bin/sh

# NOTE: assumes default rsa key names
id_file="$HOME/.ssh/id_rsa"

# create key as needed
if [ ! -d "$HOME/.ssh" ]; then
       mkdir -p "$HOME/.ssh"

       [ -z "$1" ] && ssh-keygen -t rsa -b 4096 -C "$1" \
	       || ssh-keygen -t rsa -b 4096
fi

# get fingerprint
fp="$(ssh-keygen -lf $id_file | awk '{ print $2}')"

# check against added list
match="$(ssh-add -l | grep $fp)"

# if not found
if [ -z "$match" ]; then
	# run agent
	eval "$(ssh-agent -s)"
	
	# add key
	ssh-add $id_file
fi
