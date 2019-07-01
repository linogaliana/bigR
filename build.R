#!/usr/bin/Rscript

print(Sys.which("python"))
Sys.setenv(RETICULATE_PYTHON = "/opt/conda/envs/Reticulate")
reticulate::conda_install("Reticulate", "scipy")
reticulate::conda_install("Reticulate", "statistics")

print(reticulate::py_config())

f = list.files('supports', 'Rmd$', full.names = TRUE, recursive = TRUE)
o = sapply(f, function(f) rmarkdown::render(f, output_options = list(self_contained = TRUE)))
dir.create('html')
copied = file.copy(o, 'html')
stopifnot(all(copied))
