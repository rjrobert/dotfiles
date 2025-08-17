if status is-interactive
    # Commands to run in interactive sessions can go here
end

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

abbr --add ls lsd
abbr --add ll lsd -lA

set --export --prepend PATH $HOME/.cargo/bin
set --export --prepend PATH $HOME/.local/bin
set --export --prepend PATH $HOME/.ghcup/bin

set --export --prepend PATH $HOME/go/bin
set --export HOMEBREW_NO_ENV_HINTS 1
set --export EDITOR /opt/homebrew/bin/nvim

alias vim="nvim"
alias kvim="NVIM_APPNAME=kvim nvim"

fzf --fish | source
zoxide init fish | source

function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience
