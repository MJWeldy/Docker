#Note: gpu use requires nvidia-docker runtime to run!
#https://github.com/NVIDIA/nvidia-docker/

# CPU-only
# docker run --rm -ti rocker/ml R
# Machines with nvidia-docker and GPU support
# docker run --gpus all --rm -ti rocker/ml-gpu R

FROM rocker/ml-verse:latest
MAINTAINER Matt Weldy

#USETHIS for github token
# WRITE RETICULATE_PYTHON VARIABLE IN .Renviron
#RUN echo "RETICULATE_PYTHON = '/opt/venv/reticulate/bin/python'" > .Renviron

#General R packages 
RUN R -e "install.packages('rgdal', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rcppeigen', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('bayesplot', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('brms', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidybayes', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('coda', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('igraph', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('R6', repos='http://cran.rstudio.com/')"

##Reticulate
RUN R -e "install.packages('reticulate', repos='http://cran.rstudio.com/')"
RUN echo "RETICULATE_PYTHON = '/opt/venv/reticulate/bin/python'" > .Renviron

##JAGS
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
  jags \
  mercurial gdal-bin libgdal-dev gsl-bin libgsl-dev \ 
  libc6-i386
RUN R -e "install.packages('rjags', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('R2jags', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('jagsUI', repos='http://cran.rstudio.com/')"

##Nimble
#RUN R -e "install.packages('nimble', repos='http://cran.rstudio.com/')"

##BUGS
#RUN wget -nd -P /tmp http://pj.freefaculty.org/Debian/squeeze/amd64/openbugs_3.2.2-1_amd64.deb
#RUN dpkg -i /tmp/openbugs_3.2.2-1_amd64.deb && rm /tmp/openbugs_3.2.2-1_amd64.deb 

#RUN R -e "install.packages('R2OpenBUGS', repos='http://cran.rstudio.com/')"

##Stan
#RUN R -e "install.packages('rstan', repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages('rstantools', repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages('rstanarm', repos='http://cran.rstudio.com/')"

#Greta 
#RUN R -e "install.packages('tensorflow', repos='http://cran.rstudio.com/')"
#RUN R -e "tensorflow::install_tensorflow()"
#RUN R -e "install.packages('greta', repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages('DiagrammeR', repos='http://cran.rstudio.com/')"

##INLA
#RUN R -e "install.packages('INLA',repos='https://inla.r-inla-download.org/R/stable', dep=TRUE)"
#RUN R -e "install.packages('INLA',repos='https://inla.r-inla-download.org/R/stable')"
#RUN install2.r --error \
#  --repos "https://inla.r-inla-download.org/R/stable" \
#  INLA 

#Torch
#install.packages("torch"); library(torch); torch::cuda_is_available()
#R -e "reticulate::install_miniconda()"
#R -e 'reticulate::py_install("tensorflow-gpu==1.5")'
