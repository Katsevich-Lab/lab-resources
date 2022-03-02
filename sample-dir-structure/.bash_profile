# Set up Terminal colors
export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegedabagaced

# Source research config file containing paths to data directories
source ~/.research_config

# Define hpcc function to pull/push from/to HPCC
function hpcc() {
  COMMAND=$1
  NAME=$2
  OPTIONS=$3
  LOCAL_DIR=$"LOCAL_"$NAME"_DATA_DIR"
  REMOTE_DIR=$"REMOTE_"$NAME"_DATA_DIR"
  if [ $COMMAND = "pull" ] 
  then
    rsync -rltvP ${!REMOTE_DIR} ${!LOCAL_DIR} $OPTIONS
  fi
  if [ $COMMAND = "push" ]
  then
    rsync -rltvP ${!LOCAL_DIR} ${!REMOTE_DIR} $OPTIONS
  fi
}