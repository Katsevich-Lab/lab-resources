######################################################################
#
# Configuration file to set paths to data corresponding to each 
# project and to each paper written by others. A file like this should 
# reside in the root directory of each machine that you use. 
#
######################################################################

# local and remote paths to top-level data directories
local_internal_data_dir   = "/Users/ekatsevi/data/projects"
local_external_data_dir   = "/Users/ekatsevi/data/external"
remote_internal_data_dir  = "Box:data/projects"
remote_external_data_dir  = "Box:data/external"

# local paths to specific data directories
local_sceptre_data_dir = paste0(local_internal_data_dir, "/sceptre")
local_glmeiv_data_dir  = paste0(local_internal_data_dir, "/glmeiv")
local_lowmoi_data_dir  = paste0(local_internal_data_dir, "/lowmoi")

local_schraivogel_2020_data_dir = paste0(local_external_data_dir, "/schraivogel-2020-test")
local_gasperini_2019_data_dir   = paste0(local_external_data_dir, "/gasperini-2019")
local_xie_2019_data_dir         = paste0(local_external_data_dir, "/xie-2019")

# remote paths to specific data directories
remote_sceptre_data_dir = paste0(remote_internal_data_dir, "/sceptre")
remote_glmeiv_data_dir  = paste0(remote_internal_data_dir, "/glmeiv")
remote_lowmoi_data_dir  = paste0(remote_internal_data_dir, "/lowmoi")

remote_schraivogel_2020_data_dir = paste0(remote_external_data_dir, "/schraivogel-2020-test")
remote_gasperini_2019_data_dir   = paste0(remote_external_data_dir, "/gasperini-2019")
remote_xie_2019_data_dir         = paste0(remote_external_data_dir, "/xie-2019")
