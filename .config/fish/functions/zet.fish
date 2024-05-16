function zet
    set zettel_template_dir "$HOME/Documents/second-brain/888-Templates/zettel.md"
    set inbox_dir "$HOME/Documents/second-brain/0-inbox/"
    set todays_date (date "+%Y-%m-%d_%H-%M-%S")

    if test -z "$1"
        then
        set note_name (date "+%Y-%m-%d_%H-%M-%S")
    else
        set note_name "$1"
    end

    set filename "$inbox_dir/$note_name.md"

    if test -f $filename
        then
        echo "File already exists"
    else
        cp $zettel_template_dir $filename
    end

    nvim $filename
end
