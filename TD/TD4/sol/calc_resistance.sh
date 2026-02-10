#!/usr/bin/env bash

echo "Ceci est un script qui calcule la resistance electrique."

obt_val_coul() {
    case ${1} in
        # Utilisation de [Nn] pour accepter "Noir" et "noir"
        [Nn]oir)
            echo "0";;
        [Mm]arron)
            echo "1";;
        [Rr]ouge)
            echo "2";;
        [Oo]range)
            echo "3";;
        [Jj]aune)
            echo "4";;
        [Vv]ert)
            echo "5";;
        [Bb]leu)
            echo "6";;
        [Vv]iolet)
            echo "7";;
        [Gg]ris)
            echo "8";;
        [Bb]lanc)
            echo "9";;
        *)
            # Cas par défaut si aucune couleur ne correspond
            echo "Couleur invalide"
    esac
}

# Vérification du nombre d'arguments
if [[ $# -ne 3 ]]; then
    echo "Erreur : le nombre de couleurs spécifié est invalide"
    exit 1
fi

# On parcourt tous les arguments passés au script ("$@")
for couleur in "$@"; do
    test_val=$(obt_val_coul "$couleur")

    # Si la fonction retourne le message d'erreur
    if [[ "$test_val" == "Couleur invalide" ]]; then
        echo "Erreur : La couleur '$couleur' n'est pas reconnue."
        exit 2
    fi
done

# Récupération des valeurs numériques
VAL1=$(obt_val_coul "${1}")
VAL2=$(obt_val_coul "${2}")
VAL3=$(obt_val_coul "${3}")

# Calcul de la résistance
RES=$((${VAL1}${VAL2} * 10**${VAL3}))

echo "La valeur de la resistance est ${RES} Ohms"

