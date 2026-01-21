function walp() {
    echo "running walp"
    #output=$(wal -i ~/Pictures/desktop-images/ 2>&1 && echo 'awesome.restart()' | awesome-client)    
    output=$(wal -i ~/Pictures/desktop-images/ 2>&1)
    #echo "output:"
    #echo "$output"
    
    filename=$(echo "$output" | sed 's/\x1b\[[0-9;]*m//g' | grep image | awk -F ' ' '{print $5}' | sed 's/\.$//')
    echo "filename: $filename"
    
    wal --preview
    
    #colors
    
    #xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDP-2/workspace0/last-image -s /home/raf/Pictures/desktop-images/$filename
    #xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDP-4/workspace0/last-image -s /home/raf/Pictures/desktop-images/$filename   
    #xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorHDMI-0/workspace0/last-image -s /home/raf/Pictures/desktop-images/$filename
    #sleep 1
    
    if ! xfcewp monitorDP-2 $filename; then
        echo "Failed to set wp for monitorDP-2"
    fi
    
    if ! xfcewp monitorDP-4 $filename; then
        echo "Failed to set wp for monitorDP-4"
    fi
    
    if ! xfcewp monitorHDMI-0 $filename; then
        echo "Failed to set wp for monitorHDMI-0"
    fi
    
    # laptop
    if ! xfcewp monitoreDP-1 $filename; then
        echo "Failed to set wp for monitorHDMI-0"
    fi   
    
    echo "finished walp"
}

function xfcewp() {
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/$1/workspace0/last-image -s /home/raf/Pictures/desktop-images/$2 &>/dev/null
    #cmd="xfconf-query -c xfce4-desktop -p /backdrop/screen0/$1/workspace0/last-image -s /home/raf/Pictures/desktop-images/$2"
    #echo $cmd
    #eval "$cmd" || echo "Command failed: $cmd" 
}