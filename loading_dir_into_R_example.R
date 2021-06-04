# An example of loading file paths stored within the .reseaerch_config file into R.

local_glmeiv <- .get_config_path("LOCAL_GLMEIV_DATA_DIR")
local_xie_2019 <- .get_config_path("LOCAL_XIE_2019_DATA_DIR")
remote_gasperini_2019 <- .get_config_path("REMOTE_GASPERINI_2019_DATA_DIR")

# In Rstudio, click the broom icon to clear all variables from the global environment.
# Make sure "Include hidden objects" is NOT checked to retain the .get_config_path function.