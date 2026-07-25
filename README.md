# dotfiles
clone this repo and do this:
ln -s path/dotfiles/i3 path/dotfiles/nvim ~/.config

path is where you cloned this repo.
that command will create a shortcut of i3 and nvim into your .config file.

To add vi keybinding to fish create this file:
~/.config/fish/functions/fish_user_key_bindings.fish
and add this function inside it:
function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert -m default jk backward-char force-repaint
end
