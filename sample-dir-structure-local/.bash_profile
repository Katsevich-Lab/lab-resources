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
function update_repos() {
  orig_dir=$(pwd)
  for dir in $LOCAL_CODE_DIR*
	do
	  cd $dir
	  echo "Updating "$(basename $dir)"..."
    if [[ -e ".git" ]]; then
      # determine whether the working directory is clean
      [ $(echo $(git status) | grep "working tree clean" | wc -c) != 0 ] ; is_clean=$?
      # if working directory is not clean, then commit existing changes
      if [[ ! $is_clean ]]; then
        git add --all
        git commit -m "Committing changes before pulling"
      fi
  		status=$(git pull)
  		if [[ $status != "Already up-to-date." && $status != "Already up to date." ]]; then
  		  if [[ -e "DESCRIPTION" ]]; then
  		    Rscript -e "devtools::install(build = FALSE, upgrade = 'never')"
  		  fi
  		fi
    fi
	done

	# go back to original directory
	cd $orig_dir
}