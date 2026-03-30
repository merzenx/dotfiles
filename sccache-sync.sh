setup-rust-sccache() {
    if command -v sccache >/dev/null 2>&1; then
        export RUSTC_WRAPPER=$(command -v sccache)
        export SCCACHE_DIR="$HOME/.cache/sccache"
        export SCCACHE_CACHE_SIZE="5G"
        
        [ ! -d "$SCCACHE_DIR" ] && mkdir -p "$SCCACHE_DIR"

        CARGO_CONFIG="$HOME/.cargo/config.toml"
        [ ! -d "$HOME/.cargo" ] && mkdir -p "$HOME/.cargo"

        if [ ! -f "$CARGO_CONFIG" ] || ! grep -q "rustc-wrapper" "$CARGO_CONFIG"; then
            echo "🔧 Configuring Cargo to use sccache..."
            cat >> "$CARGO_CONFIG" <<EOF

[build]
rustc-wrapper = "$(command -v sccache)"
EOF
            echo "✅ Cargo config updated."
        fi
    else
        echo "⚠️ sccache not found. Please install it first (e.g., cargo install sccache)"
    fi
}
