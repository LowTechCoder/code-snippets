#!/bin/bash
#add this script to your $my_home/.bashrc like this, but use your path:
#alias mat_snippet_search=$my_home/scripts/snippet_search/_main.bash

i=0

if [ "$#" -gt 9 ]; then
    echo "Error: Illegal number of parameters.  Max is 9"
fi

script_path="$( cd "$(dirname "$0")" ; pwd -P )"
snippets="snippets"
cd "$script_path/$tmp1"

# if create, show the snippets directory in finder
if [ "$1" == 'create' ] || [ "$1" == 'c' ]; then
    echo "open snippet directory"
    code "$script_path/$snippets"
    exit
fi

if [ "$1" == 'find' ] || [ "$1" == 'f' ] || [ "$1" == 'search' ] || [ "$1" == 's' ]; then

    clear
    tmp1="tmp1.tmp"
    tmp2="tmp2.tmp"
    tmp3="tmp3.tmp"
    init_choice="false"

    COLOR='\033[0;35m'
    NC='\033[0m' # No Color
    numbers='^[0-9]+$'

    # s1=${1:-default} # set var as 'default'.  Remove 'default' if you want an empty var.
    # set empty defaults
    # s1=${1:-} is 'create' or 'search'
    s2=${2:-} # set var as empty string
    s3=${3:-}
    s4=${4:-}
    s5=${5:-}
    s6=${6:-}
    s7=${7:-}
    s8=${8:-}
    s9=${9:-}
    find "$snippets" -type f -name "[!.]*" | # find files that don't start with a .(dot)
        grep "$s2" | grep "$s3" | grep "$s4" | grep "$s5" |
        grep "$s6" | grep "$s7" | grep "$s8" | grep "$s9" | sort > "$tmp1" # show files from arguments

    i=0
    choice="d"
    while true
    do
        clear
        echo -e "keys: ${COLOR}u${NC}p ${COLOR}d${NC}own ${COLOR}c${NC}opy ${COLOR}q${NC}uit"
        echo ""

        if [ "$choice" == 'd' ]
        then
            i=$((i+1))
        elif [ "$choice" == 'u' ]
        then
            i=$((i-1))
        elif [[ $choice =~ $numbers ]]
        then
            i="$choice"
        # copy snippet to clip board
        elif [ "$choice" == 'c' ]
        then
            # $my_os is a var set in your .bashrc, which specifies what kind of system you are using.
            if [[ $my_os == "linux on windows" ]] # WSL on Windows 10
            then
                cat "$choice_line" | clip.exe
            elif [ "$my_os" == 'mac' ] # Mac
            then
                cat "$choice_line" | pbcopy
            elif [ "$my_os" == 'linux' ] # Linux
            then
                cat "$choice_line" | xclip
            fi
        elif [ "$choice" == 'q' ]
        then
            clear
            exit
        fi

        cat "$tmp1" | sed 's#snippets/##g' > "$tmp2"
        echo "$0"
        echo
        cat "$tmp1"
        echo
        cat "$tmp2"
        echo 
        cat "$tmp2" | awk '{printf "%d\t%s\n", NR, $0}' > "$tmp3" # add line numbers on each line

        cat "$tmp3"
        echo 
        exit
        l=0
        while read line; do
            l=$((l+1))
            if [ "$i" == "$l" ]
            then
                echo -e "$COLOR$line$NC"
            else
                echo "$line"
            fi
        done < "$tmp3"
        echo ""
        q='q'
        choice_line=$(sed "$i$q;d" "$tmp1")
        echo -e "${COLOR}------------------------------------------${NC}"
        cat "$choice_line"
        echo ""
        echo -e "${COLOR}------------------------------------------${NC}"
        read -n 1 choice 

    done

fi
