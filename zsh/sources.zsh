source $ZSH/oh-my-zsh.sh
source "$HOME/.cargo/env"
source "$HOME/.local/bin/env"

# nvm setup
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/manor/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# pnpm
export PNPM_HOME="/Users/manor/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/manor/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/manor/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/manor/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/manor/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
