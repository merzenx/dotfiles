source /usr/share/cachyos-fish-config/cachyos-config.fish


# opencode
fish_add_path /home/mark/.opencode/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/mark/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# npm
set -gx PATH (npm config get prefix)/bin $PATH
