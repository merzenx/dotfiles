source /usr/share/cachyos-fish-config/cachyos-config.fish
function glog
   journalctl -f -u gnirehtet-autorun.service -e 
end
# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
