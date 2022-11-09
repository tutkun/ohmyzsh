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

# Helper Functions:
