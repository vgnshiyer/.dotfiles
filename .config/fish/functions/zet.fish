function zet
    sync_sb
    set zettel_template_dir "$HOME/Documents/second-brain/888-Templates/zettel.md"
    set zettel_dir "$HOME/Documents/second-brain/1-zettelkasten/"
    set zettel_pvt_dir "$HOME/Documents/second-brain/3-zettelkasten-pvt/"
    set inbox_dir "$HOME/Documents/second-brain/0-inbox/"
    set todays_date (date "+%Y-%m-%d_%H-%M-%S")

    if test -z "$argv[1]"
        set note_name "$todays_date"
    else
        set note_name "$argv[1]"
    end

    set filename_inbox "$inbox_dir/$note_name.md"
    set filename_zettel "$zettel_dir/$note_name.md"
    set filename_zettel_pvt "$zettel_pvt_dir/$note_name.md"

    if test -f $filename_inbox
        echo "File already exists"
        code $filename_inbox
    else if test -f $filename_zettel
        echo "File already exists"
        code $filename_zettel
    else if test -f $filename_zettel_pvt
        echo "file already exists"
        code $filename_zettel_pvt
    else
        echo "Created on $todays_date" > $filename_inbox
        cat $zettel_template_dir >> $filename_inbox
        code $filename_inbox
    end
end




