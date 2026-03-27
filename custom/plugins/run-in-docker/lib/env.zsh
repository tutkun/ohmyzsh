_rid_load_env() {
  local root="$(_rid_get_root)"

  if [[ -f "$root/.env" ]]; then
    set -a
    source "$root/.env"
    set +a
  fi
}
