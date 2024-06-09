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
    pokefetch -r && neofetch
end

# Aliases
alias nv nvim

# Custom cron job to sync second brain in iCloud-Mobile drive
# crontab -l | grep -v sync_sb | begin; cat; echo "0 * * * * /opt/homebrew/bin/fish -c 'sync_sb'"; end | crontab -

## Required for setting up mysql8.0 and python mysqlclient
set -gx PATH /usr/local/mysql/bin $PATH
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib" 
