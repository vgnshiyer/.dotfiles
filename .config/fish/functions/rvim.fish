# Recommended actions:
# 1. Create a keypair
# 2. Add the public key to the remove machine

function rvim
    set -l user $argv[1]
    set -l host $argv[2]
    if test -z "$user"; or test -z "$host"
        echo "Usage: rvim <user> <hostname>"
        return 1
    end

    set -l file (ssh $user@$host "find /home/svcenomis /srv -type f" | fzf --no-preview)
    if test -z "$file"
        echo "No file selected"
        return 1
    end

    nv scp://$user@$host///$file
end
