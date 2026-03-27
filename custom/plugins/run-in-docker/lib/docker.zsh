_rid_detect_devcontainer() {
  local root="$(_rid_get_root)"

  if [[ -f "$root/.devcontainer/devcontainer.json" ]]; then
    echo "devcontainer"
  fi
}

_rid_get_image() {
  local lang="$1"

  # .env override
  local env_var="RID_${(U)lang}_IMAGE"
  local custom_image="${(P)env_var}"

  if [[ -n "$custom_image" ]]; then
    echo "$custom_image"
    return
  fi

  case "$lang" in
    rust) echo "rust:latest" ;;
    node) echo "node:lts" ;;
    python) echo "python:latest" ;;
    go) echo "golang:latest" ;;
    php) echo "php:8.3-cli" ;;
    *) echo "pardus/yirmibes:latest" ;;
  esac
}

_run_in_docker() {
  local lang="$1"
  shift

  _rid_load_env

  local root="$(_rid_get_root)"
  local rel="$(_rid_get_rel "$root")"
  local name="$(_rid_sanitize_name "$(basename "$root")")"

  local image="$(_rid_get_image "$lang")"

  # devcontainer fallback (şimdilik sadece uyarı)
  if [[ "$(_rid_detect_devcontainer)" == "devcontainer" ]]; then
    echo "[run-in-docker] devcontainer detected (fallback not implemented yet)"
  fi

  docker run --rm -it \
    -v "$root:/workspace" \
    -w "/workspace/$rel" \
    \
    -v "${name}-${lang}-cache:/root/.cache" \
    \
    "$image" "$@"
}
