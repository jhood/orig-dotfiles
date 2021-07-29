# read AFTER .bash_profile
# or on a non-login interactive shell

# source the bash_profile
#source "$HOME/.bash_profile"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# dotfile command for git dotfile repo
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# run starship prompt
eval "$(starship init bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# read vim config from .config/vim
VIMINIT="source ~/.config/vim/vimrc"


