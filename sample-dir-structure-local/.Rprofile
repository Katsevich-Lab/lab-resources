if (interactive()) {
  suppressMessages(require(devtools))
}
.get_config_path <- function(dir_name) {
  cmd <- paste0("source ~/.research_config; echo $", dir_name)
  system(command = cmd, intern = TRUE)
}
utils::setRepositories(ind = c(1L, 2L))
