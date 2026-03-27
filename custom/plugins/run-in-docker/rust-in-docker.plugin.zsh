# ============================================
# Rust tooling via Docker
#
# rust-in-docker.plugin.zsh
# ============================================

# core plugin yüklü mü kontrol et
if ! typeset -f _run_in_docker >/dev/null; then
  echo "[run-in-docker] ERROR: core plugin not loaded"
  return 1
fi

# cargo wrapper
cargo() {
  _run_in_docker rust cargo "$@"
}

# rustc wrapper
rustc() {
  _run_in_docker rust rustc "$@"
}

# opsiyonel ekstra araçlar
cargo-clippy() {
  _run_in_docker rust cargo clippy "$@"
}

cargo-fmt() {
  _run_in_docker rust cargo fmt "$@"
}
