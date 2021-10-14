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

python3 Project/OWL2VecStar/OWL2Vec_All.py --ontology-file 'Project/data/preprocessed_all_data_xml.xml' --embedding-dir 'Project/Output/Embeddings/' 
--configurations 'Project/data/Configurations/congifurations.pickle' --Protein_File 'Project/data/protein_file' --ontology_projection R+
--URI_Doc yes --Lit_Doc yes --Mix_Doc yes --Mix_Type all --Embed_Out_URI yes --Embed_Out_Words yes --walker Random --walker_depth 4 --embed_size 100 
--pre_train_model no --reasoning no




