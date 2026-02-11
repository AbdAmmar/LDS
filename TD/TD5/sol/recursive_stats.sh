#!/usr/bin/env bash

# Définition de la fonction récursive
GET_DIR_FIL_EXE() {

    # Récupération de l'argument avec des guillemets (pour gérer les espaces)
    local DIR="${1}"

    # Initialisation des variables LOCALES à 0
    local NB_DIR=0
    local NB_FIL=0
    local NB_EXE=0

    # Boucle sur le contenu du répertoire
    for ITEM in "${DIR}"/*; do

        # Sécurité : 
        # On vérifie que l'élément existe vraiment avant de continuer.
        [[ -e "${ITEM}" ]] || continue

        if [[ -d "${ITEM}" ]]; then
            # C'est un répertoire
            
            # On compte ce répertoire
            NB_DIR=$((NB_DIR + 1))

            # APPEL RÉCURSIF : On lance la fonction sur ce sous-dossier
            local RES=$(GET_DIR_FIL_EXE "${ITEM}")
            
            # On lit les résultats retournés
            read -r NB_DIR_TMP NB_FIL_TMP NB_EXE_TMP <<< "${RES}"

            # On ajoute les sous-totaux aux totaux actuels
            NB_DIR=$((NB_DIR + NB_DIR_TMP))
            NB_FIL=$((NB_FIL + NB_FIL_TMP))
            NB_EXE=$((NB_EXE + NB_EXE_TMP))

        elif [[ -f "${ITEM}" ]]; then

            # C'est un fichier standard
            NB_FIL=$((NB_FIL + 1))

            # Est-il exécutable ?
            if [[ -x "${ITEM}" ]]; then
                NB_EXE=$((NB_EXE + 1))
            fi
        fi

    done

    # On affiche les 3 compteurs sur la sortie standard
    echo "${NB_DIR} ${NB_FIL} ${NB_EXE}"
}


# Vérification du nombre d'arguments
if [[ $# -ne 1 ]]; then
    echo "Usage: ${0} <repertoire>"
    exit 1
fi

INPUT_DIR="${1}"

# Test d'existence
if [[ ! -e "${INPUT_DIR}" ]]; then
    echo "Erreur : Le chemin '${INPUT_DIR}' n'existe pas."
    exit 2
fi

# Test de type dossier
if [[ ! -d "${INPUT_DIR}" ]]; then
    echo "Erreur : '${INPUT_DIR}' n'est pas un dossier valide."
    exit 3
fi

# Appel de la fonction
FINAL_RES=$(GET_DIR_FIL_EXE "${INPUT_DIR}")

# Lecture et affichage du résultat final
read -r TOTAL_DIR TOTAL_FIL TOTAL_EXE <<< "${FINAL_RES}"

echo "Analyse de : ${INPUT_DIR}"
echo "--------------------------"
echo "Dossiers    : ${TOTAL_DIR}"
echo "Fichiers    : ${TOTAL_FIL}"
echo "Exécutables : ${TOTAL_EXE}"
