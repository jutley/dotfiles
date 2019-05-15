function ins-or-cmd() {
  local mode='CMD'
  if [[ "$KEYMAP" == "main" ]]; then
    mode='INS'
  fi
  echo -n "%F{white}%B|%b %U$mode%u%f"
}

function prompt-date() {
  echo -n '%B%F{white}%*%b%f'
}

function format-cluster() {
  echo "%B%F{red}$1%b%f"
}

function format-namespace() {
  echo "%B%F{red}$1%b%f"
}

function update-custom-prompt() {
  source /usr/local/opt/kube-ps1/share/kube-ps1.sh

  export KUBE_PS1_PREFIX=""
  export KUBE_PS1_SEPARATOR=""
  export KUBE_PS1_SYMBOL_DEFAULT="%B%F{blue}k8s:(%b%f"
  export KUBE_PS1_CLUSTER_FUNCTION="format-cluster"
  export KUBE_PS1_DIVIDER="%B%F{black}/%b%f"
  export KUBE_PS1_NAMESPACE_FUNCTION="format-namespace"
  export KUBE_PS1_SUFFIX="%B%F{blue})%b%f"

  dir='%B%F{cyan}%1d%b%f'
  line1="$(prompt-date) ${dir} $(kube_ps1) $(git_prompt_info)$(ins-or-cmd)"
  line2="${ret_status} %{$reset_color%}"
  ln=$'\n'
  export PROMPT="
$line1
$line2"
}

function zle-line-init zle-keymap-select() {
  update-custom-prompt
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
update-custom-prompt
