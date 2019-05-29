FROM rocker/binder:latest
LABEL maintainer="karthik"
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
## Become normal user again
USER ${NB_USER}
RUN wget https://github.com/karthik/binder-sdss/raw/master/DESCRIPTION && 
R -e "devtools::install_deps()"
