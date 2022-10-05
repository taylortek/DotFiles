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
