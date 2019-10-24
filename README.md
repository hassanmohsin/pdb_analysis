# PDB Analysis
Pi-stacking and cation-pi interaction analysis of pdb data

## Dependencies
* python 2.7
* plip
* launcher
* openbabel
* python-babel

## Instructions
* Install all the dependencies above and then run `setup.sh`. This script does the following
    * Downloads the pdb database. It takes a while depending on the internet connection. Total size is around 32 GB.
    * Decompresses the pdb files
    * Clones the plip repository from Github
    * Clones the TACC launcher from Github
    * Creates a virtual environment and installs all the python dependencies. Required for data analysis using a Jupyter notebook
    * Creates a text file containing the commands to run plip on the pdb files. Since there are over 155K pdb files, it is recommended to use TACC launcher to run those commands
* Use launcher file (`analysis/launcher.sh`) to execute the commands in `run.sh`. For detailed instructions please see `https://github.com/TACC/launcher`. 
* Once the `xml` files are generated, use `filter_pdbs.ipynb` to filter out the unexpected pdb files. This will create a pickle file containing the "good" pdb ids as a list.
* Use `analysis.ipynb` to do the analysis of the interactions and making plots.
