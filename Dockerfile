FROM rocker/verse
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN adduser rstudio sudo
RUN apt update && apt install -y software-properties-common
RUN Rscript --no-restore --no-save -e "install.packages('tidyverse')"
RUN Rscript --no-restore --no-save -e "install.packages('ggplot2')"
RUN Rscript --no-restore --no-save -e "install.packages('knitr')"
RUN Rscript --no-restore --no-save -e "install.packages('caTools')"
RUN Rscript --no-restore --no-save -e "install.packages('caret')"
RUN Rscript --no-restore --no-save -e "install.packages('rpart')"
RUN Rscript --no-restore --no-save -e "install.packages('rpart.plot')"
RUN Rscript --no-restore --no-save -e "install.packages('keras')"
RUN Rscript --no-restore --no-save -e "install.packages('mlbench')"
RUN Rscript --no-restore --no-save -e "install.packages('dplyr')"
RUN Rscript --no-restore --no-save -e "install.packages('magrittr')"
RUN Rscript --no-restore --no-save -e "install.packages('neuralnet')"
