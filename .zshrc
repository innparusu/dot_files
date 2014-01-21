#!/bin/zsh
export LANG=ja_JP.UTF-8

case ${UID} in
0)
    LANG=C
    ;;
esac

## Default shell configuration
# set prompt
autoload colors
colors
## Default shell configuration
# auto change directory
setopt auto_cd
# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd
# command correct edition before each completion attempt
setopt correct
# compacked complete list display
setopt list_packed
# no remove postfix slash of command line
setopt noautoremoveslash
# no beep sound when complete list displayed
setopt nolistbeep
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del
# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete
## Command history configuration
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
## Completion configuration
fpath=(${HOME}/.zsh/functions/Completion ${fpath})

autoload -U compinit
compinit

## zsh editor
autoload zed

## Prediction configuration
#autoload predict-on
#predict-off

#エイリアス設定
setopt complete_aliases     
alias vi="vim"
alias where="command -v"
alias j="jobs -l"
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

## terminal configuration
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

# set terminal title including current directory
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export PTEX_IN_FILTER=/usr/local/bin/nkf

local GREEN=$'%{\e[0;32m%}'
local PINK=$'%{\e[0;35m%}' 
local DEFAULT=$'%{\e[0;m%}'

PROMPT="$GREEN%n @ %m$DEFAULT %(!.#.$) "
RPROMPT="[$PINK%~$DEFAULT]"
## PROMPT内で変数展開・コマンド置換・算術演算を実行する
#setopt prompt_subst
### PROMPT内で「%」文字から始まる置換機能を有効にする
#setopt prompt_percent
### コピペしやすいようにコマンド実行後は右プロンプトを消す
#setopt transient_rprompt
#PATHの重複を消す
typeset -U path

#os ex2.2
#touch ~/.dir_history
#function cd {
#    builtin cd "$@"
#    echo $PWD > ~/.dir_history
#}
#DIR=`cat ~/.dir_history`
#cd $DIR

#JPF
JPF_HOME=/Users/e125716/Workspace/java/jpf/jpf-core
