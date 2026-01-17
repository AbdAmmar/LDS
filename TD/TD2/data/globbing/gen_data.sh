#!/bin/bash
set -e

base="entreprise_data"
rm -rf "$base"
mkdir -p "$base"/{finances,rh,ventes,it/logs,backups}

cd "$base"

# --- Finances : rapports trimestriels, factures clients ---
for year in 2022 2023; do
  for q in Q1 Q2 Q3 Q4; do
    for v in v1 v2; do
      touch "finances/${year}-rapport-finances-${q}-${v}.pdf"
    done
  done
done

for client in CLIENTA CLIENTB CLIENTC; do
  for num in 001 002 003; do
    touch "finances/2023-facture-${client}-${num}.pdf"
  done
done

# --- RH : salaires, contrats ---
for month in 01 02 03; do
  touch "rh/2023-${month}-liste-salaires-confidentiel.xlsx"
  touch "rh/2023-${month}-liste-salaires-internes.xlsx"
done

touch rh/2022-12-liste-salaires-archive.xlsx
touch rh/2023-01-contrat-CDD-dupont.docx \
      rh/2023-01-contrat-CDI-durand.docx

# --- Ventes : chiffres d'affaires par région ---
for region in nord sud est ouest; do
  for month in 01 02 03; do
    touch "ventes/2023-${month}-chiffre-affaires-${region}.csv"
  done
done

# --- IT : logs d'applications ---
for day in 01 02 03 10 11 12 13 14 15 16 17 18 19; do
  touch "it/logs/app-prod-2023-01-${day}.log"
done

for day in 01 02 03; do
  touch "it/logs/app-dev-2023-01-${day}.log"
done

for day in 01 02 03; do
  touch "it/logs/app-prod-2023-01-${day}.log.gz"
done

# --- Backups ---
for day in 01 08 15 22 29; do
  touch "backups/backup-db-2023-03-${day}-full.tar.gz"
done

for day in 02 03 04 09 10; do
  touch "backups/backup-db-2023-03-${day}-incr.tar.gz"
done

touch backups/backup-app-2023-03-01-full.tar.gz

# --- Fichiers divers et cachés à la racine ---
touch README.md .secret .env.production .gitignore

cd ..
tar czf entreprise_data.tar.gz "$base"
echo "Archive créée : entreprise_data.tar.gz"
