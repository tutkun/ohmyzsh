# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

# USER CONFIGURATIONS:
# ====================
# https://top-scripts.blogspot.com/2011/01/shell-commands.html

# MY THEMES:
# ZSH_THEME="agnoster" # arkaplanı renkli satır
# ZSH_THEME="amuse" # ~/path on  master! ⌚ 14:21:59
# ZSH_THEME="suvash" # ╭─tutkun at MacBook-Pro in ~/.oh-my-zsh on master!
# ZSH_THEME="sunrise" # --- ~/.oh-my-zsh ‹master* ?› » 
# ZSH_THEME="norm" # λ MacBook-Pro .oh-my-zsh → λ git master* →
# ZSH_THEME="strug" # ╭─tutkun@MacBook-Pro in ~/.oh-my-zsh on master ✘ (origin/master -77)
# ZSH_THEME="jnrowe" # Ξ ~/.oh-my-zsh git:(master) ▶ 
# ZSH_THEME="nebirhos" # @MacBook-Pro ➜ .oh-my-zsh git:(master) ✗ 
ZSH_THEME="wedisagree" # [~/path] <--sol---||||---sağ--> 14:22:41  ☁  master ☂ ✭

# MY PLUGINS:
plugins=(git gh colorize command-not-found compleat themes common-aliases create-nextjs-app webos-tv-cli)

# Android Studio için JAVA_HOME tanımlaması:
alias JAVA_HOME=/usr/libexec/java_home -v 19

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Brew intell mac için:
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# Flutter SDK Yolunu Belirtiyoruz:
export PATH="$PATH:$HOME/flutter-sdk/bin:$HOME/.pub-cache/bin"

# Visual Studio Code (code)
export PATH="$PATH:/Applications/Code.app/Contents/Resources/app/bin"

# Ruby güncelleme vs kontrolü için rbenv yükleniyor
eval "$(~/.rbenv/bin/rbenv init - zsh)"

# flutter create --org com.newcompany --project-name newproject .
alias create-new-flutter-project="flutter create --org com.tutkuns --project-name "

# HELPER FUNCTIONS:
# =================

# Aşağıdaki komut, .oh-my-zsh'ın plugins kısmındaki submodule dosyalarını otomatik günceller
# git submodule update --init --recursive

export omz update