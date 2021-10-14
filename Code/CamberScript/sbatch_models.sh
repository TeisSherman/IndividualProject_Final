#!/bin/bash

#SBATCH --job-name="Ontology_Embeddings"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=teis.sherman@city.ac.uk
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --output job%J-%N.output
#SBATCH --error job%J-%N.err
#SBATCH --partition=normal
#SBATCH --gres=gpu:1
#SBATCH --time=24:00:00

module purge
module add python/3.7.9

pip install nltk
pip install sklearn
pip install requests
pip install gensim
pip install rdflib
pip install owlready2
pip install skorch
pip install scikit-learn
pip install torch
pip install pandas==1.3.1

python3 Project/OWL2VecStar/run_MLmodels.py --embedding-dir 'Project/Results/Embeddings/' --configuration 1_R_2_no_100_yes_R+ --SVM yes --MLP yes --LR no --RF no


