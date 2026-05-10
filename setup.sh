#!/usr/bin/env bash
stow .

# Install TPM and tmux plugins
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
echo "Installing tmux plugins..."
~/.tmux/plugins/tpm/bin/install_plugins
