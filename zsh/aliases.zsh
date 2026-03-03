alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="lvim ~/.config/nvim/init.vim"

alias up="rm -f tmp/restart.txt && ~/Repos/stayfi/bin/webpack-dev-server"
alias upadmin="rails c"
alias upjobs="bundle exec rails jobs:work"
alias dev-server-logs="tail -f log/development.log"
# alias restart-puma="rm tmp/restart.txt"
alias lsplogs="cat ~/.local/state/nvim/lsp.log"
alias prodconsole="heroku run 'bundle exec rails c -- --nomultiline' -a stayfi-production | tee $REPOS_PATH/stayfi/log.txt"
alias restartpg="sudo rm /opt/homebrew/var/postgresql\@15/postmaster.pid && brew services restart postgresql@15"
alias migrate="bundle exec rails db:migrate"
alias rollback="bundle exec rails db:rollback"

alias update="brew update && brew upgrade"
alias ip="curl https://api.ipify.org"

# Vim aliases
alias v="nvim"
alias sv="source ./.venv/bin/activate ; nvim"
alias nvimconfig="nvim ~/.config/nvim"
alias nv="neovide"

# Python aliases
alias so="source ./.venv/bin/activate"

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
alias gp="git pull"

# Manor
alias gcloudauth="gcloud auth application-default login"
alias gcloudlegislation="gcloudauth ; ~/cloud-sql-proxy manor-tax:us-central1:manor-stag --address 127.0.0.1 --port 1234"
alias up="docker compose up"
alias down="docker compose down"

alias update-yabai-visudo='echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai'

# eza (ls replacement)
alias ls="eza --icons --color=always --group-directories-first"
alias ll='eza -alF --icons --color=always --group-directories-first'

alias c='cursor'

alias tempfile='nvim /tmp/tempfile'
