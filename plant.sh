#!/bin/sh

# ensure $HOME
if [ -z "$HOME" ]; then
	export HOME="$(cd ~; pwd)"
fi

# ensure share dir
SHARE_DIR="$HOME/share"

if [ ! -d "$SHARE_DIR" ]; then
	echo "Creating $SHARE_DIR ..."

	mkdir "$SHARE_DIR"
fi

# ensure dev dir
DEV_DIR="$HOME/dev"

if [ ! -d "$DEV_DIR" ]; then
	echo "Creating $DEV_DIR ..."

	mkdir "$DEV_DIR"
fi

# ensure docker repo
DOCKER_DIR="$DEV_DIR/docker"

if [ -d "$DOCKER_DIR" ]; then
	echo "Existing ${DOCKER_DIR}..."

	cd "$DOCKER_DIR"
	
	if [ -z "$(git status)" ] && [ -z "$(ls -A ".git")" ]; then
		echo "$DOCKER_DIR not a valid repo, cloning into it..."
		# git clone "git@github.com:guppytrain/docker.git" "$DOCKER_DIR"
		git clone "https://github.com/guppytrain/docker.git" "$DOCKER_DIR"
	else
		echo "$DOCKER_DIR is a valid repo, fetching into it..."
		git checkout -f && git pull
	fi
else
	echo "$DOCKER_DIR doesn't exist, clone new repo"
	# git clone "git@github.com:guppytrain/docker.git" "$DOCKER_DIR"
	git clone "https://github.com/guppytrain/docker.git" "$DOCKER_DIR"

fi

# ensure linux repo
LINUX_DIR="$DEV_DIR/linux"

if [ -d "$LINUX_DIR" ]; then
	echo "Existing ${LINUX_DIR}..."

	cd "$LINUX_DIR"
	
	if [ -z "$(git status)" ] && [ -z "$(ls -A ".git")" ]; then
		echo "$LINUX_DIR not a valid repo, cloning into it..."
		# git clone "git@github.com:guppytrain/linux.git" "$LINUX_DIR"
		git clone "https://github.com/guppytrain/linux.git" "$LINUX_DIR"
	else
		echo "$LINUX_DIR is a valid repo, fetching into it..."
        git checkout -f && git pull
	fi
else
	echo "$LINUX_DIR doesn't exist, clone new repo"
	# git clone "git@github.com:guppytrain/linux.git" "$LINUX_DIR"
	git clone "https://github.com/guppytrain/linux.git" "$LINUX_DIR"

fi

