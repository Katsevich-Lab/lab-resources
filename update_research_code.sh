source ~/.research_config

for dir in $LOCAL_CODE_DIR*
do
  cd $dir
  if [[ -e ".git" ]]; then
    # If git repo, then pull. Print informative message.
    status=$(git pull)
    if [[ $status == "Already up to date." ]]; then
      echo "$dir is up to date."
    else
      echo "Updating $dir."
      # If R package, build and install.
      if [[ -e "DESCRIPTION" ]]; then
	  pkgname="$(basename $dir)"
	  Rscript -e "devtools::install_github('timothy-barry/$pkgname')"
      fi
    fi
  fi
done

