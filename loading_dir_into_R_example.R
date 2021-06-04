# an example of loading a file path stored within the config file into R
source("~/.get_config_path.R")
local_glmeiv <- .get_config_path("LOCAL_GLMEIV_DATA_DIR")
local_xie_2019 <- .get_config_path("LOCAL_XIE_2019_DATA_DIR")
remote_gasperini_2019 <- .get_config_path("REMOTE_GASPERINI_2019_DATA_DIR")
