# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Make iterm2 pretty with ascii art
#alias neofetch="neofetch --ascii .config/neofetch/ascii/dr-robot-ascii"
alias neofetch="neofetch --ascii .config/neofetch/ascii/chewy.txt"
# neofetch --ascii .config/neofetch/ascii/chewy.txt

# Path to your oh-my-zsh installation.
export ZSH="/Users/aidanscannell/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="dracula"
ZSH_THEME="spaceship"
# Config options: https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
export SPACESHIP_PROMPT_SEPARATE_LINE="true"
export SPACESHIP_PROMPT_ADD_NEWLINE="false"
export SPACESHIP_TIME_SHOW="true"
export SPACESHIP_TIME_COLOR="060"
export SPACESHIP_TIME_12HR="true"
export SPACESHIP_TIME_PREFIX="• "
#export SPACESHIP_TIME_FORMAT="%D{%L:%M}"
export SPACESHIP_EXEC_TIME_PREFIX="• took "
export SPACESHIP_PROMPT_DEFAULT_PREFIX="• "
export SPACESHIP_GIT_PREFIX="• "
export SPACESHIP_PACKAGE_SYMBOL=""
export SPACESHIP_PACKAGE_PREFIX="@ "
export SPACESHIP_PACKAGE_COLOR="214"
export SPACESHIP_HOST_SHOW="false"
export SPACESHIP_HOST_PREFIX=""
export SPACESHIP_HOST_SUFFIX=" ॐ"
export SPACESHIP_RUBY_SYMBOL=""
export SPACESHIP_CHAR_SYMBOL="λ "
export SPACESHIP_VI_MODE_SHOW="false"
export SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  time          # Time stamps section
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

#DISPLAY_TIME=1

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

# ##################################
# # Terminal Emacs
# ##################################
# # gui emacs config in .zshenv so functions can be called by skhd
# # GUI_EMACS_SERVER_FILE="$HOME/.emacs.d/server/gui"
# TERM_EMACS_SERVER_FILE="$HOME/.emacs.d/server/term"

# function testart {
#   echo "starting emacs deamon=term"
#   emacs --daemon=$TERM_EMACS_SERVER_FILE
# }
# function testop {
#   echo "stopping emacs deamon=term"
#   emacsclient -s $TERM_EMACS_SERVER_FILE -e "(client-save-kill-emacs)"
# }
# function terestart {
#   echo "restarting emacs deamon=term"
#   testop
#   testart
# }
# function ter() {
#   # restart emacs term server and open emacsclient in terminal
#   terestart
#   te ${1}
# }
# function te () {
#   # open emacsclient in terminal
#   emacsclient -s $TERM_EMACS_SERVER_FILE -nw ${1}
# }

# ##################################
# # GUI emacs
# ##################################
# # Open GUI Emacs
# function ge {
#   # check if emacs server exists and open new client frame if so
#   if test -e "$GUI_EMACS_SERVER_FILE"; then
#     echo "opening emacsclient"  
#     emacsclient -s $GUI_EMACS_SERVER_FILE -c
#   else
#     echo "opening emacs"  
#     emacs
#   fi
# }
# function gestart {
#   echo "starting emacs deamon=gui"
#   emacs --daemon=$GUI_EMACS_SERVER_FILE
# }
# function gestop {
#   emacsclient -s $GUI_EMACS_SERVER_FILE -e "(kill-emacs)"
# }
# function gerestart {
#   echo "restarting emacs deamon=gui"
#   gestop
#   gestart
# }
# function ger() {
#   # restart gui emacs server and open gui emacsclient
#   gerestart
#   ge ${1}
# }

##################################
# Configure emacs and emacsclient
##################################
# gui config in .zshenv so functions can be called by skhd/launchctl
#alias emacsclient='/usr/local/opt/emacs-mac/bin/emacsclient'
#alias emacs='/usr/local/opt/emacs-mac/Emacs.app/Contents/MacOS/Emacs.sh'
#alias emacsclient='/usr/local/opt/emacs-plus/bin/emacsclient'
#alias emacs='/usr/local/opt/emacs-plus/Emacs.app/Contents/MacOS/Emacs'
export EDITOR="te"
export PATH="$HOME/doom-emacs/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# Open in terminal with emacsclient if server exists, otherwise open emacs
#alias te="$HOME/.emacs.d/emacs-client-server-term"
#alias em="$HOME/.emacs.d/emacs-client-server"
alias vim=te
alias ranger=tedired


#################
# Python Config
#################
export PATH="$(pyenv root)/shims:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
#export PYENV_VERSION=3.9.0
# export PYENV_VERSION=3.8.6

# Add poetry to shell
export PATH="$HOME/.poetry/bin:$PATH"
fpath+=~/.zfunc

# make google/jax run in 64 bit mode
export JAX_ENABLE_X64=True

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

##################################
# Configure direnv
##################################
eval "$(direnv hook zsh)"
