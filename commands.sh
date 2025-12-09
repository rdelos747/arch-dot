alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pico8='~/pico-8/pico8'

#alias walp="wal -i ~/Pictures/desktop-images/ && echo 'awesome.restart()' | awesome-client"
alias todo="cat ~/Documents/todo.txt"
alias nsx="~/Documents/nsx/build/bin/nsx"

function sbp() {
    source ~/.bash_profile
    echo -e "hello"
}


function colors() {
    echo -e "\033[30mblack\033[0m"
    echo -e "\033[30mcolor 30 \033[30;41m 30;41 \033[30;42m 30;42 \033[30;43m 30;43 \033[30;44m 30;44 \033[30;45m 30;45 \033[30;46m 30;46 \033[30;47m 30;47 \033[30;48m 30;48 \033[30;49m 30;49 \033[30;40m 30;49 \033[0m"
    echo -e "\033[31mcolor 31 \033[31;41m 31;41 \033[31;42m 31;42 \033[31;43m 31;43 \033[31;44m 31;44 \033[31;45m 31;45 \033[31;46m 31;46 \033[31;47m 31;47 \033[31;48m 31;48 \033[31;49m 31;49 \033[31;40m 31;49 \033[0m"
    echo -e "\033[32mcolor 32 \033[32;41m 32;41 \033[32;42m 32;42 \033[32;43m 32;43 \033[32;44m 32;44 \033[32;45m 32;45 \033[32;46m 32;46 \033[32;47m 32;47 \033[32;48m 32;48 \033[32;49m 32;49 \033[32;40m 32;49 \033[0m"
    echo -e "\033[33mcolor 33 \033[33;41m 33;41 \033[33;42m 33;42 \033[33;43m 33;43 \033[33;44m 33;44 \033[33;45m 33;45 \033[33;46m 33;46 \033[33;47m 33;47 \033[33;48m 33;48 \033[33;49m 33;49 \033[33;40m 33;49 \033[0m"
    echo -e "\033[34mcolor 34 \033[34;41m 34;41 \033[34;42m 34;42 \033[34;43m 34;43 \033[34;44m 34;44 \033[34;45m 34;45 \033[34;46m 34;46 \033[34;47m 34;47 \033[34;48m 34;48 \033[34;49m 34;49 \033[34;40m 34;49 \033[0m"
    echo -e "\033[35mcolor 35 \033[35;41m 35;41 \033[35;42m 35;42 \033[35;43m 35;43 \033[35;44m 35;44 \033[35;45m 35;45 \033[35;46m 35;46 \033[35;47m 35;47 \033[35;48m 35;48 \033[35;49m 31;49 \033[35;40m 35;49 \033[0m"
    echo -e "\033[36mcolor 36 \033[36;41m 36;41 \033[36;42m 36;42 \033[36;43m 36;43 \033[36;44m 36;44 \033[36;45m 36;45 \033[36;46m 36;46 \033[36;47m 36;47 \033[36;48m 36;48 \033[36;49m 31;49 \033[36;40m 36;49 \033[0m"
    echo -e "\033[37mcolor 37 \033[37;41m 37;41 \033[37;42m 37;42 \033[37;43m 37;43 \033[37;44m 37;44 \033[37;45m 37;45 \033[37;46m 37;46 \033[37;47m 37;47 \033[37;48m 37;48 \033[37;49m 37;49 \033[37;40m 37;49 \033[0m"
    echo -e "\033[38mcolor 38 \033[38;41m 38;41 \033[38;42m 38;42 \033[38;43m 38;43 \033[38;44m 38;44 \033[38;45m 38;45 \033[38;46m 38;46 \033[38;47m 38;47 \033[38;48m 38;48 \033[38;49m 38;49 \033[38;40m 38;49 \033[0m"
    echo -e "\033[39mcolor 39 \033[39;41m 39;41 \033[39;42m 39;42 \033[39;43m 39;43 \033[39;44m 39;44 \033[39;45m 39;45 \033[39;46m 39;46 \033[39;47m 39;47 \033[39;48m 39;48 \033[39;49m 39;49 \033[39;40m 39;49 \033[0m"

    #echo -e "\033[32mcolor 32 \033[0m"
    #echo -e "\033[33mcolor 33 \033[0m"
    #echo -e "\033[34mcolor 34 \033[0m"
    #echo -e "\033[35;45mbold \033[0m"
    #echo -e "\033[36mcolor 36 \033[0m"
    #echo -e "\033[37mcolor 37 \033[0m"
    #echo -e "\033[38mcolor 38 \033[0m"
    #echo -e "\033[39mdefault \033[0m"
}

function walp() {
    echo "running walp"
    #output=$(wal -i ~/Pictures/desktop-images/ 2>&1 && echo 'awesome.restart()' | awesome-client)    
    output=$(wal -i ~/Pictures/desktop-images/ 2>&1)
    echo "output:"
    echo "$output"
    
    filename=$(echo "$output" | sed 's/\x1b\[[0-9;]*m//g' | grep image | awk -F ' ' '{print $5}' | sed 's/\.$//')
    echo "filename: $filename"
    
    echo "finished walp"
    
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
}

function xfcewp() {
    cmd="xfconf-query -c xfce4-desktop -p /backdrop/screen0/$1/workspace0/last-image -s /home/raf/Pictures/desktop-images/$2"
    echo $cmd
    eval "$cmd" || echo "Command failed: $cmd"
}