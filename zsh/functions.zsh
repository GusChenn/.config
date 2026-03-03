zstyle ':omz:update' mode auto      # update automatically without asking

eval "$(zoxide init zsh)"

type starship_zle-keymap-select > /dev/null || eval "$(starship init zsh)"

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

