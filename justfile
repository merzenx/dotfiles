DOTFILES_DIR := `pwd`

tmux:
    ln -sfn {{DOTFILES_DIR}}/.tmux.conf ~/.tmux.conf

tools:
    curl -s https://ohmyposh.dev/install.sh | bash -s
    sudo pacman -S lazygit github-cli neovim vim keyd yay paru flatpak

keyd:
    sudo mkdir -p /etc/keyd
    sudo ln -sfn {{DOTFILES_DIR}}/etc/keyd/default.conf /etc/keyd/default.conf

fish:
    ln -sfn {{DOTFILES_DIR}}/fish ~/.config/fish

nvim:
    ln -sfn {{DOTFILES_DIR}}/nvim ~/.config/nvim

hypr:
    ln -sfn {{DOTFILES_DIR}}/hypr ~/.config/hypr

kitty:
    ln -sfn {{DOTFILES_DIR}}/kitty ~/.config/kitty

lazygit:
    ln -sfn {{DOTFILES_DIR}}/lazygit ~/.config/lazygit

opencode:
    ln -sfn {{DOTFILES_DIR}}/opencode ~/.config/opencode

mark:
    ln -sfn {{DOTFILES_DIR}}/.mark ~/.mark

niri:
    ln -sfn {{DOTFILES_DIR}}/niri ~/.config/niri

link: tmux fish nvim hypr kitty lazygit mark keyd opencode niri

install: link
