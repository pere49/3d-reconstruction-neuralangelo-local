# Name of video
VID=$1
LOG_FILE="$(pwd)/${VID%.*}.log" # Define log file path and name
SCRIPT=/home/siemens/prosthetics/3d-reconstruction-prosthetics/prosthelimb.sh

bash ${SCRIPT} $VID > $LOG_FILE 2>&1 &

echo "Script started in the background. Check $LOG_FILE for details."