function sync_sb_fwd
    rsync -av --delete "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/second-brain/" "$HOME/Documents/second-brain/"
end
