# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export REPOS_PATH="$HOME/Repos"
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin

# Setup API Keys
export OPENAI_API_KEY=""
export PERPLEXITY_API_KEY=""

# Starship theme config
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select > /dev/null || eval "$(starship init zsh)"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Configure autosuggest style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6f6f6f,underline"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-vi-mode
)

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="lvim ~/.config/nvim/init.vim"

alias up="rm -f tmp/restart.txt && ~/Repos/stayfi/bin/webpack-dev-server"
alias upadmin="rails c"
alias upjobs="bundle exec rails jobs:work"
alias dev-server-logs="tail -f log/development.log"
alias restart-puma="rm tmp/restart.txt"
alias lsplogs="cat ~/.local/state/nvim/lsp.log"
alias prodconsole="heroku run 'bundle exec rails c -- --nomultiline' -a stayfi-production | tee $REPOS_PATH/stayfi/log.txt"
alias restartpg="sudo rm /opt/homebrew/var/postgresql\@15/postmaster.pid && brew services restart postgresql@15"
alias migrate="bundle exec rails db:migrate"
alias rollback="bundle exec rails db:rollback"

alias update="brew update && brew upgrade"

# Vim aliases
alias v="nvim"
alias nvimconfig="nvim ~/.config/nvim"
alias nv="neovide"

# VScode aliases
alias c="code"

# Rails alias
alias rr="bundle exec rspec"

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

alias update-yabai-visudo='echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai'

# eza (ls replacement)
alias ls="eza --icons --color=always --group-directories-first"
alias ll='eza -alF --icons --color=always --group-directories-first'

alias c='cursor'
alias claude='NODENV_VERSION=22.6.0 claude'

alias tempfile='nvim /tmp/tempfile'

# # Enables nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setting up rbenv
eval "$(rbenv init - --no-rehash zsh)"

# Setting up nodenv
PATH+=":$HOME/.nodenv/shims"
# . $HOME/.nodenv/completions/nodenv.zsh
eval "$(nodenv init - zsh)"

# Export Path
# ---
# Add gems to path
# export PATH="$PATH:$HOME/.gem/ruby/3.2.0/bin"
# Enable bob-nvim
PATH+=":$HOME/.local/share/bob/nvim-bin"
# Add postgresql@15 to path
PATH+=":/opt/homebrew/opt/postgresql@15/bin"
# Add Mason bins to path
PATH+=":$HOME/.local/share/nvim/mason/bin"
# Add MacOS alacritty to path
PATH+=":/Applications/Alacritty.app/Contents/MacOS"
# Add Emacs to path
PATH+=":$HOME/.emacs.d/bin"
# Add Go binaries to path
PATH+=":$GOBIN"
# Created by `pipx` on 2025-03-07 13:36:28
export PATH="$PATH:/Users/gchen/.local/bin"
# Add hererocks version of lua to path
source $XDG_CONFIG_HOME/lua51/bin/activate

# Link zoxide
eval "$(zoxide init zsh)"

# Link cargo
. "$HOME/.cargo/env"

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Export constant necessary for rails to work on macos
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Run tmux on startup
# Run tmux on startup: start a new session if none exist, otherwise attach to the most recently used one.
if [ -z "$TMUX" ] && command -v tmux >/dev/null; then
  # Only in interactive shells
  [[ $- != *i* ]] && return
  if tmux list-sessions >/dev/null 2>&1; then
    recent_session="$(tmux list-sessions -F "#{session_name}:#{session_last_attached}:#{session_created}" \
      | sort -t: -k2,2nr -k3,3nr | head -n1 | cut -d: -f1)"
    if [ -n "$recent_session" ]; then
      tmux attach -t "$recent_session"
    else
      tmux new-session
    fi
  else
    tmux new-session
  fi
fi

fpath+=${ZDOTDIR:-~}/.zsh_functions
