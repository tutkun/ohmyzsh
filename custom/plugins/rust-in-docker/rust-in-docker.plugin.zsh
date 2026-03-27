# alias cargo="docker run --rm -it -v $(pwd):/app -w /app rust:latest cargo"
# alias rustc="docker run --rm -it -v $(pwd):/app -w /app rust:latest rustc"
# alias rustup="docker run --rm -it -v $(pwd):/app -w /app rust:latest rustup"
# alias rust-doc="docker run --rm -it -v $(pwd):/app -w /app rust:latest rust-doc"

# Rust için `cargo` aracını Docker içinde kullandırır:
cargo() {
  # Projenin root path'ini git ile bul ya da pwd kullan:
  local root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)

  docker run --rm -it \
    -v "$root:/app" \
    -w "/app/${PWD#$root/}" \
    \
    -v $(basename $root)-cargo-cache:/usr/local/cargo/registry \
    -v $(basename $root)-cargo-git-cache:/usr/local/cargo/git \
    -v $(basename $root)-target-cache:/app/target \
    \
    rust:latest cargo "$@"
}



# Rust için `rustc` aracını Docker içinde kullandırır:
rustc() {
  # Projenin root path'ini git ile bul ya da pwd kullan:
  local root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)

  # relative path üret:
  local rel="${PWD#$root}"
  # baştaki / işaretini kaldır ki proje dizinine relative yol tekrar eklenmesin
  rel="${rel#/}"

  docker run --rm -it \
    -v "$root:/app" \
    -w "/app/$rel" \
    \
    -v $(basename $root)-cargo-cache:/usr/local/cargo/registry \
    -v $(basename $root)-cargo-git-cache:/usr/local/cargo/git \
    -v $(basename $root)-target-cache:/app/target \
    \
    rust:latest rustc "$@"
}



# Rust için `rustup` aracını Docker içinde kullandırır:
rustup() {
  # Projenin root path'ini git ile bul ya da pwd kullan:
  local root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)

  docker run --rm -it \
    -v "$root:/app" \
    -w "/app/${PWD#$root/}" \
    \
    -v $(basename $root)-cargo-cache:/usr/local/cargo/registry \
    -v $(basename $root)-cargo-git-cache:/usr/local/cargo/git \
    -v $(basename $root)-target-cache:/app/target \
    \
    rust:latest rustup "$@"
}



# Rust için `rust-doc` aracını Docker içinde kullandırır:
rust-doc() {
  # Projenin root path'ini git ile bul ya da pwd kullan:
  local root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)

  docker run --rm -it \
    -w "/app/${PWD#$root/}" \
    -v "$root:/app" \
    \
    -v $(basename $root)-cargo-cache:/usr/local/cargo/registry \
    -v $(basename $root)-cargo-git-cache:/usr/local/cargo/git \
    -v $(basename $root)-target-cache:/app/target \
    \
    rust:latest rust-doc "$@"
}
