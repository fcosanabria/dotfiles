function open_readme
    set repo_path "/home/fcosanabria/git/dotfiles"
    set readmes (fd README.md $repo_path/dot_config/ --type f --max-depth 2)
    set selected (printf '%s\n' $readmes | fzf --prompt="Select README: ")
    if test -z "$selected"
        return
    end
    set dirname (basename (dirname $selected))
    set window_name "$dirname readme"
    tmux new-window -n "$window_name" "cd $repo_path && nvim -c 'MarkdownPreview' $selected"
    tmux select-window -t "$window_name"
end