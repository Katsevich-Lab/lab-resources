# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# check whether on a compute node
if command -v R &> /dev/null
then
    # source research config file
    source ~/.research_config

    # get SSH information
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519

    # load up-to-date versions of gcc and R
    module load gcc/gcc-11.1.0
    module load R/R-4.1.2

    # update all code and packages 
    for dir in $CODE_DIR*
    do
	cd $dir
	if [[ -e ".git" ]]; then
	    # If git repo, then pull. Print informative message.
	    status=$(git pull)
	    if [[ $status == "Already up-to-date." ]]; then
		echo "$dir is up to date."
	    else
		echo "Updating $dir."
		if [[ -e "DESCRIPTION" ]]; then
		    Rscript -e "devtools::install()"
	        fi
	    fi
	fi
    done
fi
cd ~
