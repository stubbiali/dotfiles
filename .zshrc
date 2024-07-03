#zmodload zsh/zprof

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

#autoload -Uz compinit
#for dump in ~/.zcompdump(N.mh+24); do
#  compinit
#done
#compinit -C

source $ZSH/oh-my-zsh.sh

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

# alias
alias s='source'

# prompt
export PS1='%{$fg_bold[green]%}%n@%m ${ret_status}%{$fg_bold[green]%}%{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$(svn_prompt_info)%{$reset_color%}'

# brew
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/subbiali/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# compilers: gcc
# export GCC_ROOT=/opt/homebrew/Cellar/gcc/14.1.0_1
export GCC_MAJOR_VERSION=13
export GCC_VERSION=13.3.0
export GCC_ROOT=/opt/homebrew/Cellar/gcc@${GCC_MAJOR_VERSION}/${GCC_VERSION}
export PATH="${GCC_ROOT}/bin:${PATH}"
# note: the second path is needed for the linker to find libemutls_w.a
export LDFLAGS="-L${GCC_ROOT}/lib/gcc/${GCC_MAJOR_VERSION} -L${GCC_ROOT}/lib/gcc/${GCC_MAJOR_VERSION}/gcc/aarch64-apple-darwin23/${GCC_MAJOR_VERSION}/"
export LD_LIBRARY_PATH=${GCC_ROOT}/lib/gcc/{GCC_MAJOR_VERSION}:${LD_LIBRARY_PATH}
export DYLD_LIBRARY_PATH=${GCC_ROOT}/lib/gcc/${GCC_MAJOR_VERSION}:${DYLD_LIBRARY_PATH}
export CC=${GCC_ROOT}/bin/gcc-${GCC_MAJOR_VERSION}
export CXX=${GCC_ROOT}/bin/g++-${GCC_MAJOR_VERSION}
export FC=${GCC_ROOT}/bin/gfortran-${GCC_MAJOR_VERSION}

# compilers: clang
export CLANG_VERSION=18.1.8
export CLANG_FULL_VERSION=18.1.8
export PATH="/opt/homebrew/opt/llvm/bin:${PATH}"
# export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/opt/homebrew/Cellar/llvm/${CLANG_VERSION}/lib/c++

# compilers: apple-clang
export APPLE_CLANG_VERSION=15.0.0

# spack
source ~/Desktop/share/spack/develop/share/spack/setup-env.sh
spack env activate ~/Desktop/share/spack/develop/env/gcc@"${GCC_VERSION}"-apple-clang@"${APPLE_CLANG_VERSION}"

# boost
spack load boost %gcc@"${GCC_VERSION}"
export BOOST_ROOT=$(spack location -i boost %gcc@"${GCC_VERSION}")

# go
spack load go %apple-clang@"${APPLE_CLANG_VERSION}"

# MPI
spack load openmpi %gcc@"$GCC_VERSION"
export MPI_ROOT=$(spack location -i openmpi %gcc@"${GCC_VERSION}")
export MPICC="$MPI_ROOT"/bin/mpicc
export MPICXX="$MPI_ROOT"/bin/mpicxx
export MPIFC="$MPI_ROOT"/bin/mpif90

# hdf5
spack load hdf5 %gcc@"$GCC_VERSION" +fortran +mpi
export HDF5_ROOT=$(spack location -i hdf5 %gcc@"${GCC_VERSION}" +fortran +mpi)
export HDF5_DIR="$HDF5_ROOT"

# netcdf-c
spack load netcdf-c %gcc@"$GCC_VERSION" +mpi
export NETCDF_ROOT=$(spack location -i netcdf-c %gcc@"${GCC_VERSION}" +mpi)
export NETCDF4_DIR="$NETCDF_ROOT"
alias ncdump="$NETCDF_ROOT"/bin/ncdump

# autoconf
spack load autoconf %gcc@"${GCC_VERSION}"

# nvim
spack load neovim %apple-clang@"${APPLE_CLANG_VERSION}"
export VIM=$(spack location -i neovim %apple-clang@"${APPLE_CLANG_VERSION}")
alias vim='${VIM}/bin/nvim'
export VIMRUNTIME="${VIM}"/share/nvim/runtime
export EDITOR="${VIM}"/bin/nvim

# python 3.8
spack load python@3.8.19 %apple-clang@"${APPLE_CLANG_VERSION}"
py310_root=$(spack location -i python@3.8.19)
alias py310="$py310_root"/bin/python3

# python 3.9
spack load python@3.9.19 %apple-clang@"${APPLE_CLANG_VERSION}"
py310_root=$(spack location -i python@3.9.19)
alias py310="$py310_root"/bin/python3

# python 3.10
spack load python@3.10.14 %apple-clang@"${APPLE_CLANG_VERSION}"
py310_root=$(spack location -i python@3.10.14)
alias py310="$py310_root"/bin/python3

# python 3.11
spack load python@3.11.9 %apple-clang@"${APPLE_CLANG_VERSION}"
py311_root=$(spack location -i python@3.11.9)
alias py311="$py311_root"/bin/python3

# python 3.12
spack load python@3.12.0 %apple-clang@"${APPLE_CLANG_VERSION}"
py312_root=$(spack location -i python@3.12.0)
alias py312="$py312_root"/bin/python3

# ssh
ssh-add -D
ssh-add ~/.ssh/id_ed25519_github
ssh-add ~/.ssh/id_ed25519_lumi
ssh-add ~/.ssh/id_ed25519_mlux

# totp
export PATH="/Users/subbiali/Desktop/share/totp/bin:$PATH"
alias totp='totp-darwin-arm64'

# log profiling info
#zprof
