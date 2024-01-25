# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

# webOS TV için SDK yapılandırmaları
export LG_WEBOS_TV_SDK_HOME="${HOME}/webOS_TV_SDK"

if [ -d "$LG_WEBOS_TV_SDK_HOME/CLI/bin" ]; then
  # echo "\n\e[31mUYARI:\e[m" "\t\e[31m$1\e[m \e[32mdizini zaten mevcut. Bu işlem dizindeki verileri korumak için durduruldu.\e[m\n" "\t\e[34m$DIR/\e[31m$1\e[m\e[m\n"
  # Setting the WEBOS_CLI_TV variable to the bin directory of CLI
  export WEBOS_CLI_TV="$LG_WEBOS_TV_SDK_HOME/CLI/bin"
  # Adding the bin directory of CLI to the PATH variable
  export PATH="$PATH:$WEBOS_CLI_TV"
fi
