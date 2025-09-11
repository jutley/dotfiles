export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="false"
DISABLE_AUTO_UPDATE="true"

plugins=(git docker)

eval "$(brew shellenv)"
source "$ZSH/oh-my-zsh.sh"
source "$HOME/.fresh/build/shell.sh"

source <(kubectl completion zsh)

autoload bashcompinit && bashcompinit
complete -C "$(which aws_completer)" aws

bindkey -v

if [[ -f ~/.exercism/exercism_completion.zsh ]]
then
  source ~/.exercism/exercism_completion.zsh
fi

source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

eval "$(jenv init -)"
eval "$(pyenv init -)"

[[ -f "$HOME/.hac/rc_file" ]] && source "$HOME/.hac/rc_file"
