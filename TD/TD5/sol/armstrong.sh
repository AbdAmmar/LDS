#!/usr/bin/env bash

# Vérifier qu'un seul argument a été passé
if [[ $# -ne 1 ]]; then
    echo "Erreur: passez un et un seul argument"
    exit 1
fi

NUM=${1}

# Vérifier que l'argument est un nombre entier positif
if [[ ! $NUM =~ ^[0-9]+$ ]]; then
    echo "Erreur: format INVALIDE"
    exit 2
fi

# Longueur du nombre = nombre de chiffres = puissance pour le calcul
LEN=${#1}

# Initialiser la somme à zéro
SOM=0

# Boucle sur chaque chiffre du nombre
for ((i=0; i<LEN; i++)); do

    # Extraire le i-ème chiffre (de gauche à droite)
    X=${NUM:$i:1}
    
    # Ajouter à la somme : chiffre élevé à la puissance LEN
    SOM=$((SOM + X**LEN))

done

# Afficher la somme calculée
echo "Somme = $SOM"

# Comparer la somme avec le nombre original
if [[ $SOM -eq $NUM ]]; then
    echo "${NUM} est un nombre d'Armstrong"
else
    echo "${NUM} n'est pas un nombre d'Armstrong"
fi
