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

export PATH="$PATH:/home/taytek/.nvm/versions/node/v18.10.0/bin/"
