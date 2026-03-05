#! /bin/bash

ln -s ~/dotfiles/.zshrc ~/
mkdir -p ~/.config/nvim/lua/custom/plugins
ln -sf ~/dotfiles/nvim/lua/custom/plugins/my-plugins.lua ~/.config/nvim/lua/custom/plugins/
ln -sf ~/dotfiles/nvim/lua/custom/plugins/tree-nvim.lua ~/.config/nvim/lua/custom/plugins/
ln -sf ~/dotfiles/nvim/lua/custom/plugins/init.lua ~/.config/nvim/lua/custom/plugins/
ln -sf ~/dotfiles/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json
ln -s ~/dotfiles/.config/wezterm ~/.config
