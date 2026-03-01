DOTFILES_DIR := `pwd`

tools:
    curl -s https://ohmyposh.dev/install.sh | bash -s
    sudo pacman -S lazygit github-cli neovim vim keyd yay paru flatpak

keyd:
    ln -sfn {{DOTFILES_DIR}}/etc/keyd/default.conf /etc/keyd/default.conf

fish:
    ln -sfn {{DOTFILES_DIR}}/fish ~/.config/fish

nvim:
    ln -sfn {{DOTFILES_DIR}}/nvim ~/.config/nvim

hypr:
    ln -sfn {{DOTFILES_DIR}}/hypr ~/.config/hypr

kitty:
    ln -sfn {{DOTFILES_DIR}}/kitty ~/.config/kitty

tmux:
    ln -sfn {{DOTFILES_DIR}}/.tmux.conf ~/.tmux.conf

lazygit:
    ln -sfn {{DOTFILES_DIR}}/lazygit ~/.config/lazygit

mark:
    ln -sfn {{DOTFILES_DIR}}/.mark ~/.mark

# Link all configs
link: fish nvim hypr kitty tmux lazygit mark keyd
