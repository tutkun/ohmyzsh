# yetki karmaşası olmasın diye önbellek klasörleri ekleniyor:
# mkdir -p \
#   $HOME/.npm \
#   $HOME/.yarn \
#   $HOME/.bun \
#   $HOME/.cache/pip \
#   $HOME/.cache/go-build \
#   $HOME/.cargo/registry \
#   $HOME/.cargo/git \
#   $HOME/.go/pkg \
#   $HOME/.m2 \
#   $HOME/.gradle/caches \
#   $HOME/.nuget/packages \
#   $HOME/.pub-cache \
#   $HOME/.gem \
#   $HOME/.bundle \
#   $HOME/.aws \
#   $HOME/.android \
#   $HOME/.tizen \
#   $HOME/.webos \
#   $HOME/.sdb \
#   $HOME/.local/bin \
#   $HOME/.local-dbs/{postgres,mysql,redis}

# VSCode'u kandırmak için sahte executable files (Shims)
export PATH="$HOME/.local/bin:$PATH"

function _serviceName () {
  local name=$1;
  echo "⚠️ ${(C)name}, docker üzerinde çalıştırılıyor!";
  echo "###########################################";
  echo "";
}

# Ollama'yı ayağa kaldırır
function ollama-run() { docker run -d -v $HOME/Developer/self-hosted/ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama; }
function ollama() { _serviceName $0; docker exec -it ollama ollama "$@"; }


