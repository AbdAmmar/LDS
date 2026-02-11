#!/usr/bin/env bash

# Vérification du nombre d'arguments
if [[ $# -ne 2 ]]; then
    echo "Usage: ${0} <nombre_iterations> <scale>"
    exit 2
fi

# On nomme les variables pour plus de clarté
MAX_ITER=${1}
PRECISION=${2}

# Vérification du type des arguments
# On vérifie que les deux arguments sont des entiers positifs
if [[ ! "$MAX_ITER" =~ ^[0-9]+$ ]] || [[ ! "$PRECISION" =~ ^[0-9]+$ ]]; then
    echo "Erreur : Les arguments doivent être des entiers positifs."
    exit 2
fi

# Initialisation de la somme
SOMME=0

# Boucle de calcul
for ((i=0; i<=MAX_ITER; i++)); do

    # Calcul du terme
    TERM=$(echo "scale=${PRECISION}; (-1)^${i} / (2 * ${i} + 1)" | bc)

    # on ajoute le terme
    SOMME=$(echo "scale=${PRECISION}; ${SOMME} + ${TERM}" | bc)

done

# On multiplie la somme trouvée par 4
PI_FINAL=$(echo "scale=${PRECISION}; ${SOMME} * 4" | bc)

echo "Approximation de Pi (${MAX_ITER} itérations) : ${PI_FINAL}"


