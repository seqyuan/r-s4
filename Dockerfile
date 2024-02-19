FROM ghcr.io/seqyuan/bior-base:1.0

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

#RUN conda install mamba && mamba create -n seurat4 python=3.8.5 r-base=4.3.1

#SHELL ["conda", "run", "-n", "rs4", "/bin/bash", "-c"]
# 成功激活
#RUN  conda activate rs4

#ADD depend.sh /tmp/
ADD install_cmd.R /tmp/
RUN --mount=type=secret,id=GIT_PAT \
  cat /run/secrets/GIT_PAT | xargs echo GITHUB_PAT= >>~/.Renviron && /opt/conda/bin/Rscript /tmp/install_cmd.R


#RUN sh /tmp/depend.sh && /opt/conda/bin/Rscript /tmp/install_cmd.R

#SHELL ["conda", "run", "-n", "rs4", "/bin/bash", "-c"]
#RUN conda install -y mamba

#CMD ["conda", "run", "-n", "rs4", "/bin/bash"]


