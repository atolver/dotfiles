# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerline"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode tmux tmuxinator vagrant web-search history-substring-search history)

POWERLINE_SHOW_GIT_ON_RIGHT="true"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_RIGHT_A="mixed"
POWERLINE_DATE_FORMAT="%D{%d-%m}"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# PROMPT Settings
#__rvm_project_rvmrc

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:~/myscripts:/usr/local/lib/ruby/gems/2.0.0/gems/tmuxinator-0.6.5/bin:/usr/local/lib/ruby/gems/2.0.0/gems/guard-1.8.3/bin:/Library/Python/2.7/site-packages
PATH=$PATH:/usr/local/Cellar/ruby/2.0.0-p247/bin
PATH=$PATH:$HOME/.composer/vendor/bin
export TERM='xterm-256color'
export CLICOLOR=1
export EDITOR='vim'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

if [[ -r /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
fi

bindkey '\eOA' history-beginning-search-backward
bindkey '\e[A' history-beginning-search-backward
bindkey '\eOB' history-beginning-search-forward
bindkey '\e[B' history-beginning-search-forward
