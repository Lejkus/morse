#!/bin/sh

# Pobranie symboli z argumentów pozycyjnych (domyślnie: . i -)
DOT="${1:-.}"
DASH="${2:--}"

# Funkcja: zwraca kod Morse'a dla znaku
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

# Czytaj wejście linia po linii
while IFS= read -r line; do
    line=$(echo "$line" | tr 'a-z' 'A-Z')  # małe litery → wielkie
    for i in $(seq 1 ${#line}); do
        char=$(echo "$line" | cut -c$i)
        code=$(get_morse "$char")
        # Zamień kropki i kreski na wybrane symbole
        code=$(echo "$code" | sed "s/\./$DOT/g" | sed "s/-/$DASH/g")
        #wersja bash
        #echo -n "$code "
        #wersja mac
        printf "%s " "$code"

    done
    echo
done
