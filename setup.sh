#!/bin/sh

set_up_mac() {
	echo "Installing brew..."
	which -s brew
	[[ $? != 0 ]] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	echo "Intalling oh my zsh..."
	[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
	
	echo "Linking .dotfiles..."
	[ -f "$HOME/.zshrc" ] && rm ~/.zshrc
	ln zsh/.zshrc ~/.zshrc
	
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "settin up linux env"
elif [[ "$OSTYPE" == "darwin"* ]]; then
		set_up_mac
fi

