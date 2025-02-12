if (( $+commands[asdf] )); then
  export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
  path=("$ASDF_DATA_DIR/shims" $path)

  # If the completion file doesn't exist yet, we need to autoload it and
  # bind it to `asdf`. Otherwise, compinit will have already done that.
  if [[ ! -f "$ZSH_CACHE_DIR/completions/_asdf" ]]; then
    typeset -g -A _comps
    autoload -Uz _asdf
    _comps[asdf]=_asdf
  fi
  asdf completion zsh >| "$ZSH_CACHE_DIR/completions/_asdf" &|

  return
fi

# TODO:(2025-02-12): remove deprecated asdf <0.16 code

# Find where asdf should be installed
ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"
ASDF_COMPLETIONS="$ASDF_DIR/completions"

export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
path=("$ASDF_DATA_DIR/shims" $path)

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `asdf`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_asdf" ]]; then
  typeset -g -A _comps
  autoload -Uz _asdf
  _comps[asdf]=_asdf
fi
asdf completion zsh >| "$ZSH_CACHE_DIR/completions/_asdf" &|
