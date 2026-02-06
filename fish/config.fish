source /usr/share/cachyos-fish-config/cachyos-config.fish
source ~/dotfiles/fish/functions.fish 

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opencode
fish_add_path /home/mark/.opencode/bin
