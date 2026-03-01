function j
    just $argv
end

function gv
    gh repo view --web
end

function gp
    git checkout main && git pull origin main
end
