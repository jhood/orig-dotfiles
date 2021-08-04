# read AFTER .bash_profile
# or on a non-login interactive shell


# get OS version for comparisons
OS=`uname`

# Load bash_prompt, exports, aliases, functions and extra
# extra can be used for settings you don’t want to commit
# load from ~/.config/bash
for file in functions bash_prompt exports aliases extra; do
  file="$HOME/.config/bash/$file"
  [ -e "$file" ] && source "$file"
done

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
if [ $OS == "Darwin" ]; then
  complete -W "NSGlobalDomain" defaults
fi

export BASH_SILENCE_DEPRECATION_WARNING=1


# dotfile command for git dotfile repo
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# run starship prompt
eval "$(starship init bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# read vim config from .config/vim
#export MYVIMRC="~/.config/vim/vimrc"
#export VIMINIT='source $MYVIMRC'
export VIMINIT="~/.config/vim/vimrc"



