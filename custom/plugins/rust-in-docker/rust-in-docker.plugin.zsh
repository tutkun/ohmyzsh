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
    \
    -v $(basename $root)-cargo-cache:/usr/local/cargo/registry \
    -v $(basename $root)-cargo-git-cache:/usr/local/cargo/git \
    -v $(basename $root)-target-cache:/app/target \
    \
    -w "/app/${PWD#$root/}" \
    rust:latest cargo "$@"
}



# Rust için `rustc` aracını Docker içinde kullandırır:
rustc() {
  # Projenin root path'ini git ile bul ya da pwd kullan:
  local root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)

  docker run --rm -it \
    -v "$root:/app" \
    \
    -v $(basename $root)-cargo-cache:/usr/local/cargo/registry \
    -v $(basename $root)-cargo-git-cache:/usr/local/cargo/git \
    -v $(basename $root)-target-cache:/app/target \
    \
    -w "/app/${PWD#$root/}" \
    rust:latest rustc "$@"
}



# Rust için `rustup` aracını Docker içinde kullandırır:
rustup() {
  # Projenin root path'ini git ile bul ya da pwd kullan:
  local root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)

  docker run --rm -it \
    -v "$root:/app" \
    \
    -v $(basename $root)-cargo-cache:/usr/local/cargo/registry \
    -v $(basename $root)-cargo-git-cache:/usr/local/cargo/git \
    -v $(basename $root)-target-cache:/app/target \
    \
    -w "/app/${PWD#$root/}" \
    rust:latest rustup "$@"
}



# Rust için `rust-doc` aracını Docker içinde kullandırır:
rust-doc() {
  # Projenin root path'ini git ile bul ya da pwd kullan:
  local root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)

  docker run --rm -it \
    -v "$root:/app" \
    \
    -v $(basename $root)-cargo-cache:/usr/local/cargo/registry \
    -v $(basename $root)-cargo-git-cache:/usr/local/cargo/git \
    -v $(basename $root)-target-cache:/app/target \
    \
    -w "/app/${PWD#$root/}" \
    rust:latest rust-doc "$@"
}
