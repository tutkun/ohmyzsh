# ============================================
# Python via Docker
#
# python-in-docker.plugin.zsh
# ============================================

# core plugin yüklü mü kontrol et
if ! typeset -f _run_in_docker >/dev/null; then
  echo "[run-in-docker] ERROR: core plugin not loaded"
  return 1
fi

python() {
  _run_in_docker python python "$@"
}

pip() {
  _run_in_docker python pip "$@"
}

pip3() {
  _run_in_docker python pip3 "$@"
}
