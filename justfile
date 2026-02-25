DOTFILES_DIR := `pwd`

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
link: fish nvim hypr kitty tmux lazygit mark
