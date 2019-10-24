#!/bin/bash
# Download the pdb database
if [ ! -d ./pdb ]
    then
    echo "Downloading pdb database..."
    rsync -rlpt -v -z --delete --port=33444 rsync.rcsb.org::ftp_data/structures/divided/pdb/ ./pdb
    pushd pdb
    echo "Decompressing all the pdb files..."
    gunzip -r -d .
    popd 
fi

# Download plip repository
if [ ! -f stable.zip ]
    then
        echo "Downloading plip..."
        git clone https://github.com/ssalentin/plip/archive/stable.zip
        unzip stable
        rm -rf stable
fi

# Downloading launcher
if [ ! -d ./launcher ]
    then
    echo "Downloading TACC launcher..."
    git clone https://github.com/TACC/launcher.git


# Create virtual environment
echo "Creating virtual environment"
virtualenv -p $(which python3.6) .venv
source .venv/bin/activate
pip install -r requirements.txt


# Create a directory for performing all the calculations
mkdir analysis
pushd analysis
mv ../make_run.py ../launcher.sh .
python make_run.py

echo "All the commands for analyzing pi interactions are created and saved to ./analysis/run.sh. Please use TACC launcher to run those commands"

popd
