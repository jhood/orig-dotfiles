
# read on login shell BEFORE .bashrc

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

# z to change dirs
#. ~/bin/z.sh

#export EC2_HOME=~/.ec2
#export PATH=$PATH:$EC2_HOME/bin:/usr/local/sbin
#export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
#export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
#export R_HOME=/usr/local/Cellar/r/2.14.0/R.framework/Versions/2.14/Resources

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
#export PATH

export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
