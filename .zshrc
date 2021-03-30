# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/subbiali/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-completions)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# prompt
PROMPT="%{$fg_bold[green]%}%n%{$fg_bold[green]%}@%{$fg_bold[green]%}%m%{$reset_color%} ${PROMPT}"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# nvim
alias vim='nvim'
export VIM=/usr/local/share/nvim
export VIMRUNTIME=/usr/local/share/nvim/runtime

# Gridtools
export PHD_ROOT=/home/stefano/Desktop/phd/
export GT4PY_ROOT=/home/stefano/Desktop/phd/gridtools4py
export TASMANIA_ROOT=/home/stefano/Desktop/phd/tasmania
export PYTHONPATH=$PYTHONPATH:$PHD_ROOT:$GT4PY_ROOT:$TASMANIA_ROOT

# Pycharm
export PATH=$PATH:usr/local/pycharm-community-2017.2.4/bin
export PYCHARM_BIN=/usr/local/pycharm-community-2017.2.4/bin/pycharm.sh
alias pycharm='$PYCHARM_BIN'

# latex
alias context='/usr/local/texlive/2019/bin/x86_64-darwin/context'
alias kpsewhich='/usr/local/texlive/2019/bin/x86_64-darwin/kpsewhich'
alias latex='/usr/local/texlive/2019/bin/x86_64-darwin/latex'
alias latexindent='/usr/local/texlive/2019/bin/x86_64-darwin/latexindent'
alias pdflatex='/usr/local/texlive/2019/bin/x86_64-darwin/pdflatex'
alias synctex='/usr/local/texlive/2019/bin/x86_64-darwin/synctex'
alias texhash='/usr/local/texlive/2019/bin/x86_64-darwin/texhash'

# perl
alias cpanm='/usr/local/Cellar/perl/5.30.0/bin/cpanm'

# generate an encrypted file, removing the original (i.e., unencrypted) file
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

# setting PATH for Python 3.6
# the original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# make homebrew's llvm visible
export PATH="/usr/local/Cellar/llvm/11.0.0/bin:$PATH"
export LDFLAGS=-L/usr/local/Cellar/llvm/11.0.0/lib
export CC=/usr/local/Cellar/llvm/11.0.0/bin/clang
export CXX=/usr/local/Cellar/llvm/11.0.0/bin/clang++

# boost root
export BOOST_ROOT=/usr/local/Cellar/boost/1.72.0_3

# gcc
alias gcc='/usr/local/Cellar/gcc/9.3.0/bin/gcc-9'
alias g++='/usr/local/Cellar/gcc/9.3.0/bin/g++-9'

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
