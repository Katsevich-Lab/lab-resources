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

# update all code and packages
for dir in $CODE_DIR*/
do
	cd $dir
	if [[ -e ".git" ]]; then
	    # If git repo, then pull. Print informative message.
	    status=$(git pull)
	    if [[ $status == "Already up-to-date." || $status == "Already up to date." ]]; then
		    echo "$dir is up to date."
	    else
    		echo "Updating $dir."
    		if [[ -e "DESCRIPTION" ]]; then
    		    Rscript -e "devtools::install()"
        fi
	    fi
	fi
done
cd ~