# ==============================================================================
# 🛠️ DOCKER CLI WRAPPER (ÇEKİRDEK FONKSİYON)
# Bu fonksiyon DRY (Don't Repeat Yourself) prensibi için yazılmıştır.
# Tüm araçlar bu çekirdek üzerinden ayağa kalkar, TTY ve Host ayarlarını otomatik alır.
# ==============================================================================
function _drun() {
  command -v docker >/dev/null 2>&1 || {
    echo "Docker bulunamadı. Colima çalışmıyor olabilir."
    return 1
  }

  local image="$1"
  shift # Sadece imaj adını atlıyoruz. Kalanlar: [Docker Parametreleri] -- [Konteyner Komutları]

  # Docker parametrelerini ayıklamak için boş bir dizi oluştur
  local docker_params=()

  # Argümanlar arasında '--' görene kadar hepsini docker_params içine al
  while [ $# -gt 0 ] && [ "$1" != "--" ]; do
    docker_params+=("$1")
    shift
  done

  # '--' işaretini atla
  if [ $# -gt 0 ] && [ "$1" = "--" ]; then
    shift
  fi

  # Etkileşimli (Terminal) mi, yoksa Pipe (|) mı kullanılıyor kontrolü
  local tty_opts="-i"
  if [ -t 0 ] && [ -t 1 ]; then
    tty_opts="-it"
  fi

  # Eğer komut girilmemişse varsayılan olarak 'sh' çalıştır
  if [ $# -eq 0 ]; then
    set -- sh
  fi

  # Komutu derle ve çalıştır
  docker run ${tty_opts} --rm \
    --user "$(id -u):$(id -g)" \
    --add-host="host.docker.internal:host-gateway" \
    "${docker_params[@]}" \
    "$image" "$@";
}


# ==========================================
# 🟢 JAVASCRIPT & TYPESCRIPT (.npm, .yarn, .bun, .expo, .nuxt)
# ==========================================
# function node() { _serviceName $0; _drun "node:${NODE_VERSION:-alpine}" -v $HOME/.npm:/.npm -e npm_config_cache=/.npm node "$@"; }
# function npm()  { _serviceName $0; _drun "node:${NODE_VERSION:-alpine}" -v $HOME/.npm:/.npm -e npm_config_cache=/.npm npm "$@"; }
# function npx()  { _serviceName $0; _drun "node:${NODE_VERSION:-alpine}" -v $HOME/.npm:/.npm -e npm_config_cache=/.npm npx "$@"; }
function bun()  {
  _serviceName $0;

  # Klasörlerin Docker tarafından root yetkisiyle oluşturulmasını engelle
  local DOCKER_HOME_DIR="$HOME/.docker-bun"
  mkdir -p "$DOCKER_HOME_DIR"
  chown -R $(id -u):$(id -g) "$DOCKER_HOME_DIR"

  local args=(
    -e "HOME=/bun-home"
    -e "BUN_INSTALL=/bun-home/.bun"

    -v "$DOCKER_HOME_DIR:/bun-home"

    # bun run dev için
    -e "HOST=0.0.0.0"
    -p "3000:3000"
    # Vite/Nuxt bazen HMR için rastgele port seçebilir,
    # veya 24678 portunu kullanabilir. Eğer üstteki config yetmezse:
    -p "24678:24678"

    -v "$(pwd):/app"
    -w /app
  )

  # Çağrı yapısı: _drun [İmaj] [Docker Parametreleri] -- [Konteynerin İçinde Çalışacak Komut]
  _drun "oven/bun:latest" "${args[@]}" -- bun "$@"
}


# ==========================================
# 🟡 PYTHON & PIP
# ==========================================
# function python() {
#   _serviceName $0;
#   local cmd="python"
#   [ -f ".venv/bin/python" ] && cmd="/app/.venv/bin/python"
#   _drun "python:${PYTHON_VERSION:-3.12}" "-v $HOME/.cache/pip:/.cache/pip -e PYTHONDONTWRITEBYTECODE=1 -e PYTHONUNBUFFERED=1 -e HOME=/tmp -e PYTHONUSERBASE=/tmp -e XDG_CACHE_HOME=/.cache" $cmd "$@"
# }
# function pip() {
#   _serviceName $0;
#   if [ ! -d ".venv" ]; then
#     echo "⚠️ .venv klasörü bulunamadı! Sizin için otomatik oluşturuluyor..."
#     _drun "python:${PYTHON_VERSION:-3.12}" "-e HOME=/tmp" python -m venv .venv
#   fi
#   _drun "python:${PYTHON_VERSION:-3.12}" "-v $HOME/.cache/pip:/.cache/pip -e HOME=/tmp -e PYTHONUSERBASE=/tmp -e XDG_CACHE_HOME=/.cache" /app/.venv/bin/pip "$@"
# }


# ==========================================
# 🦀 RUST & CARGO
# ==========================================
# function cargo() { _serviceName $0; _drun "rust:${RUST_VERSION:-latest}" "-v $HOME/.cargo/registry:/usr/local/cargo/registry -v $HOME/.cargo/git:/usr/local/cargo/git" cargo "$@"; }
# function rustc() { _serviceName $0; _drun "rust:${RUST_VERSION:-latest}" "" rustc "$@"; }


# ==========================================
# 🔵 GOLANG (Go)
# ==========================================
# function go() {
#   _serviceName $0; _drun "golang:${GO_VERSION:-alpine}" "-v $HOME/.go/pkg:/go/pkg -v $HOME/.cache/go-build:/.cache/go-build -e GOCACHE=/.cache/go-build -e GOPATH=/go" go "$@";
# }


# ==========================================
# 🔵 .NET & C# (.dotnet, .nuget, .aspnet)
# ==========================================
# function dotnet() {
#   _serviceName $0; _drun "mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION:-8.0}" "-v $HOME/.nuget/packages:/.nuget/packages -e NUGET_PACKAGES=/.nuget/packages" dotnet "$@";
# }


# ==========================================
# 🔴 JAVA, MAVEN, GRADLE
# ==========================================
# function java()   { _serviceName $0; _drun "eclipse-temurin:${JAVA_VERSION:-21-jre-alpine}" "" java "$@"; }
# function mvn()    { _serviceName $0; _drun "maven:3-eclipse-temurin-21-alpine" "-v $HOME/.m2:/var/maven/.m2 -e MAVEN_CONFIG=/var/maven/.m2 -e MAVEN_OPTS=-Duser.home=/var/maven" mvn "$@"; }
# function gradle() { _serviceName $0; _drun "gradle:jdk21-alpine" "-v $HOME/.gradle:/home/gradle/.gradle -e GRADLE_USER_HOME=/home/gradle/.gradle" gradle "$@"; }


# ==========================================
# 💎 RUBY & iOS CI/CD (.gem, .bundle, .fastlane, .cocoapods)
# ==========================================
# function ruby() { _serviceName $0; _drun "ruby:3.3-alpine" "-v $HOME/.gem:/.gem -v $HOME/.bundle:/.bundle -e GEM_HOME=/.gem -e BUNDLE_PATH=/.bundle" ruby "$@"; }
# function gem() { ruby -S gem "$@"; }
# function bundle() { ruby -S bundle "$@"; }
# function fastlane() { ruby -S fastlane "$@"; }


# ==========================================
# 📱 FLUTTER & DART (.dart, .pub-cache, .flutter-devtools)
# ==========================================
# Not: Flutter SDK boyutu büyüktür, CirrusLabs'ın resmi imajını kullanıyoruz.
# function flutter() { _serviceName $0; _drun "ghcr.io/cirruslabs/flutter:${FLUTTER_VERSION:-stable}" "-v $HOME/.pub-cache:/.pub-cache -e PUB_CACHE=/.pub-cache" flutter "$@"; }
# function dart() { flutter dart; }


# ==========================================
# ☁️ DEVOPS & CLOUD (.aws)
# ==========================================
# function aws() { _serviceName $0; _drun "amazon/aws-cli:latest" "-v $HOME/.aws:/root/.aws" aws "$@"; }


# ==========================================
# 🗄️ VERİTABANI YÖNETİMİ (Daemon Servisleri)
# ==========================================
# function pg-start() {
#   _serviceName $0;
#   docker run -d --rm --name postgres -p 5432:5432 \
#     -v "$HOME/.local-dbs/postgres:/var/lib/postgresql" \
#     -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-postgres} -e POSTGRES_USER=${POSTGRES_USER:-postgres} \
#     postgres:${POSTGRES_VERSION:-alpine}

#   echo "🐘 PostgreSQL (5432) başlatıldı."
# }
# function pg-stop() { docker stop postgres; echo "🛑 PostgreSQL durduruldu."; }
# function psql()    { docker run -it --rm --add-host="host.docker.internal:host-gateway" postgres:${POSTGRES_VERSION:-alpine} psql -h host.docker.internal -U postgres "$@"; }

# function redis-start() {
#   _serviceName $0;
#   docker run -d --rm --name redis -p 6379:6379 \
#     -v "$HOME/.local-dbs/redis:/data" \
#     redis:${REDIS_VERSION:-alpine} redis-server --appendonly yes
#   echo "🔴 Redis (6379) başlatıldı."
# }
# function redis-stop() { _serviceName $0; docker stop redis; echo "🛑 Redis durduruldu."; }
# function redis-cli()  { _serviceName $0; docker run -it --rm --add-host="host.docker.internal:host-gateway" redis:alpine redis-cli -h host.docker.internal "$@"; }



# ==========================================
# 📺 MOBILE & SMART TV (.android, .sdb, .tizen, .webos)
# DİKKAT: USB cihazlarına (Telefon/TV) erişim gerektirdiği için 
# bu fonksiyonlarda --privileged ve USB mapping kullanılmalıdır.
# ==========================================

# ADB (Android Debug Bridge)
# function adb() {
#   _serviceName $0;
#   docker run -it --rm --privileged \
#     -v /dev/bus/usb:/dev/bus/usb \
#     -v "$HOME/.android:/root/.android" \
#     -v "$(pwd):/app" -w /app \
#     sorccu/adb "$@"
# }

# SDB (Samsung Tizen Smart Development Bridge)
# Tizen ve WebOS CLI genelde standart bir Node veya Ubuntu ortamı ister.
# function sdb() {
#   _serviceName $0;
#   docker run -it --rm --privileged \
#     -v /dev/bus/usb:/dev/bus/usb \
#     -v "$HOME/.sdb:/root/.sdb" \
#     -v "$HOME/.tizen:/root/.tizen" \
#     -v "$(pwd):/app" -w /app \
#     ubuntu:22.04 sdb "$@" # (Not: Özel bir Tizen CLI imajı build etmeniz gerekebilir)
# }

# WebOS CLI (LG TV) (Ares)
# function ares() { _serviceName $0; _drun "node:${NODE_VERSION:alpine}" "-v $HOME/.webos:/root/.webos -v $HOME/.ssh:/root/.ssh" ares "$@"; }


# neofetch --colors 1 1 0 1 1 --shell_version off --cpu_speed off --bold off --ascii_bold on --ascii_distro pardus --ascii_colors 0
