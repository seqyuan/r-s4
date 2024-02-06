install.packages(c('BiocManager', 'devtools', 'remotes', 'ggplot2', 'dplyr', 'BPCells', 'presto', 'glmGamPoi', 'rjson', 'Matrix', 'viridis', 'reticulate', 'cowplot'))
remotes::install_version('Seurat', '4.1.4', repos = c("https://satijalab.r-universe.dev", getOption('repos')))
remotes::install_github('satijalab/seurat-data', quiet = TRUE)
remotes::install_github('satijalab/azimuth', quiet = TRUE)
remotes::install_github('satijalab/seurat-wrappers', quiet = TRUE)
remotes::install_github('mojaveazure/seurat-disk')
remotes::install_github('YuLab-SMU/clusterProfiler', upgrade='never')
BiocManager::install(c('enrichplot', 'DOSE', 'msigdbr', 'ReactomePA', 'org.Hs.eg.db', 'org.Mm.eg.db', 'DESeq2', 'DEGseq'))

