#!/usr/bin/env bash

# Vérification du nombre d'arguments
if [[ $# -ne 2 ]]; then
    echo "Usage: ${0} <brin1> <brin2>"
    exit 1
fi

BRIN1=${1}
BRIN2=${2}

# Vérification de l'alphabet (A, C, G ou T uniquement)
if [[ ! "${BRIN1}" =~ ^[ACGT]+$ ]] || [[ ! "${BRIN2}" =~ ^[ACGT]+$ ]]; then
    echo "Erreur : Les séquences doivent contenir uniquement A, C, G ou T."
    exit 2
fi

# Vérification de la longueur
LEN1=${#BRIN1}
LEN2=${#BRIN2}

# Les chaînes doivent avoir la même longueur
if [[ $LEN1 -ne $LEN2 ]]; then
    echo "Erreur : Les chaînes doivent avoir la même longueur."
    exit 3
fi

# Calcul de la distance
DISTANCE=0

# On boucle sur chaque position (index) de 0 à LEN-1
for (( i=0; i<LEN1; i++ )); do

    # Extraction du caractère à la position i dans chaque chaîne
    CHAR1=${BRIN1:$i:1}
    CHAR2=${BRIN2:$i:1}

    # Si les caractères sont différents, on incrémente la distance
    if [[ "$CHAR1" != "$CHAR2" ]]; then
        DISTANCE=$((DISTANCE + 1))
    fi

done

# Affichage
echo "Distance de Hamming : $DISTANCE"


