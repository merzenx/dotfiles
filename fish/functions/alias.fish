function j
    just $argv
end

function gm
    git commit -m $argv
end

function gstart
    set branch_name $argv[1]
    if test -z "$branch_name"
        echo "Error: Please specify a branch name. Usage: gstart <branch-name>"
        return 1
    end

    git checkout main
    git pull origin main
    git checkout -b $branch_name
end


function gsync
    set current_branch (git branch --show-current)
    if test "$current_branch" = "main"
        echo "You are already on main. Running git pull..."
        git pull origin main
        return
    end

    git fetch origin main
    if git rebase origin/main
        echo "Success: $current_branch is now rebased onto main (Linear History)."
    else
        echo "Error: Conflict detected. Please resolve conflicts and run 'git rebase --continue'."
    end
end

function gdone
    set branch_name (git branch --show-current)
    
    if test "$branch_name" = "main"
        echo "Updating main..."
        git pull origin main
        return
    end

    git checkout main
    git pull origin main
    
    if git branch -d $branch_name
        echo "Success: Branch '$branch_name' deleted locally."
    else
        echo "Warning: Branch '$branch_name' not fully merged. Use 'git branch -D' to force delete."
    end
end
