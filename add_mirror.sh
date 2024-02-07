conda config --add channels conda-forge
conda config --add channels defaults
conda config --add channels r
conda config --add channels bioconda
#conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/
#conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
#conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
#conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/

echo "options(BioC_mirror='https://mirrors.tuna.tsinghua.edu.cn/bioconductor')" >> ~/.Rprofile
echo "options('repos' = c(CRAN='https://mirrors.tuna.tsinghua.edu.cn/CRAN/'))" >> ~/.Rprofile

