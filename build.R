#!/usr/bin/Rscript

# print(Sys.which("python"))
Sys.setenv(RETICULATE_PYTHON = "/opt/conda/bin")

print(Sys.which("python"))
print(reticulate::py_config())



# IMPORT DES DONNEES DEPUIS MINIO
httr::set_config(httr::config(ssl_verifypeer = 0L))
Sys.setenv("AWS_SESSION_TOKEN" ="",
           "AWS_ACCESS_KEY_ID" = "minio",
           "AWS_SECRET_ACCESS_KEY" = "minio123",
           "AWS_DEFAULT_REGION" = "us-east-1",
           "AWS_S3_ENDPOINT" = "minio.alpha.innovation.insee.eu",
           "LIBCURL_BUILD"="winssl")

aws.s3::save_object(object = "sirus_2017.csv", bucket = "bigr",
                    file = "~/data/sirus_2017.csv")

aws.s3::save_object(object = "sirus_abstract.csv", bucket = "bigr",
                    file = "~/data/sirus_abstract.csv")

f = list.files('supports', 'Rmd$', full.names = TRUE, recursive = TRUE)
f = f[!grepl(pattern = "parallel", f)]
o = sapply(f, function(f) rmarkdown::render(f, output_options = list(self_contained = TRUE)))
dir.create('html')
copied = file.copy(o, 'html')
stopifnot(all(copied))
