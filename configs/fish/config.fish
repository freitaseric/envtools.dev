set fish_greeting ""

set -gx TERM xterm-256color

if status is-interactive
  starship init fish | source
end

set -gx PATH "$HOME/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH

source "$(dirname (status --current-filename))/aliases.fish"