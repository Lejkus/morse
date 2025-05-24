#!/bin/bash

# Ustawiamy domyślne symbole dla kropki i kreski w kodzie Morse'a
DOT="."
DASH="-"

# Funkcja wyświetlająca pomoc
print_help() {
    echo "Użycie: $0 [-d SYMBOL_DLA_KROPKI] [-k SYMBOL_DLA_KRESKI]"
    echo ""
    echo "Zamienia tekst ze standardowego wejścia na kod Morse'a."
    echo ""
    echo "Opcje:"
    echo "  -d SYMBOL   Użyj SYMBOLU zamiast kropki (.)"
    echo "  -k SYMBOL   Użyj SYMBOLU zamiast kreski (-)"
    echo "  -h          Wyświetl tę pomoc"
    exit 0
}

# Tworzymy tablicę asocjacyjną, która przypisuje znakom ich kod Morse’a
declare -A morse_code=(
    [A]=".-"    [B]="-..."  [C]="-.-."  [D]="-.."   [E]="."
    [F]="..-."  [G]="--."   [H]="...."  [I]=".."    [J]=".---"
    [K]="-.-"   [L]=".-.."  [M]="--"    [N]="-."    [O]="---"
    [P]=".--."  [Q]="--.-"  [R]=".-."   [S]="..."   [T]="-"
    [U]="..-"   [V]="...-"  [W]=".--"   [X]="-..-"  [Y]="-.--"
    [Z]="--.." 
    [0]="-----" [1]=".----" [2]="..---" [3]="...--" [4]="....-"
    [5]="....." [6]="-...." [7]="--..." [8]="---.." [9]="----."
)

# Obsługa opcji wiersza poleceń (np. -d, -k, -h)
while getopts ":d:k:h" opt; do
    case $opt in
        d) DOT="$OPTARG" ;;       # Ustaw symbol dla kropki
        k) DASH="$OPTARG" ;;      # Ustaw symbol dla kreski
        h) print_help ;;          # Wyświetl pomoc
        \?)                      # Jeśli podano nieznaną opcję
            echo "Nieznana opcja: -$OPTARG" >&2
            print_help
            ;;
    esac
done

# Usuwamy przetworzone opcje z listy argumentów
shift $((OPTIND -1))

# Jeśli dane nie są podane przez stdin (np. echo "tekst" | skrypt), to pokaż pomoc
if [ -t 0 ]; then
    print_help
fi

# Odczytujemy dane ze standardowego wejścia linia po linii
while IFS= read -r line; do
    # Iterujemy przez każdy znak w linii
    for (( i=0; i<${#line}; i++ )); do
        char="${line:$i:1}"                 # Wyciągamy pojedynczy znak
        char_up=$(echo "$char" | tr 'a-z' 'A-Z')  # Zamieniamy go na wielką literę

        if [[ "$char_up" == " " ]]; then
            # Jeśli znak to spacja, wstawiamy separator słów (np. /)
            echo -n " / "
        elif [[ -n "${morse_code[$char_up]}" ]]; then
            # Jeśli znak znajduje się w tablicy Morse’a
            code="${morse_code[$char_up]}"         # Pobieramy kod Morse’a
            code="${code//./$DOT}"                 # Zamieniamy kropki na wybrany symbol
            code="${code//-/$DASH}"                # Zamieniamy kreski na wybrany symbol
            echo -n "$code "                       # Wypisujemy kod Morse’a ze spacją
        fi
        # Znaki spoza alfabetu/cyfry są ignorowane
    done
    echo # Nowa linia po każdej linii wejścia
done
