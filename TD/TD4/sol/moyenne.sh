#!/usr/bin/env bash


echo "Ceci est un programme qui calcule la moyenne."

# Vérifie qu'il y a au moins un paramètre
if [[ $# -eq 0 ]]; then
    echo "Erreur : Aucun paramètre fourni."
    exit 1
fi


# Initialisation
SOMME=0
COMPTEUR=0

for param in "$@"; do

    # Vérifie que le paramètre est un nombre A.BC
    if ! [[ ${param} =~ ^[0-9]+[\.][0-9]{2}$ ]]; then
        echo "Erreur : '${param}' n'est pas un nombre valide."
        exit 2
    fi

    # Ajoute le paramètre à la somme
    SOMME=$(echo "scale = 2; ${SOMME} + ${param}" | bc)
    COMPTEUR=$((COMPTEUR + 1))
done

# Calcule la moyenne
MOYENNE=$(echo "scale=2; $SOMME / $COMPTEUR" | bc)

# Affiche le résultat
echo "La moyenne est : ${MOYENNE}"
