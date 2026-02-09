#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Usage: ${0} <nombre>"
    exit 1
fi

N=${1}


if [[ ! ${N} =~ ^[0-9]+$ ]]; then
    echo "Erreur : '${1}' n'est pas un entier valide."
    exit 2
fi

if [[ ${N} -lt 1 ]]; then
    echo "Erreur : Le nombre doit être supérieur ou égal à 1."
    exit 3
fi

echo "Décollage avec le nombre $N"

COMPTEUR=0
while [[ $N -gt 1 ]]; do

    if (( N % 2 == 0 )); then
        (( N /= 2 ))
    else
        (( N = N * 3 + 1 ))
    fi

    COMPTEUR=$((COMPTEUR+1))

    if [[ ${N} -ne 1 ]]; then
        echo -n "${N} -> "
    fi
done

echo "Atterrissage à 1 !"
echo "Nombre d'étapes : ${COMPTEUR}"

exit 0
