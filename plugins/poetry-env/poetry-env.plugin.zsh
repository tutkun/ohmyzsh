_togglePoetryShell() {
  # Determine if currently in a Poetry-managed directory
  local in_poetry_dir=0
  if [[ -f "$PWD/pyproject.toml" ]] && grep -q 'tool.poetry' "$PWD/pyproject.toml"; then
    in_poetry_dir=1
  fi

  # activate the environment if pyproject.toml exists
  if [[ "$poetry_active" != 1 ]]; then
    if [[ -f "$PWD/pyproject.toml" ]]; then
      if grep -q 'tool.poetry' "$PWD/pyproject.toml" && venv_dir=$(poetry env info --path); then
        export poetry_active=1
        export poetry_dir="$PWD"
        source "${venv_dir}/bin/activate"
      fi
    fi
  fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd _togglePoetryShell
_togglePoetryShell # Initial call to check the current directory at shell startup
