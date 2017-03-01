# Rust aliases
rust-create () {
    local name=$1
    local description=${2:-""}

    # Get and clear the repo.
    quiet clone rust-bare "rust-$name"
    rimraf .git README.md

    # Insert name and description.
    replace "project-name" "$name" Cargo.toml README.in.md src/lib.rs .travis.yml
    replace "project-description" "$description" Cargo.toml README.in.md src/lib.rs

    # Move template files to final locations.
    mv -f README.in.md README.md

    # Go!
    quiet git init
    ls
}

rall () {
    rustup run stable $*
    rustup run beta $*
    rustup run nightly $*
}

alias cr='cargo run';
alias cre='cargo run --example';
alias cb='cargo build';
alias ct='cargo test';
alias cbr='cargo build --release';
alias c='cargo';
