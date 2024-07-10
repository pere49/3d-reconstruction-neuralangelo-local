NEURALANGELO_TEMPLATE="neuralangelo_template"
NEURALANGELO_DIR="neuralangelo"
NEURALANGELO_URL=https://github.com/NVlabs/neuralangelo.git

# Check if the folder exists
if [ ! -d "${NEURALANGELO_TEMPLATE}" ]; then
    # Folder doesn't exist, clone it from git
    git clone "${NEURALANGELO_URL}" "${NEURALANGELO_TEMPLATE}"
    git submodule update --init --recursive # init colmap submodule
else
    echo "Folder '${NEURALANGELO_TEMPLATE}' already exists."
fi

cp -r ${NEURALANGELO_TEMPLATE} ${NEURALANGELO_DIR}
cd ./neuralangelo/

# # Name of video
VID=$1

# move video to neuralangelo directory
cp ../${VID} .

# Define environmental variables
SEQUENCE="${VID%.*}"
PATH_TO_VIDEO=${VID}
DOWNSAMPLE_RATE=2
SCENE_TYPE=object

Extract Colmap poses
bash projects/neuralangelo/scripts/preprocess.sh ${SEQUENCE} ${PATH_TO_VIDEO} ${DOWNSAMPLE_RATE} ${SCENE_TYPE} & 
wait

echo "Colmap poses extracted. Starting reconstruction...."

cd ..
# Start the reconstruction from colmap poses extracted
bash reconstruct.sh ${VID} &
wait 

cd ..