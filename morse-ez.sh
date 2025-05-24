#!/bin/sh

# Funkcja zwraca kod Morse’a dla pojedynczego znaku
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

# Odczyt linii ze standardowego wejścia
while IFS= read -r line; do
    line=$(echo "$line" | tr 'a-z' 'A-Z')  # zamiana małych liter na wielkie
    for i in $(seq 1 ${#line}); do
        char=$(echo "$line" | cut -c$i)
        get_morse "$char" | tr '\n' ' '
    done
    echo
done
