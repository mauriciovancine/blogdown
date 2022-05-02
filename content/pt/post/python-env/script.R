library(reticulate)

reticulate::virtualenv_create("env_r")
reticulate::virtualenv_list()
reticulate::virtualenv_remove("env_r")
reticulate::use_virtualenv("~/.virtualenvs/env_r")

reticulate::py_install("geopandas")

reticulate::repl_python()

# https://pt.linuxteaching.com/article/how_to_set_up_python_virtual_environment_on_ubuntu