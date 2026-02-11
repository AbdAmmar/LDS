#!/usr/bin/env bash

# Test du nombre d'arguments
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <nombre>"
    exit 1
fi

N=${1}

# Test du format (entier positif)
if [[ ! "${N}" =~ ^[0-9]+$ ]]; then
    echo "Erreur : L'argument doit être un entier positif."
    exit 2
fi

# Calcul
FACT=1

# Si N vaut 0, la boucle ne s'exécute pas, FACT reste à 1 (correct car 0! = 1)
for (( i=1; i<=N; i++ )); do
    FACT=$(( FACT * i ))
done

# Affichage
echo "Factorielle de $N vaut $FACT"
