source (dirname (status filename))/functions/alias.fish
source (dirname (status filename))/functions/zoxide.fish

# opencode
fish_add_path $HOME/.opencode/bin

set -U fish_greeting ""

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# npm
set -gx PATH (npm config get prefix)/bin $PATH

#oh my posh
~/.local/bin/oh-my-posh init fish --config $HOME/dotfiles/mark.omp.json | source

set -U fish_user_paths ~/.cargo/bin $fish_user_paths

fastfetch

set -g fish_ambiguous_width 1
set -g fish_emoji_width 2

# zoxide init fish | source  # disabled: uses 'alias' incompatible with this fish version
