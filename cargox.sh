cargo fmt && git somat 'cargo fmt'
cargo clippy --fix --tests --all-features && git somat 'cargo clippy --fix --tests --all-features'
./utils/trailing-whitespace.sh reject ; git somat 'trailing whitespace clipper'
