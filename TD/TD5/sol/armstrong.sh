#!/usr/bin/env bash

# Vérification des arguments
if [[ $# -ne 1 ]]; then
    echo "Erreur: passez un et un seul argument"
    exit 1
fi

# On stocke l'argument dans une variable
NUM=${1}

# On vérifie que c'est bien un entier positif.
# La regex ^[0-9]+$ signifie : du début (^) à la fin ($), uniquement des chiffres.
# La regex ^[A-Za-z0-9]+$ signifie :
#     ^ : début de ligne
#     [ ... ] : caractères autorisés (chiffres)
#     + : au moins un caractère
#     $ : fin de ligne
# Le '!' inverse le test (si ça NE correspond PAS)
if [[ ! $NUM =~ ^[0-9]+$ ]]; then
    echo "Erreur: format INVALIDE (entier positif attendu)"
    exit 2
fi

# Récupération de la longueur de la chaîne (${#VAR})
LEN=${#NUM}

# Initialisation de la variable accumulateur à 0
SOM=0

# Boucle de calcul
for ((i=0; i<LEN; i++)); do

    # Extraction du chiffre à la position $i
    X=${NUM:$i:1}

    # Calcul arithmétique : Somme = Somme + (Chiffre ^ Longueur)
    SOM=$((SOM + X**LEN))

done

# Affichage intermédiaire
echo "Somme calculée = $SOM"

# Comparaison numérique (-eq) entre la somme calculée et le nombre original
if [[ $SOM -eq $NUM ]]; then
    echo "${NUM} est un nombre d'Armstrong"
else
    echo "${NUM} n'est pas un nombre d'Armstrong"
fi
