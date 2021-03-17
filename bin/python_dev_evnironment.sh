#!/usr/bin/env bash 
# installs a basic local python dev environment


install_homebrew()
{
	echo 'installing homebrew'	
	$SHELL -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}


if [[ $(uname -s) == Darwin ]]; then
	command -v brew >/dev/null 2>&1 && install_homebrew
fi



prepare_pyenv()
{
	if [ command -v apt-get >/dev/null 2>&1 ]; then
	      	sudo apt-get install -y \
			build-essential \
			libssl-dev \
			zlib1g-dev \
			libbz2-dev \
			libreadline-dev \
			libsqlite3-dev \
			wget \
			curl \
			llvm \
			libncurses5-dev \
			libncursesw5-dev \
			xz-utils \
			tk-dev \
			libffi-dev \
			liblzma-dev \
			python-openssl \
			git
	elif [ command -v brew >/dev/null 2>&1 ]; then
		brew upate && brew install openssl readline sqlite3 xz zlib
	fi
}

install_pyenv()
{
	echo 'installing pyenv'
	curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
}


if [ command -v pyenv >/dev/null 2>&1 ]; then
	echo "pyenv not found"
	prepare_pyenv
       	install_pyenv
else
	echo "pyenv already installed"
fi

