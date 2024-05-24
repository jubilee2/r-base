FROM r-base:4.4.0

# set timezone = America/Chicago
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install system dependencies
RUN apt-get update

RUN Rscript -e "install.packages(c('blastula', 'boxr', 'cmdstanr', 'data.table', 'devtools', 'doBy', 'DT', 'dyplr', 'eeptools', 'evaluate', 'extrafont', 'flexdashboard', 'geepack', 'ggpattern', 'ggplot2', 'ggplotify', 'ggpubr', 'ggridges', 'ggsci', 'ggvenn', 'greport', 'gtsummary', 'Hmisc', 'hreport', 'htmlTable', 'htmltools', 'janitor', 'kableExtra', 'keyring', 'kinship2', 'knitr', 'mice', 'modeest', 'multgee', 'nlme', 'openxlsx', 'ordinal', 'pairwiseCI', 'plotly', 'plumber', 'quarto', 'rccola', 'RCurl', 'redcapAPI', 'reshape', 'reshape2', 'rmarkdown', 'rmdformats', 'rms', 'rstantools', 'sjlabelled', 'skimr', 'survminer', 'table1', 'tangram', 'tangram.pipe', 'tibble', 'tidyverse', 'VIM', 'writexl'), dependencies=TRUE, clean = TRUE, quiet = TRUE, Ncpus = 3);"
