############################################################
# prevent multiple include (it's needed?)
############################################################
# if test -n "$COMMON_SHRC_HAS_BEEN_READ"; then
#   return
# fi
# set -x
# COMMON_SHRC_HAS_BEEN_READ=0
# export COMMON_SHRC_HAS_BEEN_READ

############################################################
# Customize the following parameters if needed.
############################################################

############################################################
# The following parameters are defined automatically.
############################################################
# arch=`uname -m`
python_version=
if which python > /dev/null 2>&1; then
  python_version="python`python -c 'import sys; sys.stdout.write(sys.version[:3])'`"
fi

############################################################
# functions
############################################################

# TODO:
#   This function is a stub for the momment.
#   I must implement this properly.
# Check which the user has root authorities.
# is_sudoer()
# {
#   return 0
# }

############################################################
# set environment variables
############################################################
# set $PATH
# if is_sudoer; then
#   PATH="${HOME}/opt/bin:${HOME}/bin:${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
# else
#   PATH="${HOME}/opt/bin:${HOME}/bin:${PATH}"
# fi
# export PATH
PATH="${HOME}/opt/bin:${HOME}/bin:${PATH}:/usr/local/sbin:/usr/sbin:/sbin:/home/jmatsuzawa/Downloads/src/git/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin"

# set $JHBUILD_DIR
# JHBUILD_DIR="${HOME}/work/jhbuild/opt/gnome"
# JHBUILD_DIR="${HOME}/work/dev/gnome"
# export JHBUILD_DIR

# set $XDG_DATA_DIRS
# XDG_DATA_DIRS="${JHBUILD_DIR}/install/share/:${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
# export XDG_DATA_DIRS

# set $GPGKEY
GPGKEY=ECC442E9
export GPGKEY

# set $PKG_CONFIG_PATH
# global_pkg_config_path=/usr/lib/pkgconfig:/usr/share/pkgconfig
# case `arch` in
# x86_64)
#   PKG_CONFIG_PATH="${JHBUILD_DIR}/install/lib64/pkgconfig:${JHBUILD_DIR}/install/share/pkgconfig:/usr/lib64/pkgconfig:${global_pkg_config_path}"
#   ;;
# i[3-6]86)
#   PKG_CONFIG_PATH="${JHBUILD_DIR}/install/lib/pkgconfig:${JHBUILD_DIR}/share/pkgconfig:${global_pkg_config_path}"
#   ;;
# *)
#   PKG_CONFIG_PATH="${JHBUILD_DIR}/install/lib/pkgconfig:${JHBUILD_DIR}/install/share/pkgconfig:${global_pkg_config_path}"
#   ;;
# esac
# if test -n "$PKG_CONFIG_PATH"; then
#   export PKG_CONFIG_PATH
# fi

# set $PYTHONPATH
if test -n "$python_version" && test x"$VIRTUAL_ENV" = x; then
  case `arch` in
  x86_64)
#     PYTHONPATH="${HOME}/lib/python:${HOME}/opt/lib/${python_version}/site-packages:${JHBUILD_DIR}/install/lib64/${python_version}/site-packages:${JHBUILD_DIR}/install/lib/${python_version}/site-packages"
    PYTHONPATH="${HOME}/lib/python:${HOME}/opt/lib/${python_version}/site-packages:${PYTHONPATH}"
    ;;
  i[3-6]86)
#     PYTHONPATH="${HOME}/lib/python:${HOME}/opt/lib/${python_version}/site-packages:${JHBUILD_DIR}/install/lib/${python_version}/site-packages"
    PYTHONPATH="${HOME}/lib/python:${HOME}/opt/lib/${python_version}/site-packages:${PYTHONPATH}"
    ;;
  *)
#     PYTHONPATH="${HOME}/lib/python:${HOME}/opt/lib/${python_version}/site-packages:${JHBUILD_DIR}/install/lib/${python_version}/site-packages"
    PYTHONPATH="${HOME}/lib/python:${HOME}/opt/lib/${python_version}/site-packages:${PYTHONPATH}"
  esac
  if test -n "$PYTHONPATH"; then
    export PYTHONPATH
  fi
fi

# VIRTUALENVWRAPPER="${HOME}/.local/bin/virtualenvwrapper.sh"
# if [ -f "$VIRTUALENVWRAPPER" ]; then
#   export WORKON_HOME="${HOME}/.virtualenvs"
#   source "${VIRTUALENVWRAPPER}"
# fi

UPDMSG="Updated Japanese translation"
export UPDMSG
ADDMSG="Added Japanese translation"
export UPDMSG
MRGMSG="Merge the latest pot."
export MRGMSG
FIXERRMSG="Fix errors in translation"
export FIXERRMSG


############################################################
# set others
############################################################
ulimit -c unlimited
# umask 002


############################################################
# python
############################################################
export VIRTUALENV_USE_DISTRIBUTE=true
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=${HOME}/.virtualenvs
  source /usr/local/bin/virtualenvwrapper.sh
fi

pydev() {
if which virtualenvwrapper.sh >/dev/null 2>&1; then
  VIRTUALENVWRAPPER=`which virtualenvwrapper.sh`
  export WORKON_HOME="${HOME}/.virtualenvs"
  source "${VIRTUALENVWRAPPER}"
fi
}

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
