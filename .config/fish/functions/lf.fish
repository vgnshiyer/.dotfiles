# credits: https://github.com/joshmedeski/dotfiles/blob/main/.config/fish/functions/lfcd.fish

function lf
    set tmp (mktemp)
    lf -last-dir-path=$tmp $argv
    if test -f "$tmp"
        set dir (cat $tmp)
        rm -f $tmp
        if test -d "$dir"
            if test "$dir" != (pwd)
                cd $dir
            end
        end
    end
end
