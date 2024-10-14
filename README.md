# Getting started

## Installation

This guide is for installation and running of neuralangelo and colmap to a local pc using Anaconda/miniconda
For Installation and running on Docker, check out the [docker guide](https://github.com/pere49/Prosthetic-Neuralangelo-Mesh.git)
### Miniconda/Anaconda
Ensure conda is installed. If not install from the main [conda docs](https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html)  
After installation, check if conda is in path:
```
conda --version
```
which should return the conda version, if conda version is not returned add conda to path:  
1. Open bashrc file:  
```
sudo nano ~/.bashrc
```   
2. Add path to the bottom of file:  
```
export PATH="~/miniconda3/bin/:$PATH"
```
3. then run command:  
```
source ~/.bashrc
```

### Neuralangelo dependencies
Prequisites
1. Miniconda/Anaconda
2. Colmap [guide](#getting-started/##appendix)
3. cuda toolkit and drivers

### Steps
1. git clone the repository [neuralangelo local]()
2. Navigate to repo, then run:
    ```
    conda env create --file neuralangelo.yaml
    ```
3. Then activate environment:
    ```
    conda activate neuralangelo
    ```
### Running the script
To run the script, run command:
```
bash start_reconstruction.sh path/to/video_name.mp4 > video_name.log 2>&1 &
```

<!-- Automating the script to run globally -->
### To run the script globally
Run the following commands in the terminal
```
# navigate to bin file in usr
cd /usr/local/bin

# Create a reference link to file
sudo ls -s /path/to/script.sh script
```

to ensure the script path matches change the following variable to match path in your system:  
+ NEURALANGELO_TEMPLATE in prosthelimb.sh
+ SCRIPT in start_reconstruction.sh

Then to test the script, you need the following project structure  

> project_name  
> └── video.mp4

Navigate to the project directory:
```
cd /path/project/
bash script video.mp4
```

In the current installation the script is named reconstruct
```
bash reconstruct video.mp4
````


## Appendix
### Colmap local installation
To install colmap locally, run command in terminal:
```
source install_colmap.sh
```

for further instruction, [colmap installation page](https://colmap.github.io/install.html#linux)

## Troubleshooting
1. Error: Dubious ownership in repository, add the following line after **docker cp ${NEURAL}:/workspace/neuralangelo**
```
git config --global --add safe.directory /workspace/neuralangelo
```

2. Could not find the version that satisfies the requirement.  
This is mostly related to breaking changes in newer releases of python packages, in this cas Pymcubes and wandb have breaking changes in the newer versions  
**Solution**: Version locking, in the requirements file lock pymcubes and wandb to: PyMCubes<=0.1.4, wandb<=0.17.5

3. Reconstruction fails just before training, size issue or out of memory, modify the hashgrid encoding based on gpu size, the file can be found at [projects/neuralangelo/configs/base.yaml]()  

|GPU | VRAM Hyperparameter |
|--- | --- |
|8GB | dict_size=20, dim=4 |
|12GB | dict_size=21, dim=4 |
|16GB | dict_size=21, dim=8 |

## Citations
> @inproceedings{li2023neuralangelo,  
&nbsp; title={Neuralangelo: High-Fidelity Neural Surface Reconstruction},  
&nbsp; author={Li, Zhaoshuo and M\"uller, Thomas and Evans, Alex and Taylor, Russell H and Unberath,   
&nbsp; Mathias and Liu, Ming-Yu and Lin, Chen-Hsuan},  
&nbsp; booktitle={IEEE Conference on Computer Vision and Pattern Recognition ({CVPR})},  
&nbsp; year={2023}  
}