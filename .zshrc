# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Make iterm2 pretty with ascii art
#alias neofetch="neofetch --ascii .config/neofetch/ascii/dr-robot-ascii"
alias neofetch="neofetch --ascii .config/neofetch/ascii/chewy.txt"
neofetch --ascii .config/neofetch/ascii/chewy.txt

# Path to your oh-my-zsh installation.
export ZSH="/Users/aidanscannell/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dracula"
DISPLAY_TIME=1

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command rection.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  autojump
  brew
  docker
  fasd
  gitignore
  osx
  pip
  zsh-autosuggestions
  zsh-syntax-highlighting
  wd
  virtualenvwrapper
  vi-mode
  python
  poetry
  npm
  github)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='vim'
#fi

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

# Virtualenvwrapper
# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# hack to make projectile not fail with git submodules
# export PATH="/usr/local/opt/gettext/bin:$PATH"


pdfcompress ()
{
    gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=$1.compressed.pdf $1;
}

##################################
# Configure emacs and emacsclient
##################################
#alias emacsclient='/usr/local/opt/emacs-mac/bin/emacsclient'
#alias emacs='/usr/local/opt/emacs-mac/Emacs.app/Contents/MacOS/Emacs.sh'
alias emacsclient='/usr/local/opt/emacs-plus/bin/emacsclient'
alias emacs='/usr/local/opt/emacs-plus/Emacs.app/Contents/MacOS/Emacs'
export EDITOR="emacs"
export PATH="$HOME/doom-emacs/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# Open in terminal with emacsclient if server exists, otherwise open emacs
alias te="$HOME/.emacs.d/emacs-client-server-term"
alias em="$HOME/.emacs.d/emacs-client-server"

#################
# Python Config
#################
# Add poetry to your shell
export PATH="$HOME/.poetry/bin:$PATH"
fpath+=~/.zfunc

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
#export PYENV_VERSION=3.9.0
export PYENV_VERSION=3.8.6

##################################
# add swift 4TF to path
##################################
export PATH=/Library/Developer/Toolchains/swift-latest/usr/bin:"${PATH}"

##################################
# Configure dotfiles vc
##################################
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

##################################
# Configure Kitty
##################################
export KITTY_CONFIG_DIRECTORY='~/.config/kitty'

# Created by `userpath` on 2020-12-04 13:41:10
export PATH="$PATH:/Users/aidanscannell/.local/bin"
