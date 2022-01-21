if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim="nvim"
alias icat="kitty +kitten icat"
alias kdiff="kitty +kitten diff"

set fish_greeting

function fish_title
    echo $0
end

starship init fish | source
