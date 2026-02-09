#!/usr/bin/env bash

mkdir vrac_rh && cd vrac_rh

for i in {01..50}; do
    touch "202510_EMP${i}_SALES_FDP.pdf"
    touch "202511_EMP${i}_SALES_FDP.pdf"
    touch "202512_EMP${i}_SALES_FDP.pdf"
done

for i in {01..50}; do
    touch "202512_DIR${i}_CONFIDENTIEL.pdf"
done

for i in {01..50}; do
    touch "2024${i: -2}_OLD_DATA_${i}.doc"
done

for i in {01..25}; do
    touch "2024${i}_OLD_ARCHIVE.pdf"
    touch "2024${i}_OLD_DOC.doc"
done

for i in {01..10}; do
    touch "202501_NOM${i}_SALES_NOTE.doc"
    touch "202502_NOM${i}_RH_CV.docx"
done

for i in {1..50}; do
    touch "note_frais_${i}.jpg"
    touch "sauvegarde_backup_${i}.tmp"
    touch "scan_error_$(date +%s%N | cut -b10-15).txt"
done

cd ..
tar -czvf vrac_rh.tar.gz vrac_rh/


# solution
#mkdir -p org_rh
#mkdir -p org_rh/Archives/
#mkdir -p org_rh/Old_Formats/
#mkdir -p org_rh/Production/
#mkdir -p org_rh/Production/Direction/
#mkdir -p org_rh/Production/Erreurs/
#mkdir -p org_rh/Production/Paye/
#tree org_rh/
#mv -v vrac_rh/2024* org_rh/Archives
#mv -v vrac_rh/2025*FDP* org_rh/Production/Paye/
#mv -v vrac_rh/*.doc* org_rh/Old_Formats/
#mv -v vrac_rh/* org_rh/Production/Erreurs/
