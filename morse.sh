#!/bin/sh

if [ "$1" = "-h" ]; then
    clear
    echo "Użycie: ./morse.sh [kropka] [kreska]"
    echo "Przykład: echo \"Hello 123\" | ./morse.sh \".\" \"-\""
    echo "          echo \"SOS\" | ./morse.sh \"*\" \"_\""
    exit 0
fi

DOT="${1:-.}"
DASH="${2:--}"

get_morse() {
    case "$1" in
        A) echo ".-";;
        B) echo "-...";;
        C) echo "-.-.";;
        D) echo "-..";;
        E) echo ".";;
        F) echo "..-.";;
        G) echo "--.";;
        H) echo "....";;
        I) echo "..";;
        J) echo ".---";;
        K) echo "-.-";;
        L) echo ".-..";;
        M) echo "--";;
        N) echo "-.";;
        O) echo "---";;
        P) echo ".--.";;
        Q) echo "--.-";;
        R) echo ".-.";;
        S) echo "...";;
        T) echo "-";;
        U) echo "..-";;
        V) echo "...-";;
        W) echo ".--";;
        X) echo "-..-";;
        Y) echo "-.--";;
        Z) echo "--..";;
        0) echo "-----";;
        1) echo ".----";;
        2) echo "..---";;
        3) echo "...--";;
        4) echo "....-";;
        5) echo ".....";;
        6) echo "-....";;
        7) echo "--...";;
        8) echo "---..";;
        9) echo "----.";;
        " ") echo "/";;
        *) echo "";;
    esac
}

while IFS= read -r line; do

    line=$(echo "$line" | tr 'a-z' 'A-Z') 

    for i in $(seq 1 ${#line}); do

        char=$(echo  "$line" | cut -c$i)

        code=$(get_morse "$char")

        code=$(echo "$code" | sed "s/\./$DOT/g" | sed "s/-/$DASH/g")

        printf "%s " "$code"

    done
    echo
done
