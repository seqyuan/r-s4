remotes::install_version("SeuratObject", "4.1.4", repos = c("https://satijalab.r-universe.dev", getOption("repos")))
remotes::install_version(package = 'Seurat', version = package_version('4.4.0'))
devtools::install_version("Matrix",version = "1.6.1.1", INSTALL_opts = '--no-lock', force=TRUE)
remotes::install_github('satijalab/seurat-data', quiet = TRUE)
remotes::install_github('satijalab/azimuth', quiet = TRUE)
remotes::install_github('satijalab/seurat-wrappers', quiet = TRUE)
remotes::install_github('mojaveazure/seurat-disk')
remotes::install_github('YuLab-SMU/clusterProfiler', upgrade='never')

