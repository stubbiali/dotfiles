# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable colors
export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegedabagaced

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# completion based on history
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

# add ssh identities
# example: ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa_covid19 > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa_cv > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa_docker > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa_tasmania > /dev/null 2>&1

# useful aliases
alias calc='libreoffice --calc'
alias ipe='~/Downloads/ipe-7.2.7-x86_64.AppImage &'

# nvim
alias vim='nvim'
export VIM=/usr/local/share/nvim
export VIMRUNTIME=/usr/local/share/nvim/runtime

# gridtools
export PHD_ROOT=/home/stefano/Desktop/phd/
export GT4PY_ROOT=/home/stefano/Desktop/phd/gridtools4py
export TASMANIA_ROOT=/home/stefano/Desktop/phd/tasmania
export PYTHONPATH=$PYTHONPATH:$PHD_ROOT:$GT4PY_ROOT:$TASMANIA_ROOT

# pycharm
export PATH=$PATH:usr/local/pycharm-community-2017.2.4/bin
export PYCHARM_BIN=/usr/local/pycharm-community-2017.2.4/bin/pycharm.sh
alias pycharm='$PYCHARM_BIN'

# latex
alias kpsewhich='/usr/local/texlive/2019/bin/x86_64-darwin/kpsewhich'
alias latex='/usr/local/texlive/2019/bin/x86_64-darwin/latex'
alias latexindent='/usr/local/texlive/2019/bin/x86_64-darwin/latexindent'
alias pdflatex='/usr/local/texlive/2019/bin/x86_64-darwin/pdflatex'
alias synctex='/usr/local/texlive/2019/bin/x86_64-darwin/synctex'
alias texhash='/usr/local/texlive/2019/bin/x86_64-darwin/texhash'

# perl
alias cpanm='/usr/local/Cellar/perl/5.30.0/bin/cpanm'

# generate EPS figures out of MATLAB plots using matlabfrag
make_figure() {
	cd img
	pdflatex -shell-escape generate_pdf.tex
	cp newplot.tex src/$1.tex
	mv generate_pdf.pdf inc/$1.pdf
	cd ../
}

# generate an encrypted file, removing the original (i.e. unencrypted) file
encrypt() {
	openssl aes-128-cbc < $1 > $1.aes-128-cbc
}

# decrypt an encrypted file
decrypt() {
	FILENAME=$1
	FILENAME="${FILENAME%.*}"
	openssl aes-128-cbc -d < $1 > $FILENAME
}

# decompress compressed archives
decompress() {
	FILENAME=$1
	ROOT="${FILENAME%.*}"
	EXTENSION="${FILENAME##*.}"

	if [ "$EXTENSION" == "bz2" ]
	then
		tar -jxf $FILENAME
		decompress $ROOT
	elif [ "$EXTENSION" == "gz" ]
	then
		gunzip $FILENAME
		decompress $ROOT
	elif [ "$EXTENSION" == "tar" ]
	then
		tar -xvf $FILENAME
		decompress $ROOT
	elif [ "$EXTENSION" == "tgz" ]
	then
		tar -zxf $FILENAME
		decompress $ROOT
	elif [ "$EXTENSION" == "xz" ]
	then
		tar xf $FILENAME$
		decompress $ROOT
	fi
}

# delete all Vim swap files in a given directory and in all its subdirectories (if any)
rm_swap() {
	find $1 -type f -name "*.sw[klmnop]" -delete
}

# locale
export LC_ALL=en_US.UTF-8

# make homebrew's llvm visible
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS=-L/usr/local/opt/llvm/lib

# boost root
export BOOST_ROOT=/usr/local/Cellar/boost/1.72.0_1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/share/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/share/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/share/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/share/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
