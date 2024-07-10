conda_env="neuralangelo"
conda init
conda activate $conda_env

# if conda env list | grep -q "^$conda_env\s"; then
#     # Activate existing Conda environment
#     echo "Activating existing Conda environment: $conda_env"
#     conda activate $conda_env
# else
#     # Create and activate Conda environment
#     echo "Creating Conda environment: $conda_env"
#     conda create -y -n $conda_env python=3.8
#     conda activate $conda_env
# fi