# Rust aliases
rust-create () {
    local name=$1
    local description=${2:-""}

    # Get and clear the repo.
    quiet clone rust-bare "rust-$name"
    rimraf .git README.md

    # Insert name and description.
    replace "project-name" "$name" Cargo.toml README.in.md
    replace "project-description" "$description" Cargo.toml README.in.md

    # Move template files to final locations.
    mv README.in.md README.md

    # Go!
    quiet git init
    ls
}

# Must be run as sudo
rustup () {
    curlish https://static.rust-lang.org/rustup.sh bash
}

