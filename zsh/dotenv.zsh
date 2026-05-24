if [[ -f "$ZDOTDIR/.env" ]]; then
  set -a
  source "$ZDOTDIR/.env"
  set +a
fi
