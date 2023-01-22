if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
export EDITOR=vim
export FCEDIT=$EDITOR
export PAGER=less
export LESS='-iMRS -x2'
export CLICOLOR=1

_path="$HOME/bin:$HOME/.local/bin:/usr/local/home/$USER/.local/bin"
[[ "$PATH" =~ "$_path" ]] || export PATH="$_path:$PATH"
unset _path

HISTFILESIZE=20000
HISTSIZE=10000

shopt -s histappend
shopt -s cmdhist
shopt -s checkwinsize

reset=$'\e[0m'
blue=$'\e[1;34m'
case "$(id -u)" in
  0) color=$'\e[1;31m' ;; # red
  *) color=$'\e[0;32m'   ;; # green
esac
PS1="\[${color}\]\u@\h\[${reset}\]:\[${blue}\]\W\[${reset}\]\[${color}\]\$\[${reset}\] "
unset rseset blue color

alias ls='ls --color=auto --group-directories-first -FHh'
alias ll='ls -l'
alias la='ls -lA'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ...'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -ch'

function man {
  LESS_TERMCAP_md=$'\e[01;31m'    \
  LESS_TERMCAP_me=$'\e[0m'        \
  LESS_TERMCAP_se=$'\e[0m'        \
  LESS_TERMCAP_so=$'\e[01;47;30m' \
  LESS_TERMCAP_ue=$'\e[0m'        \
  LESS_TERMCAP_us=$'\e[01;32m'    \
  command man "$@"
}

[ -f "$HOME/.dircolors" ] && eval "$(dircolors "$HOME/.dircolors")"
