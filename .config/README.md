# Dotfiles
# Using bare git repo

# Manage dotfiles

# set up bare git repo for dotfiles

# create dotfile repo on github

# setup initially
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# also put alias in shell startup...

config config --local status.showUntrackedFiles no

# get something in the repo
echo "# dotfiles" >> ~/.cfg/README.md
config add ~/.cfg/README.md
config commit -m "initial commit"

# set to the GitHub repo
config remote add origin  https://github.com/jhood/dotfiles.git
config push --set-upstream origin master


###################################
# add more files
config add [whatever]
config commit -m "whatever"
config push

###################################
# installing on new system
echo ". dotfiles" >> .gitignore
git clone --bare https://github.com/jhood/dotfiles.git $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
