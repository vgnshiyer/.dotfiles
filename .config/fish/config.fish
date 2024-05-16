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
fzf --fish | source

set -U fish_greeting # disable fish greeting

# show randow pokemon
set ppid (ps -o ppid= -p $fish_pid)
set parent (ps -o comm= -p $ppid)

if not string match -rq fzf $parent
    pokemon-colorscripts -r && neofetch
end

# Aliases
alias nv nvim
