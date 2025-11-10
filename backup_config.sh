#!/bin/bash

# Remove old backup configuration files and create new ones.
# Leave some things untouched as i dont update them as often anymore

TARGET_DIR="$HOME/.config/.config-mirror/"

rm -f $TARGET_DIR/starship.toml
cp ~/.config/starship.toml $TARGET_DIR

rm -f $TARGET_DIR/.zshrc
cp $HOME/.zshrc $TARGET_DIR

rm -f $TARGET_DIR/.tmux.conf
cp $HOME/.tmux.conf $TARGET_DIR

rm -rf $TARGET_DIR/yabai
cp -r $HOME/.config/yabai $TARGET_DIR
rm -rf $TARGET_DIR/ghostty
cp -r $HOME/.config/ghostty $TARGET_DIR
