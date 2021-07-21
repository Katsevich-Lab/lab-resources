source ~/.research_config
packages_installed=false

for dir in $LOCAL_CODE_DIR/*
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
          Rscript -e "devtools::build(); devtools::install()"
          packages_installed=true
      fi
    fi
  fi
done

# If pacakges have been installed, clean up.
if [[ $packages_installed = true ]]; then
  rm $LOCAL_CODE_DIR*.tar.gz
fi
