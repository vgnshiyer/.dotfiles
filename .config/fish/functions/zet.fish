function zet
    set zettel_template_dir "$HOME/Documents/second-brain/888-Templates/zettel.md"
    set inbox_dir "$HOME/Documents/second-brain/0-inbox/"
    set todays_date (date "+%Y-%m-%d_%H-%M-%S")

    set filename "$inbox_dir/$todays_date.md"

    cp $zettel_template_dir $filename

    nvim $filename
end
