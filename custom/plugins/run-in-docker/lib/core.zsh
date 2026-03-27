_rid_get_root() {
  # git ile mevcut dizini al ya da bulunulan dizini al:
  git rev-parse --show-toplevel 2>/dev/null || pwd
}

_rid_get_rel() {
  local root="$1"
  # dizin hatalarını önlemek için temizleme işlemi
  local rel="${PWD#$root}"
  rel="${rel#/}"
  echo "$rel"
}

_rid_sanitize_name() {
  echo "$1" | tr '/:' '__'
}
