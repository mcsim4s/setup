#!/bin/bash

set_up_mac() {
	echo "Installing brew..."
	which -s brew
	[[ $? != 0 ]] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	install_oh_my_zsh
}

set_up_linux() {
	echo "Installing zsh..."
	which zsh
	[[ $? != 0 ]] && sudo apt install zsh -y

	install_oh_my_zsh
}

install_oh_my_zsh() {
	if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
		echo "Installing ohmyzsh..."
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
		echo "exec zsh" >> ~/.bashrc
	else
		echo "Zsh is already installed. Moving on"
	fi

	echo "Linking zsh .dotfiles..."
	[[ -f "$HOME/.zshrc" ]] && rm ~/.zshrc
	ln zsh/.zshrc ~/.zshrc
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "Detected os is linux. Setting up linux environment..."
    set_up_linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Detected os is macOS. Setting up mac environment..."
	set_up_mac
fi

echo "Configuring git"
git config --global alias.co checkout 
