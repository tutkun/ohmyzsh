# ============================================
# PHP via Docker
#
# php-in-docker.plugin.zsh
# ============================================

php() {
  _run_in_docker php php "$@"
}
