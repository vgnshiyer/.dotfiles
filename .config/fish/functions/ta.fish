function ta
    set session_name
    set dir (pwd)
    while count $argv > /dev/null
	switch $argv[1]
	    case -s
	        set session_name $argv[2]
	        set -e argv[1..2]
	    case '*'
	        set dir $argv[1]
                set -e argv[1]
        end
    end

    set dir (string trim -r -c / $dir)    

    if test -z "$session_name"
        set session_name (tmux list-windows -a -F "#{session_name}:#{window_active} #{pane_current_path}" | grep "$dir" | cut -d: -f1 | head -n 1)
    end

    if test -z "$session_name"
        tmux new-session -d -c $dir
        set session_name (tmux list-sessions -F "#{session_name}" | tail -n 1)
    end

    tmux attach -t $session_name
end

