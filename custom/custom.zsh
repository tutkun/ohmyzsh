# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

# ==============================================================================
# USER CONFIGURATIONS:
# ==============================================================================

# .NET için telemetri takibini önle:
DOTNET_CLI_TELEMETRY_OPTOUT=1

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# You may need to manually set your language environment
export LANG=tr_TR.UTF-8
export LC_ALL=tr_TR.UTF-8

# docker'da ollama kullanımı
alias ollama="docker exec -it ollama ollama"

#! Geliştiricilere özel kütüphane SdkMan!
# Java versiyonu ayarlama komutu: "sdk home java 17.0.10-jbr"
# Java versiyonlarini listeleme: "sdk list"
export JAVA_HOME=$HOME/.sdkman/candidates/java/current

# Android SDK Yolunu Belirtiyoruz:
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin

# Flutter ve Ruby için gem home ve path tanımlaması:
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/ruby/3.3.0/bin:$PATH

# Tesseract OCR için:
export CGO_CFLAGS="$(pkg-config --cflags --prefix=/opt/homebrew lept) $(pkg-config --cflags --prefix=/opt/homebrew tesseract)"
export CGO_LDFLAGS="$(pkg-config --libs --prefix=/opt/homebrew lept) $(pkg-config --libs --prefix=/opt/homebrew tesseract)"
# (bunu kaldırırsan varsayılan yoldaki diller yüklenir)
export TESSDATA_PREFIX=/opt/homebrew/Cellar/tesseract/5.5.0/share/tessdata

# Flutter SDK Yolunu Belirtiyoruz:
export FLUTTER_ROOT=$HOME/Developer/flutter-sdk
export PATH=$PATH:$FLUTTER_ROOT/bin:$HOME/.pub-cache/bin

# Flutter için Chrome Browser yerine Brave Browser kullanmak istiyoruz:
export CHROME_EXECUTABLE=/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser

# php@8.2 -> brew install php@8.2
export PATH="/opt/homebrew/opt/php@8.2/bin:$PATH"

# Visual Studio Code (code)
export VSCODE_EDITOR=/Applications/Code.app/Contents/Resources/app/bin
export REACT_EDITOR="code"
export PATH=$PATH:$VSCODE_EDITOR

# Enact.js için gerekli
export PATH="$HOME/.bun/bin:$PATH"

# rust'ın dyld ile c++ kütüphanelerini okuması için gereken PATH:
export LIBCLANG_PATH="$(brew --prefix llvm)/lib"


# ==============================================================================
# Helper Functions:
# ==============================================================================

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="$HOME/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

PATH=~/.console-ninja/.bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
