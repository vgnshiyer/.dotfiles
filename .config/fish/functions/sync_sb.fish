function sync_sb
    rsync -av --delete "$HOME/Documents/second-brain/" "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/second-brain/"
end
