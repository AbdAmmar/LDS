#!/usr/bin/env bash

echo "Ceci est un script qui calcule la resistance electrique."

obt_val_coul() {
    case ${1} in
        "noir")
            echo "0";;
        "marron")
            echo "1";;
        "rouge")
            echo "2";;
        "orange")
            echo "3";;
        "jaune")
            echo "4";;
        "vert")
            echo "5";;
        "bleu")
            echo "6";;
        "violet")
            echo "7";;
        "gris")
            echo "8";;
        "blanc")
            echo "9";;
        *)
            echo "Couleur invalide."
    esac
}

if [[ $# -ne 3 ]]; then
    echo "Erreur : le nombre de couleurs spécifié est invalide."
    exit 1
fi

VAL1=$(obt_val_coul "${1}")
VAL2=$(obt_val_coul "${2}")
VAL3=$(obt_val_coul "${3}")
RES=$((${VAL1}${VAL2} * 10**${VAL3}))

echo "La valeur de la resistance est ${RES} Ohms"

