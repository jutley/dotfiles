function ins-or-cmd() {
  echo -n '%{$fg[white]%}'
  if [[ "$KEYMAP" == "main" ]]; then
    echo -n 'INS'
  else
    echo -n 'CMD'
  fi
}

function date() {
  echo '$fg_bold[white][%*]'
}

function update-custom-prompt() {
  dir='%{$fg[cyan]%}%c'
  line1="$(date) ${dir} $(git_prompt_info) -- $(ins-or-cmd)"
  line2="${ret_status} %{$reset_color%}"
  ln=$'\n'
  export PROMPT="${ln}${line1}${ln}$line2"
}

function zle-line-init zle-keymap-select() {
  update-custom-prompt
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
update-custom-prompt
