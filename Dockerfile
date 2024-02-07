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
		conda install r-devtools && \
		r-BiocManager && \
		r-remoter && \
		r-ggplot2 && \
		r-dplyr  && \
		r-BPCells && \
		r-presto && \
		r-glmGamPoi	&& \
		r-rjson && \
		r-viridis && \
		r-reticulate && \
		r-cowplot && \
		r-reshape2 && \
		r-ggsci && \
		r-RColorBrewer && \
		r-patchwork && \
		r-pheatmap && \
		r-ggpubr && \
		r-ggalluvial && \
		r-harmony && \
		r-configr && \
		r-scales && \
		r-gridExtra && \
		bioconda::bioconductor-org.hs.eg.db && \
		bioconda::bioconductor-org.Mm.eg.db && \
		bioconda::bioconductor-ReactomePA && \
		bioconda::bioconductor-msigdbr && \
		bioconda::bioconductor-DOSE && \
		bioconda::bioconductor-enrichplot && \
		bioconda::bioconductor-DESeq2 && \
		bioconda::bioconductor-DEGseq && \
		bioconda::bioconductor-limma && \
		bioconda::bioconductor-gsva && \
		bioconda::bioconductor-complexheatmap

ADD install_cmd.R /tmp/
RUN /opt/conda/bin/Rscript /tmp/install_cmd.R


		
#SHELL ["conda", "run", "-n", "rs4", "/bin/bash", "-c"]
#RUN conda install -y mamba

#CMD ["conda", "run", "-n", "rs4", "/bin/bash"]

