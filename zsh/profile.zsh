export ZSH=/Users/jakeutley/.oh-my-zsh

# General Zsh stuff
# ------------------------------
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"
DISABLE_AUTO_UPDATE="true"

# Plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git kubectl)
source $ZSH/oh-my-zsh.sh
source ~/.aliases
eval "$(direnv hook zsh)"

# Bindings
# ------------------------------

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

bindkey -M viins '^a'    beginning-of-line                            
bindkey -M viins '^e'    end-of-line                                  
bindkey -M viins '^k'    kill-line                          

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin
