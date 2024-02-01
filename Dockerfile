FROM continuumio/miniconda3:latest

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN conda create -n rs4  python=3.8.7 r=4.3.2

SHELL ["conda", "run", "-n", "rs4", "/bin/bash", "-c"]
# 成功激活
RUN  conda activate rs4


RUN apt-get update && \
		apt-get install -y \
		libssl-dev \
		gdebi-core \
		libcurl4-gnutls-dev \
		libcairo2-dev \
		libxt-dev \
		xtail \
		libcurl4-openssl-dev \
		build-essential \
		libxml2-dev \
		libcurl4-openssl-dev \
		libhdf5-dev \
		libudunits2-dev \
		imagemagick \
		wget && \
		if [ -e /bin/sh ];then rm /bin/sh ; fi && \
		if [ -e /bin/bash ];then ln -s /bin/bash /bin/sh ; fi

RUN R -e "install.packages(c('BiocManager', 'devtools', 'remotes', 'ggplot2', 'dplyr', 'BPCells', 'presto', 'glmGamPoi', 'rjson', 'Matrix', 'viridis', 'reticulate', 'cowplot'))" && \
		R -e "remotes::install_version('Seurat', '4.4.0', repos = c("https://satijalab.r-universe.dev", getOption('repos')))" && \
		R -e "remotes::install_github('satijalab/seurat-data', quiet = TRUE)" && \
		R -e "remotes::install_github('satijalab/azimuth', quiet = TRUE)" && \
		R -e "remotes::install_github('satijalab/seurat-wrappers', quiet = TRUE)" && \
		R -e "remotes::install_github('mojaveazure/seurat-disk')" && \
		R -e "remotes::install_github('YuLab-SMU/clusterProfiler', upgrade='never')"
		
#SHELL ["conda", "run", "-n", "rs4", "/bin/bash", "-c"]
#RUN conda install -y mamba

CMD ["conda", "run", "-n", "rs4", "/bin/bash"]

