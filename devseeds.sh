#!/bin/sh

# ensure $HOME
if [ -z "$HOME" ]; then
	export HOME="$(cd ~; pwd)"
fi

# ensure dev dir
DEV_DIR="$HOME/dev"

if [ ! -d "$DEV_DIR" ]; then
	echo "Creating $DEV_DIR ..."

	mkdir "$DEV_DIR"
fi

LINUX_DIR="$DEV_DIR/linux"

if [ -d "$LINUX_DIR" ]; then
	echo "Existing ${LINUX_DIR}..."

	cd "$LINUX_DIR"
	
	if [ -z "$(git status)" ] && [ -z "$(ls -A ".git")" ]; then
		echo "$LINUX_DIR not a valid repo, cloning into it..."
		git clone "https://github.com/guppytrain/linux.git" "$LINUX_DIR"
	else
		echo "$LINUX_DIR is a valid repo, fetching into it..."
		git fetch
	fi
else
	echo "$LINUX_DIR doesn't exist, clone new repo"
	git clone "https://github.com/guppytrain/linux.git" "$LINUX_DIR"

fi

cd "$LINUX_DIR/bin"

echo "Starting setup and install..."
#./setup.sh && ./install.sh

