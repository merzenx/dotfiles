function j
    just $argv
end

function hx
    helix $argv
end

function t
    tmux $argv
end

function ta
    tmux a
end

function gm
    git commit -m $argv
end

function cg
    cargo $argv
end

function gstart
    set branch_name $argv[1]
    if test -z "$branch_name"
        echo "Error: Please specify a branch name. Usage: gstart <branch-name>"
        return 1
    end

    git checkout main
    git pull origin main
    git checkout -b $branch_name
end


function gsync
    set current_branch (git branch --show-current)
    if test "$current_branch" = "main"
        echo "You are already on main. Running git pull..."
        git pull origin main
        return
    end

    git fetch origin main
    if git rebase origin/main
        echo "Success: $current_branch is now rebased onto main (Linear History)."
    else
        echo "Error: Conflict detected. Please resolve conflicts and run 'git rebase --continue'."
    end
end

function gdone
    set branch_name (git branch --show-current)
    
    if test "$branch_name" = "main"
        echo "Updating main..."
        git pull origin main
        return
    end

    git checkout main
    git pull origin main
    
    if git branch -d $branch_name
        echo "Success: Branch '$branch_name' deleted locally."
    else
        echo "Warning: Branch '$branch_name' not fully merged. Use 'git branch -D' to force delete."
    end
end

# eza functions
function ls; eza -al --color=always --group-directories-first --icons --git $argv; end
function la; eza -a --color=always --group-directories-first --icons --git $argv; end
function ll; eza -l --color=always --group-directories-first --icons $argv; end
function lt; eza -aT --color=always --group-directories-first --icons $argv; end
function l.; eza -a $argv | grep -e '^\.'; end

function fe -d "Fuzzy search files and list with eza"
    fd --type f --strip-cwd-prefix --hidden --exclude .git | fzf --preview 'eza -l --color=always --icons {}'
end

function z; __zoxide_z $argv; end
function zi; __zoxide_zi $argv; end


# --- Rust & sccache Configuration (Fish version) ---

function setup-rust-sccache
    if type -q sccache
        set -gx RUSTC_WRAPPER (type -p sccache)
        set -gx SCCACHE_DIR "$HOME/.cache/sccache"
        set -gx SCCACHE_CACHE_SIZE "5G"

        if not test -d "$SCCACHE_DIR"
            mkdir -p "$SCCACHE_DIR"
        end

        set -l CARGO_CONFIG "$HOME/.cargo/config.toml"
        if not test -d "$HOME/.cargo"
            mkdir -p "$HOME/.cargo"
        end

        if not test -f "$CARGO_CONFIG"; or not grep -q "rustc-wrapper" "$CARGO_CONFIG"
            echo "🔧 Configuring Cargo to use sccache..."
            printf "\n[build]\nrustc-wrapper = \"%s\"\n" (type -p sccache) >> "$CARGO_CONFIG"
            echo "✅ Cargo config updated."
        end
    else
        echo "⚠️ sccache not found. Install it via: cargo install sccache"
    end
end

# setup-rust-sccache

# --- Rclone Sync Functions ---

function rust-cache-pull
    set -l cache_zip "/tmp/sccache_backup.7z"

    echo "🔄 Downloading zipped cache from cloud..."
    rclone copy "gdrive:rust_cache/sccache_backup.7z" "/tmp/" --progress

    if test -f $cache_zip
        echo "📂 Unzipping cache to $SCCACHE_DIR..."

        rm -rf "$SCCACHE_DIR/*"
        7z x $cache_zip -o"$SCCACHE_DIR" -y >/dev/null

        echo "✅ Pull and Install complete."
        rm -f $cache_zip
    else
        echo "❌ Error: Cache file not found on cloud."
    end
end

function rust-cache-push
    set -l cache_zip "/tmp/sccache_backup.7z"

    if mountpoint -q "$SCCACHE_DIR"
        echo "⚠️ Found rclone mount. Unmounting..."
        fusermount -u "$SCCACHE_DIR"; or sudo umount -l "$SCCACHE_DIR"
    end

    echo "🛑 Stopping sccache server..."
    sccache --stop-server >/dev/null 2>&1

    echo "📦 Compressing cache with 7z..."

    rm -f $cache_zip
    7z a $cache_zip "$SCCACHE_DIR/*" -mx1

    echo "🚀 Uploading zipped cache to cloud..."
    rclone copy $cache_zip "gdrive:rust_cache/" --progress

    echo "✅ Push complete. sccache is safely stored."
    
    sccache --start-server >/dev/null 2>&1
end

abbr -a rs-stat 'sccache --show-stats'
