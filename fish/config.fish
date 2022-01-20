if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim="nvim"
alias icat="kitty +kitten icat"

set fish_greeting

function fish_title
    echo $_
end

starship init fish | source
