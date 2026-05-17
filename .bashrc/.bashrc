#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export PATH="$HOME/bin:$PATH"

eval "$(starship init bash)"

alias neofetch='neofetch --source ~/.config/neofetch/current-art.txt'

# Remove/add padding when opening/closing neovim
nvim() {
    kitty @ set-spacing padding=0
    command nvim "$@"
    kitty @ set-spacing padding=20
}

neofetch
eval "$(pyenv virtualenv-init -)"
