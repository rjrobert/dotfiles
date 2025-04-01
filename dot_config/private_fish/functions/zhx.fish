function zhx
    set -l folder_name (path basename $PWD)
    zellij attach -f -c $folder_name options --default-layout helix
    # set -l sessions (zellij ls)
    # echo $sessions
    # if zellij ls | grep -q $folder_name
    #     zellij attach -f $folder_name
    # else
    #     zellij -l helix -s (path basename $PWD)
    # end
end
