function zet
    set zettel_template_dir "$HOME/Documents/second-brain/888-Templates/zettel.md"
    set inbox_dir "$HOME/Documents/second-brain/0-inbox/"
    set todays_date (date "+%Y-%m-%d_%H-%M-%S")

    if test -z "$argv[1]"
        set note_name "$todays_date"
    else
        set note_name "$argv[1]"
    end

    set filename "$inbox_dir/$note_name.md"

    if test -f $filename
        echo "File already exists"
    else
        echo "Created on $todays_date" >$filename
        echo "" >>$filename

        cat $zettel_template_dir >>$filename
    end

    code $filename

    sync_sb
end
