# ============================================
# Go-Lang via Docker
#
# go-in-docker.plugin.zsh
# ============================================

# core plugin yüklü mü kontrol et
if ! typeset -f _run_in_docker >/dev/null; then
  echo "[run-in-docker] ERROR: core plugin not loaded"
  return 1
fi

go() {
  _run_in_docker go go "$@"
}
