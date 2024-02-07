FROM continuumio/miniconda3:latest

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

#RUN conda install mamba && mamba create -n seurat4 python=3.8.5 r-base=4.3.1

#SHELL ["conda", "run", "-n", "rs4", "/bin/bash", "-c"]
# 成功激活
#RUN  conda activate rs4


RUN apt-get update && \
		apt-get install -y \
		libssl-dev \
		gdebi-core \
		#libcurl4-gnutls-dev \
		libcairo2-dev \
		libxt-dev \
		xtail \
		build-essential \
		libxml2-dev \
		libcurl4-openssl-dev \
		libhdf5-dev \
		libudunits2-dev \
		imagemagick && \
		if [ -e /bin/sh ];then rm /bin/sh ; fi && \
		if [ -e /bin/bash ];then ln -s /bin/bash /bin/sh ; fi

RUN conda install r-base=4.3.1
RUN echo "options(BioC_mirror='https://mirrors.tuna.tsinghua.edu.cn/bioconductor')" >> ~/.Rprofile && \
		echo "options('repos' = c(CRAN='https://mirrors.tuna.tsinghua.edu.cn/CRAN/'))" >> ~/.Rprofile && \
		conda install r-biocmanager && \
		conda install bioconductor-deseq2 && \
		conda install r-devtools && \
		conda install r-remoter && \
		conda install r-ggplot2 && \
		conda install r-dplyr && \
		conda install r-bpcells && \
		conda install r-presto && \
		conda install bioconductor-glmgampoi && \
		conda install r-rjson && \
		conda install r-viridis && \
		conda install r-reticulate && \
		conda install r-cowplot && \
		conda install r-reshape2 && \
		conda install r-ggsci && \
		conda install r-rcolorbrewer && \
		conda install r-patchwork && \
		conda install r-pheatmap && \
		conda install r-ggpubr && \
		conda install r-ggalluvial && \
		conda install r-harmony && \
		conda install r-configr && \
		conda install r-scales && \
		conda install r-gridextra && \
		conda install bioconductor-org.hs.eg.db && \
		conda install bioconductor-org.mm.eg.db && \
		conda install bioconductor-reactomepa && \
		conda install bioconductor-msigdbr && \
		conda install bioconductor-dose && \
		conda install bioconductor-enrichplot && \
		conda install bioconductor-degseq && \
		conda install bioconductor-limma && \
		conda install bioconductor-gsva && \
		conda install bioconductor-complexheatmap && \
		conda install bioconductor-clusterprofiler

ADD install_cmd.R /tmp/
RUN /opt/conda/bin/Rscript /tmp/install_cmd.R


		
#SHELL ["conda", "run", "-n", "rs4", "/bin/bash", "-c"]
#RUN conda install -y mamba

#CMD ["conda", "run", "-n", "rs4", "/bin/bash"]

