function zet
    sync_sb
    set zettel_template_dir "$HOME/Documents/second-brain/888-Templates/zettel.md"
    set zettel_dir "$HOME/Documents/second-brain/1-zettelkasten/"
    set zettel_pvt_dir "$HOME/Documents/second-brain/1-zettelkasten-pvt/"
    set inbox_dir "$HOME/Documents/second-brain/0-inbox/"
    set inbox_pvt_dir "$HOME/Documents/second-brain/0-inbox-pvt/"
    set todays_date (date "+%Y-%m-%d_%H-%M-%S")

    set private_mode 0
    set note_name ""

    for arg in $argv
        if test $arg = "--pvt"
            set private_mode 1
        end
    end

    if test -z "$argv[1]"
        set note_name "$todays_date"
    else
        set note_name "$argv[1]"
    end

    set filename_inbox "$inbox_dir/$note_name.md"
    set filename_inbox_pvt "$inbox_pvt_dir/$note_name.md"
    set filename_zettel "$zettel_dir/$note_name.md"
    set filename_zettel_pvt "$zettel_pvt_dir/$note_name.md"

    if test -f $filename_inbox
        echo "File already exists"
        nvim $filename_inbox
    else if test -f $filename_inbox_pvt
        echo "File already exists"
        nvim $filename_inbox_pvt
    else if test -f $filename_zettel
        echo "File already exists"
        nvim $filename_zettel
    else if test -f $filename_zettel_pvt
        echo "file already exists"
        nvim $filename_zettel_pvt
    else
        if test $private_mode -eq 1
            echo "Created on $todays_date" > $filename_inbox_pvt
            cat $zettel_template_dir >> $filename_inbox_pvt

            nvim $filename_inbox_pvt
        else
            echo "Created on $todays_date" > $filename_inbox
            cat $zettel_template_dir >> $filename_inbox
            
            nvim $filename_inbox
        end
    end
end


