# function that opens today's daily note.
function tday
    sync_sb
    set template_file "$HOME/Documents/second-brain/888-Templates/Daily Note Template.md"
    set daily_notes_dir "$HOME/Documents/second-brain/2-Daily Notes/"
    set todays_date (date "+%Y-%m-%d")
    set day (date "+%A")

    set filename "$daily_notes_dir/$todays_date-$day.md"

    if test -f $filename
        echo "Today's note already exists. Opening it."
        vim $filename
        return
    end

    cp $template_file $filename
    nv $filename
end
