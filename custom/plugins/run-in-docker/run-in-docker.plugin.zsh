# ============================================
# Main plugin loader
# ============================================

RID_PLUGIN_DIR="${0:A:h}"

# lib yükle
for file in "$RID_PLUGIN_DIR/lib/"*.zsh; do
  source "$file"
done

# sub-plugins yükle
for file in "$RID_PLUGIN_DIR/"*.plugin.zsh; do
  [[ "$file" != "$0" ]] && source "$file"
done
