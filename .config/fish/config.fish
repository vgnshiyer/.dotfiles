#
# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# A smart and user-friendly command line

# add homebrew to path
eval (/opt/homebrew/bin/brew shellenv)

starship init fish | source # https://starship.rs/
zoxide init fish | source # https://github.com/ajeetdsouza/zoxide
fzf --fish | source # https://github.com/junegunn/fzf

set -U fish_greeting # disable fish greeting
set -Ux FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -Ux FZF_DEFAULT_OPTS "--reverse"
