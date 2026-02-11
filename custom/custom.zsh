# .NET için telemetri takibini önle:
DOTNET_CLI_TELEMETRY_OPTOUT=true

# You may need to manually set your language environment
export LANG=tr_TR.UTF-8
export LC_ALL=tr_TR.UTF-8

# eval "$(/opt/homebrew/bin/brew shellenv)"

# If you come from bash you might have to change your $PATH.
# export PATH=$PATH:/usr/local/bin:$HOME/bin:$HOME/.local/bin
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH:$HOME/bin:/usr/local/bin

# Bu Proje kurulum dizinidir!
#! Bunu ~/.zshrc içerisinde ayarlanmalısın!
# export ZSH="$HOME/Developer/ohmyzsh"

# Seçili tema:
ZSH_THEME="fino-time"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Rastgele tema seçimini şunların içinden yap:
ZSH_THEME_RANDOM_CANDIDATES=(
  "amuse"           # ~/path on  master! ⌚ 17:56:06
  "suvash"          # tutkun at MacBook-Pro in ~/.oh-my-zsh on master! using system: ruby 2.6.10p210
  "norm"            # λ macOS-M2 ohmyzsh → λ git master* →
  "strug"           # ╭─tutkun@macOS-M2 in ~/Developer/ohmyzsh on master ✘ (origin/master)
  "mira"            # set by `omz`
  "fino-time"       # :love:
  "agnoster"        #
  "avit"            #
  "af-magic"        #
  "bira"            #
  "daveverwer"      #
  "mikeh"           #
  "robbyrussell"    #
)

# Otomatik güncelleme davranışını değiştirmek için aşağıdaki satırlardan birinin yorumunu kaldırın
# zstyle ':omz:update' mode disabled  # otomatik güncelleme devre dışı
# zstyle ':omz:update' mode auto      # sormadan otomatik güncelle
zstyle ':omz:update' mode reminder    # zamanı geldiğinde güncellemek için sor

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Otomatik tamamlama beklenirken görülecek:
# COMPLETION_WAITING_DOTS="true"
COMPLETION_WAITING_DOTS="%F{yellow} biraz bekleyin...%f"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM="$ZSH/other-custom-directory"

# $ZSH/plugins/ ve $ZSH_CUSTOM/plugins/
#! plugins ~/.zshrc içinde çalışır:
# plugins=( git )

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# ============================================================
#! USER CONFIGURATIONS:
# ============================================================

# Terminal'deki Güzel Tema:
eval "$(starship init zsh)"

# export MANPATH="/usr/local/man:$MANPATH"

# Python pyenv shims:
export PATH=$(pyenv root)/shims:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export PATH="$HOME/.bun/bin:$PATH"

#! Gelistiricilere ozel kutuphane SdkMan!
# Java versiyonu ayarlama komutu: "sdk home java 17.0.10-jbr"
# Java versiyonlarini listeleme: "sdk list"
export JAVA_HOME=$HOME/.sdkman/candidates/java/current

# Android SDK Yolunu Belirtiyoruz:
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin

# Flutter ve Ruby için gem home ve path tanımlaması:
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/ruby/3.3.0/bin:$PATH

# Flutter SDK Yolunu Belirtiyoruz:
export FLUTTER_ROOT=$HOME/Developer/flutter-sdk
export PATH=$PATH:$FLUTTER_ROOT/bin:$HOME/.pub-cache/bin

# Flutter için Chrome Browser yerine Brave Browser kullanmak istiyoruz:
export CHROME_EXECUTABLE=/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser

# Samsung/Tizen Geliştirme Aracı (Smart Development Bridge) için iterm otomatik tamamlama
if [ -f ~/.sdb/.sdb-completion.bash ]; then
  source ~/.sdb/.sdb-completion.bash
fi

# Visual Studio Code (code)
export VSCODE_EDITOR=/Applications/Code.app/Contents/Resources/app/bin
export REACT_EDITOR="code"
export PATH=$PATH:$VSCODE_EDITOR

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PATH=~/.console-ninja/.bin:$PATH

# ========================================================
#! HELPER FUNCTIONS:
# ========================================================

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

# Bun using
export PATH="$HOME/.bun/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
