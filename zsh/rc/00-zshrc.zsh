export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="false"
DISABLE_AUTO_UPDATE="true"

plugins=(git kubectl docker)

source $ZSH/oh-my-zsh.sh
source $HOME/.fresh/build/shell.sh

bindkey -v

if [ -f ~/.exercism/exercism_completion.zsh ]; then
  source ~/.exercism/exercism_completion.zsh
fi
