Scripts used to analyze molecular dynamics simulations of DNA nanodiscs.

* [plot_temperature_pressure_density.ipynb](plot_temperature_pressure_density.ipynb)
Reads Temperature.xvg, Pressure.xvg, and Density.xvg and generates plots and basic statistics.

* [extract_modified_residues_pymol.pml](extract_modified_residues_pymol.pml)
PyMOL script that selects modified DNA residues and neighboring backbone atoms
and exports each residue as a MOL2 file for subsequent chirality verification.

* [check_chirality_modified_residues.ipynb](check_chirality_modified_residues.ipynb)
Reads MOL2 files extracted with PyMOL and checks stereochemistry
of modified phosphorothioate residues using RDKit and MDAnalysis.

* [analyze_alkyl_chain_lipid_distance.ipynb](analyze_alkyl_chain_lipid_distance.ipynb)
Reads gmx pairdist (`.xvg`) files for multiple alkyl-chain carbon atoms,
computes the mean minimum distance to lipid tails, and compares S and R
enantiomers. Generates a smoothed time-series plot suitable for publication.
