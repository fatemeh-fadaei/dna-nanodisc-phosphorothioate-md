#Selects modified DNA residues and their neighboring backbone atoms in PyMOL
#and exports each residue as a separate MOL2 file.

#The script:
#• Identifies modified residues (HFA, HFT, HFC, HFG, HSA, HST, HSC, HSG)
#• Selects nearby backbone atoms (O3', O5', C1', C2', C3', C4', C5', O4')
#• Combines the modified residue with its linking atoms
#• Iterates over predefined residue indices
#• Saves each structure as an individual MOL2 file for further analysis



select link_atoms, byres (mod expand 1) and name "O3'"+"O5'"
select mod, resn HFA+HFT+HFC+HFG+HSA+HST+HSC+HSG
select final_sel, mod or link_atoms

lst=[7, 9, 18, 20, 28, 30, 39, 41, 49, 51, 60, 62, 70, 72, 81, 83, 91, 93, 102, 104, 112, 114, 123, 125, 133, 135, 144, 146]
sorted_lst = sorted(lst)
print(sorted_lst)



with open ("create_modified.csv", "w") as f:
    
    for i in sorted_lst:
        f.write(f"select res_{i}, resi {i} and resn HFA+HFT+HFC+HFG+HSA+HST+HSC+HSG\n")
        f.write(f"select link_{i}, resi {i-1} and (name \"O3'\" or name \"C3'\" or name \"C1'\" or name \"C2'\" or name \"C4'\"  or name \"O4'\" or name \"C5'\")\n")
        f.write(f"select final_{i}, res_{i} or link_{i}\n")
        f.write (f"save D:/mol2/residue_{i}_with_link.mol2, final_{i}\n")