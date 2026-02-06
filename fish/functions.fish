function gm --description "Git commit with message"
    if test (count $argv) -eq 0
        echo "Usage: gcm 'commit message'"
        return 1
    end
    git commit -m "$argv" 
end

function cr --description "Cargo run with args"
   if test (count $argv) -eq 0  
    cargo run
    return 0
   end
   cargo run $argv
end
