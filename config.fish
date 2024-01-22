set fish_greeting
function fish_mode_prompt
end

set -g theme_display_rw no
set -g theme_display_group no
set -g theme_display_time yes

if status is-interactive
and not set -q TMUX
    exec tmux
end

set -U fish_key_bindings fish_default_key_bindings

export PATH="$PATH:/home/taytek/.local/share/nvm/v18.10.0/bin:/home/taytek/CEdev/bin:/sbin"

bind '[1;2D' backward-word
bind '[1;2C' forward-word
