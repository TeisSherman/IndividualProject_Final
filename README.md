## Dependences 
The codes were run with the following core dependencies:
  1. Python 3.7.9
  2. RDFLib 5.0.0
  3. gensim 4.0.1 
  4. scikit-learn 0.24.1
  5. nltk 3.5
  6. OWLready2 0.26
  7. skorch 0.10.0
  8. pytorch 1.7.0
  
## OWL2Vec* Application
Based on OWL2Vec* (v0.1.0), this pipelines can be run either locally or through shell scripts on Camber City Servers.

1. **OWL2Vec_All.py**

    This program will embed the protein ontology using an OWL2Vec* document configuration file which determines sets of documents settings to gridsearch. Given size of ontology, it is better to only run a few document configurations in a loop to avoid timing out.

    Running example (local): ```Project/OWL2VecStar/OWL2Vec_All.py --ontology-file 'Project/data/preprocessed_all_data_xml.xml' --embedding-dir 'Project/Output/Embeddings/' --configurations 'Project/data/Configurations/congifurations.pickle' --Protein_File 'Project/data/9606.protein.links.v11.5.txt' --ontology_projeciton R+ --URI_Doc yes --Lit_Doc yes --Mix_Doc yes --Mix_Type all --Embed_Out_URI yes --Embed_Out_Words yes --walker Random --walker_depth 4 --embed_size 100 --pre_train_model no --reasoning no```

    Running example (shell script on city servers): ```Project/Code/CamberScript/sbatch_owl2vec_all.sh```

    Note: Different from the experimental codes, the standalone program has implemented all OWL ontology relevant procedures in python with Owlready, but it also allows the user to use pre-calculated annotations/axioms/entities/projection for generating the corpus. 

2. **OWL2Vec_Embeddings.py**

    This program will embed the protein ontology and output the protein embeddings to the defined directory.

    Running example: ```python --config_file default_multi.cfg```

    Running example (shell script on city servers): ```Project/Code/CamberScript/sbatch_owl2vec_embeddings.sh```

    Note: Different from OWL2Vec\_Standalone.py, this program is for only embeddings.

2. **OWL2VecStar/run_MLModels.py**

    This program will run an SVM, logistic regression, MLP and/or random forest classifier on an OWL2Vec* configuration based on file reads from a directory holds embeddings and follows the naming convention outlined in Appendix 3. 

    Running example: ```python3 run_MLModels.py --embedding_dir Project/Results/Embedddings --configuraiton 1_R_2_no_100_yes_R+ --SVM yes --MLP no --LR yes --RF yes```

    Running example (shell script on city servers): ```Project/Code/CamberScript/sbatch_owl2vec_models.sh```

## OPA2Vec Application

1. **OWL2Vec\_baselines.py**
 This program will OPA2Vec methodology to generate embedddings for the protein ontology. It reads from the cache directory with specific annotations for its use (cache/annotations_opa2vec.txt) 

Running example: ```python3 --Baselines/baselines.py```

## Gene Ontology Engineering

1. **Code\Project\Preprocessing\go_preprocessing.ipynb** 
This is a Jupyter Notebook with all preprocessing for the protein ontology. Avoid rerunning as it is very slow. The primary directory it reads data from is Project/data. 

## The rest of the code is outlined in Appendix 1. Most are jupyter notebooks with the outputs saved to enable browsing for the marker.

