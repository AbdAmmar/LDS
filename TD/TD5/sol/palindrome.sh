#!/usr/bin/env bash

# Vérification du nombre d'arguments
if [[ $# -ne 1 ]]; then
    echo "Erreur: Donnez un et un seul argument"
    exit 1
fi

# on sauvegarde l'argument original pour l'affichage final
MOT_INIT=${1}

# Vérification du format (Alphanumérique uniquement)
# La regex ^[A-Za-z0-9]+$ signifie :
#     ^ : début de ligne
#     [ ... ] : caractères autorisés (lettres et chiffres)
#     + : au moins un caractère
#     $ : fin de ligne
# Le '!' inverse le test (si ça NE correspond PAS)
if [[ ! "$MOT_INIT" =~ ^[A-Za-z0-9]+$ ]]; then
    echo "Erreur: format invalide (lettres et chiffres uniquement)"
    exit 2
fi

# Normalisation (Mise en minuscules)
# On utilise 'tr' pour transformer les majuscules en minuscules
MOT=$(echo ${MOT_INIT} | tr '[:upper:]' '[:lower:]')

# Récupération de la longueur de la chaîne
LEN=${#MOT}

# Initialisation de la variable qui contiendra le mot inversé
INV=''

# On part du dernier index (LEN-1) et on descend jusqu'à 0
for ((i=LEN-1; i>=0; i--)); do

    # Extraction du caractère à la position i
    l=${MOT:$i:1}
    
    # Concaténation : on ajoute la lettre trouvée à la suite de INV
    INV=${INV}${l}
done

# Comparaison finale
if [[ ${INV} == ${MOT} ]]; then
    echo "${MOT_INIT} est un palindrome."
else
    echo "${MOT_INIT} n'est pas un palindrome."
fi
