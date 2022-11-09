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

# MY THEMES:
ZSH_THEME="agnoster" # arkaplanı renkli satır
ZSH_THEME="amuse" # ~/path on  master! ⌚ 14:21:59
ZSH_THEME="wedisagree" # [~/path] <--sol---||||---sağ--> 14:22:41  ☁  master ☂ ✭
ZSH_THEME="suvash" # ╭─tutkun at MacBook-Pro in ~/.oh-my-zsh on master!
ZSH_THEME="sunrise" # --- ~/.oh-my-zsh ‹master* ?› » 
ZSH_THEME="norm" # λ MacBook-Pro .oh-my-zsh → λ git master* →
ZSH_THEME="strug" # ╭─tutkun@MacBook-Pro in ~/.oh-my-zsh on master ✘ (origin/master -77)
ZSH_THEME="jnrowe" # Ξ ~/.oh-my-zsh git:(master) ▶ 
ZSH_THEME="nebirhos" # @MacBook-Pro ➜ .oh-my-zsh git:(master) ✗ 

# MY PLUGINS:
plugins=(
    git 
    alias-finder 
    colorize 
    command-not-found 
    compleat 
    common-aliases 
    themes 
    create-nextjs-app 
    asdf 
)

# Android Studio için JAVA_HME tanımlaması:
# export JAVA_HOME="/usr/libexec/java_home"

# ASFD Eklentisi için Hombrew ile kuruldu
source /usr/local/opt/asdf/libexec/asdf.sh

# Python3
export PATH="$PATH:$HOME/Library/Python/3.8/bin"

# Flutter SDK Yolunu Belirtiyoruz:
export PATH="$PATH:$HOME/flutter-sdk/bin:$HOME/.pub-cache/bin"

# brew node@16
export PATH="$PATH:/usr/local/opt/node@16/bin"

# Visual Studio Code (code)
export PATH="$PATH:/Applications/Code.app/Contents/Resources/app/bin"

# flutter create --org com.newcompany --project-name newproject .
alias flutter-new-app="flutter create --org com.tutkuns --project-name "

# HELPER FUNCTIONS:
# =================
