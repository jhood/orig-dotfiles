
# Profile file - runs on login
#
# bash_profile, zprofile, and xprofile are all symlinks to this file
# read on login shell BEFORE anything

# env settings
export PATH="$HOME/bin:$PATH"
export EDITOR="vim"
export TERMINAL="xterm"
export BROWSER="chromium"

# Start X if not already started
#if [ "$(tty)" = "/dev/tty1" ]; then
#  pgrep -x i3 || exec startx
#fi


# Switch escape and caps and use wal colors in console
#sudo -n loadkeys ~/.config/scripts/ttymaps.kmap 2>/dev/null
#wal -Rn >/dev/null

# rvm stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

