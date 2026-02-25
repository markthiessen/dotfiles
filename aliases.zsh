# Directories
alias dotfiles="cd $DOTFILES"

# Better defaults (if installed)
if (( $+commands[eza] )); then
    alias ls="eza"
    alias ll="eza -la --git --icons"
    alias lt="eza -la --tree --level=2"
    alias tree="eza --tree"
fi
(( $+commands[bat] )) && alias cat="bat --paging=never"

# Quick navigation
alias ..="cd .."
alias ...="cd ../.."

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias nwatch="npm run watch"

# Python
alias pip=pip3
