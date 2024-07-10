# Getting started

## Installation
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
source ~/,bashrc
```

### Neuralangelo dependencies
Prequisites
1. Miniconda/Anaconda
2. Colmap [guide](#appendix)

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

## Appendix
### Colmap local installation
To install colmap locally, run command in terminal:
```
source install_colmap.sh
```

for further instruction, [colmap installation page](https://colmap.github.io/install.html#linux)
