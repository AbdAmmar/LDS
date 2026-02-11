#!/usr/bin/env bash

# Vérification du nombre d'arguments
if [[ $# -ne 1 ]]; then
    echo "Usage: ${0} <nombre_entier>"
    exit 1
fi

NUMBER=${1}

# Vérification du type (Entier positif)
if [[ ! "$NUMBER" =~ ^[0-9]+$ ]]; then
    echo "Erreur : L'argument doit être un entier positif."
    exit 2
fi

# Gestion des cas particuliers (0 et 1)
if (( NUMBER < 2 )); then
    echo "$NUMBER n'est pas un nombre premier."
    exit 0
fi


# On part du principe que le nombre EST premier, jusqu'à preuve du contraire.
IS_PRIME=1

# Boucle de test des diviseurs.
# Version Naïve : for (( i=2; i < NUMBER; i++ ))
# Version Optimisée : on s'arrête quand i*i dépasse NUMBER (racine carrée)
for (( i=2; i*i<=NUMBER; i++ )); do

    # Test de divisibilité : le reste de la division (modulo) est-il nul ?
    if (( NUMBER % i == 0 )); then

        # On a trouvé un diviseur ! Ce n'est pas un nombre premier.
        IS_PRIME=0
        
        # Inutile de continuer à chercher, on casse la boucle.
        break
    fi

done

# Affichage du résultat
if (( IS_PRIME == 1 )); then
    echo "${NUMBER} est un nombre premier."
else
    echo "${NUMBER} n'est pas un nombre premier."
fi

