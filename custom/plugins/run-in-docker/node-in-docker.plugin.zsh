# ============================================
# Node via Docker
#
# node-in-docker.plugin.zsh
# ============================================

# core plugin yüklü mü kontrol et
if ! typeset -f _run_in_docker >/dev/null; then
  echo "[run-in-docker] ERROR: core plugin not loaded"
  return 1
fi

node() {
  _run_in_docker node node "$@"
}

bun() {
  _run_in_docker node bun "$@"
}

npm() {
  _run_in_docker node npm "$@"
}

npx() {
  _run_in_docker node npx "$@"
}

yarn() {
  _run_in_docker node yarn "$@"
}
