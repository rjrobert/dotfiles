if status is-interactive
    # Commands to run in interactive sessions can go here
end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/robertball/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

set --export --prepend PATH /Users/robertball/go/bin
set --export --prepend PATH /Users/robertball/.cargo/bin

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

abbr --add ls lsd
abbr --add ll lsd -lA

set --export HOMEBREW_NO_ENV_HINTS 1
set --export EDITOR /opt/homebrew/bin/hx
