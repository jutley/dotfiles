# $'\n' => stupid way to do newline
function custom_prompt() {
  alert=$1
  line1='$fg_bold[white][%D %*] %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
  line2='${ret_status} %{$reset_color%}'
  PS1=$'\n'"$line1% $alert"$'\n'"$line2"
}
custom_prompt

bindkey -v

function bold_white_text() {
  text=$1
  echo "%{$fg_bold[white]%} $text % %{$reset_color%}"
}

function zle-line-init zle-keymap-select {
    command_prompt=$(bold_white_text '-- COMMAND MODE --')
    insert_prompt=$(bold_white_text '-- INSERT  MODE --')
    notification=$insert_prompt
    if [[ $KEYMAP == "vicmd" ]]; then notification=$command_prompt fi
    custom_prompt $notification
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

