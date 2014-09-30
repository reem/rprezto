# Rust aliases
rust-create () {
    git clone https://github.com/reem/rust-bare "rust-$1" && scd "rust-$1"
    rm -rf .git README.md && sed -i '' "s/project-name/$1/g" Cargo.toml
    git init
}

# Must be run as sudo
rustup () { curlish https://static.rust-lang.org/rustup.sh bash }

