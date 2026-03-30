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

setup-rust-sccache

rust-cache-pull() {
    echo "🔄 Pulling sccache from cloud..."
    rclone sync "grive_remote:my_rust_cache/sccache" "$SCCACHE_DIR" --progress
    echo "✅ Pull complete."
}

rust-cache-push() {
    echo "🛑 Stopping sccache server..."
    sccache --stop-server >/dev/null 2>&1
    echo "🚀 Syncing sccache to cloud..."
    rclone sync "$SCCACHE_DIR" "grive_remote:my_rust_cache/sccache" --fast-list --progress
    echo "✅ Sync complete."
    sccache --start-server >/dev/null 2>&1
}
