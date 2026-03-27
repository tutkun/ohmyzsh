# ============================================
# Debian via Docker
#
# debian-in-docker.plugin.zsh
# ============================================

# core plugin yüklü mü kontrol et
if ! typeset -f _run_in_docker >/dev/null; then
  echo "[run-in-docker] ERROR: core plugin not loaded"
  return 1
fi

debian() {
  _run_in_docker debian "$@"
}
