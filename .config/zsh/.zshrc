#!/bin/sh

# probably this should be in a higher env var
# and in .xprofile
#export ZDOTDIR=$HOME/.config/zsh


# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"

# Plugins
# zsh-autosuggestions
# zsh-syntax-highlighting

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

#zsh_add_plugin "hlissner/zsh-autopair"
#zsh_add_completion "esc/conda-zsh-completion" false

# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'ranger^M'
#bindkey "^p" up-line-or-beginning-search # Up
#bindkey "^n" down-line-or-beginning-search # Down
#bindkey "^k" up-line-or-beginning-search # Up
#bindkey "^j" down-line-or-beginning-search # Down
#bindkey -r "^u"
#bindkey -r "^d"


# my stuff from original install...

# alias for git dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias lsa='ls -ah'
alias ll='ls -l'
alias lla='ls -la'
alias la='ls -la'

alias ..='cd ..'
alias ...='cd ../..'

# starship prompt
eval "$(starship init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bind keys for tab completion like vim
zstyle ':completion:*' menu select
zmodload zsh/complist

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# read vim config from .config/vim
VIMINIT="source ~/.config/vim/vimrc"
#export VIMINIT='source $MYVIMRC'
#export MYVIMRC='~/.config/vim/vimrc'·


