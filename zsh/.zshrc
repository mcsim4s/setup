# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export GOPATH="${HOME}/.go"
which go
[[ $? == 0 ]] && export PATH=$PATH:$(go env GOPATH)/bin

export PATH="$HOME/.jenv/bin:$PATH"
which jenv
[[ $? == 0 ]] && eval "$(jenv init -)"

which rustc
[[ $? == 0 ]] && export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

export PATH=$PATH:$HOME/.local/bin
ssh-add ~/.ssh/id_rsa

[ -f "$HOME/.zsh_local" ] && source "$HOME/.zsh_local"
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
