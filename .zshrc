# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export REPOS_PATH="$HOME/Repos"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="josh-moded"

# Starship theme config
eval "$(starship init zsh)"

# Typewritten theme config
# ZSH_THEME="typewritten"
# export TYPEWRITTEN_CURSOR="block"
# export TYPEWRITTEN_SYMBOL="❯"
# export TYPEWRITTEN_ARROW_SYMBOL="➜"
# export TYPEWRITTEN_COLOR_MAPPINGS="primary:#7287FD;secondary:#7287FD;accent:#7287FD"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Configure autosuggest style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6f6f6f,underline"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias zshconfig="nvim ~/.zshrc"
alias regolithconfig="nvim ~/.config/regolith2/Xresources"
alias nvimconfig="lvim ~/.config/nvim/init.vim"
alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt-get update -y && sudo apt-get upgrade -y && sudo flatpak update"
alias picomconfig="lvim ~/.config/regolith2/picom/config"

alias up="docker compose up postgres redis webpacker sidekiq rails"
alias up-cypress="DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL=true RAILS_ENV=e2e docker compose up postgres redis webpacker sidekiq rails pgbouncer"
alias cypress-pan="yarn workspace @qulture/people-analytics cypress"
alias jest-pan="yarn workspace @qulture/people-analytics run test:jest --no-cache"
alias partial="docker compose up postgres redis"
alias runner="docker compose run --rm runner"
alias runner-cypress="DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL=true RAILS_ENV=e2e docker compose run --rm runner"
alias permission="sudo chown -R $USER:$USER ."
alias packages="sudo chown -R $USER:$USER . && bundle install && yarn install && docker compose run --rm runner bundle install && yarn install"
alias run="qr console run"

# Vim aliases
alias v="nvim"
alias nvimconfig="nvim ~/.config/nvim"
alias nv="neovide"

# VScode aliases
alias c="code"

# Add the file at the end of the command
alias storybook="docker compose up storybook"

# git aliases
alias grh="git reset --hard HEAD"
alias grs="git reset --soft HEAD~1"
alias gs="git status"
alias gco="git checkout"
alias gcm="git commit -m"
alias gclean="git clean -f"
alias gd="git diff"
alias gb="git checkout -b"
alias lg="lazygit"

alias cat="batcat"
alias logout="gnome-session-quit"

# Enables nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Imports z script
. $HOME/.config/my-scripts/z/z.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# Add polybar scripts to path - we have to add polybar path to ~/.profile
# Add appimages to path
export PATH=$PATH:/usr/local/bin:$HOME/.local/bin:$HOME/.rvm/vin:$HOME/.appimages:$HOME/.config/polybar/scripts
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.appimages"

# Add appimages path to ilia env var
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/home/gchen/.appimages/

# Add gems to path
export PATH="$PATH:$HOME/.gem/ruby/3.2.0/bin"

# Link cargo
. "$HOME/.cargo/env"

# Run tmux on startup
if [ "$TMUX" = "" ]; then tmux; fi

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

