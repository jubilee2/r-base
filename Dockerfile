FROM r-base:4.4.1

# set timezone = America/Chicago
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

## Revert to the original state before pinning Debian unstable
RUN rm /etc/apt/sources.list.d/debian-unstable.list \
        && rm /etc/apt/apt.conf.d/default \
        && rm /etc/apt/apt.conf.d/90local-no-recommends

# blastula
#  libsodium-dev \
#  libcurl4-openssl-dev \
#  libxml2-dev \
#  libssl-dev \
# devtools
#  libfontconfig1-dev
#  libharfbuzz-dev libfribidi-dev 
#  libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev
# doBy
#  cmake
# ggpattern
#  libudunits2-dev
#  libmagick++-dev 
#  libgdal-dev
# gtsummary
#  libv8-dev
# knitr
#  cargo

# install system dependencies
# libharfbuzz-dev 
RUN apt-get update && apt-get install -y \
  libsodium-dev \
  libcurl4-openssl-dev \
  libxml2-dev \
  libssl-dev \
  libfontconfig1-dev \
  libfribidi-dev \
  libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev \
  cmake \
  libudunits2-dev \
  libmagick++-dev \
  libgdal-dev \
  libv8-dev \
  cargo

RUN Rscript -e "withCallingHandlers(install.packages('blastula', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('boxr', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('data.table', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('devtools', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('doBy', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('DT', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('eeptools', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('evaluate', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('extrafont', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('flexdashboard', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('geepack', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('ggpattern', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('ggplot2', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('ggplotify', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('ggpubr', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('ggridges', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('ggsci', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('ggvenn', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('greport', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('gtsummary', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('Hmisc', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('htmlTable', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('htmltools', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('janitor', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('kableExtra', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('keyring', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('kinship2', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('knitr', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('mice', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('modeest', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('multgee', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('nlme', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('openxlsx', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('ordinal', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('pairwiseCI', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('plotly', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('plumber', clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('quarto', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('rccola', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('RCurl', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('redcapAPI', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('reshape', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('reshape2', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('rmarkdown', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('rmdformats', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('rstantools', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('rms', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('sjlabelled', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('skimr', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('survminer', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('table1', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('tangram', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('tangram.pipe', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('tibble', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('tidyverse', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('VIM', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
RUN Rscript -e "withCallingHandlers(install.packages('writexl', dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3),warning=stop);"
