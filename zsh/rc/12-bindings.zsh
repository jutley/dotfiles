bindkey -M vicmd "/" vi-history-search-backward
bindkey -M vicmd "?" vi-history-search-forward
bindkey -M vicmd "n" vi-repeat-search
bindkey -M vicmd "N" vi-rev-repeat-search

# Fixes issue where I cannot delete after going from command mode to insert mode. I'm not sure why this works.
# Source for fix: https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode
bindkey "^?" backward-delete-char

