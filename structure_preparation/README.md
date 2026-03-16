Scripts used to prepare DNA nanodisc structures for molecular dynamics simulations.

* [merge_dna_lipids_mdanalysis.ipynb](merge_dna_lipids_mdanalysis.ipynb)
Merges DNA and lipid bilayer structures into a single `.gro` file using MDAnalysis.
* [pymol_visualize_nanodisc.pml](pymol_visualize_nanodisc.pml)
PyMOL script used to visualize the DNA nanodisc system and highlight DNA strands,
alkyl chains, and lipid bilayer components.

* [remove_clashing_lipids_mdanalysis.ipynb](remove_clashing_lipids_mdanalysis.ipynb) Identifies lipid residues (DMPC, DMTAP) that are closer than 2.5 Å to DNA atoms
and removes them using MDAnalysis. The cleaned structure is written to a new GRO file.
