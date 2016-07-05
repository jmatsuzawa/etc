##########################################
# set environment variables
##########################################
# set $EDITOR
if which vim > /dev/null 2>&1; then
  EDITOR=vim
elif which vi > /dev/null 2>&1; then
  EDITOR=vi
elif which editor > /dev/null 2>&1; then
  EDITOR=editor
fi
if test -n "$EDITOR"; then
  export EDITOR
fi

# set $CVSEDITOR
CVSEDITOR=$EDITOR
if test -n "$CVSEDITOR"; then
  export CVSEDITOR
fi

# set $LESSOPEN
if which lesspipe > /dev/null 2>&1; then
  LESSOPEN='|lesspipe %s'
elif which lesspipe.sh > /dev/null 2>&1; then
  LESSOPEN='|lesspipe.sh %s'
fi
if test -n "$LESSOPEN"; then
  export LESSOPEN
fi

# set $PYTHONSTARTUP
if which python > /dev/null 2>&1; then
  PYTHONSTARTUP="${HOME}/etc/python/pystartuprc.py"
  export PYTHONSTARTUP
fi

JHCKDIR=/opt/gnome/checkout
export JHCKDIR

JHINSDIR=/opt/gnome/install
export JHINSDIR

# set $PATH
# PATH="${PATH}:${HOME}/bin/interactive"
# export PATH


##########################################
# set others
##########################################
if [ x"${TERM}" != xlinux ] && [ x"$DISPLAY" != x ] && [ -r "${HOME}/.Xmodmap" ]; then
  xmodmap ${HOME}/.Xmodmap
fi
