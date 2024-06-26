#!/bin/bash

set_up_mac() {


	echo "Installing brew..."
	which -s brew
	[[ $? != 0 ]] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	echo "Installing jenv..."
	which -s jenv
  [[ $? != 0 ]] && brew install jenv
  jenv enable-plugin export

  brew install --cask font-fira-code-nerd-font
  brew install starship

  install_oh_my_zsh
}

set_up_linux() {
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
	ln zsh/.aliases ~/.aliases
	starship preset bracketed-segments -o ~/.config/starship.tomls
  echo "" >> ~/.config/starship.toml
  echo "[line_break]" >> ~/.config/starship.toml
  echo "disabled = true" >> ~/.config/starship.toml

  if ! [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi

  if ! [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  fi
}

common_setup() {
	echo "Configuring git"
	git config --global alias.co checkout 
	git config --global user.email "mcsim1993@gmail.com"
	git config --global user.name "Maxim Gribov (mcsim4s)"
}

common_setup

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "Detected os is linux. Setting up linux environment..."
    set_up_linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Detected os is macOS. Setting up mac environment..."
	set_up_mac
fi

exec zsh
