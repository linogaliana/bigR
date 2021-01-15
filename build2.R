#!/usr/bin/Rscript

# print(Sys.which("python"))

# print(Sys.which("python"))
# print(reticulate::py_config())

f = list.files('supports', 'Rmd$', full.names = TRUE, recursive = TRUE)
f = f[grepl(pattern = "parallel", f)]
o = sapply(f, function(f) rmarkdown::render(f, output_options = list(self_contained = TRUE)))
dir.create('html')
copied = file.copy(o, 'html')
stopifnot(all(copied))
