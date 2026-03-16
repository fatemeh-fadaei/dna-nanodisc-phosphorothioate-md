#!/bin/bash
# ========= USER INPUTS =========
TPR="../DNA_lipids.tpr"
TRAJ="../DNA_lipids.xtc"
OUT_PREFIX="carbon_lipids_distance"

LIPID_TAILS="(resname DMPC DMTAP) and name C22 C23 C24 C25 C26 C27 C28 C29 C210 C211 C212 C213 C214 C314 C313 C312 C311 C310 C39 C38 C37 C36 C35 C34 C33 C32"

atoms=(C11L C12L C13L C14L C15L C16L C17L)

#____________________________ First group: HFA/HFG/HFC/HFT ____________________________
echo "Selecting HFA/HFG/HFC/HFT..."
for atom in "${atoms[@]}"; do

    # Write real selection file
    cat > "sel_HFX_${atom}.dat" <<EOF
"HFX_${atom}" resname HFA HFG HFC HFT and name ${atom};
"Lipid_tails" ${LIPID_TAILS};
EOF

    gmx select \
        -f "$TRAJ" \
        -s "$TPR" \
        -sf "sel_HFX_${atom}.dat" \
        -on "HFX_${atom}.ndx"
done

#_______________________________ Second group: HSA/HSG/HSC/HST ________________________________
echo "Selecting HSA/HSG/HSC/HST..."
for atom in "${atoms[@]}"; do

    # Write real selection file
    cat > "sel_HSX_${atom}.dat" <<EOF
"HSX_${atom}" resname HSA HSG HSC HST and name ${atom};
"Lipid_tails" ${LIPID_TAILS};
EOF

    gmx select \
        -f "$TRAJ" \
        -s "$TPR" \
        -sf "sel_HSX_${atom}.dat" \
        -on "HSX_${atom}.ndx"
done

##_____________________calculate pairdist for HFX_____________________
for atom in "${atoms[@]}"; do
    echo "Running pairdist HFX_${atom}..."

    gmx pairdist \
        -f "$TRAJ" \
        -s "$TPR" \
        -n "HFX_${atom}.ndx" \
        -sel "group \"HFX_${atom}\"" \
        -ref 'group "Lipid_tails"' \
        -selgrouping res \
        -refgrouping all \
        -cutoff 2 \
        -tu ns \
        -o "${OUT_PREFIX}_HFX_${atom}.xvg"
done

##_____________________calculate pairdist for HSX_____________________
for atom in "${atoms[@]}"; do
    echo "Running pairdist HSX_${atom}..."

    gmx pairdist \
        -f "$TRAJ" \
        -s "$TPR" \
        -n "HSX_${atom}.ndx" \
        -sel "group \"HSX_${atom}\"" \
        -ref 'group "Lipid_tails"' \
        -selgrouping res \
        -refgrouping all \
        -cutoff 2 \
        -tu ns \
        -o "${OUT_PREFIX}_HSX_${atom}.xvg"
done
