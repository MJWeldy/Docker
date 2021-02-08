#Note: gpu use requires nvidia-docker runtime to run!
#https://github.com/NVIDIA/nvidia-docker/

# CPU-only
# docker run --rm -ti rocker/ml R
# Machines with nvidia-docker and GPU support
# docker run --gpus all --rm -ti rocker/ml-gpu R

FROM rocker/ml-verse:latest
#MAINTAINER Matt Weldy

RUN apt-get update

#If I want to add static datafiles to a build
#ADD data/gapminder-FiveYearData.csv /home/rstudio/

##Reticulate
##RUN echo "RETICULATE_PYTHON = '/opt/venv/reticulate/bin/python'" > .Renviron
#RUN install2.r --error \
#  --repos "https://stat.ethz.ch/CRAN/" \
#  reticulate
  
#USETHIS for github token 
# WRITE RETICULATE_PYTHON VARIABLE IN .Renviron
#RUN echo "RETICULATE_PYTHON = '/opt/venv/reticulate/bin/python'" > .Renviron

# adding deps separately so it may build in dockerhub (works on my WS)
#RUN apt-get install -y r-cran-rcpp r-cran-rcppeigen

#General R packages 
#RUN R -e "install.packages('rcppeigen', repos='http://cran.rstudio.com/')"

#RUN install2.r --error \
#  --repos "https://stat.ethz.ch/CRAN/" \
#  styler \
#  datapasta \
#  bayesplot \
#  #tidybayes \
#  coda \
#  igraph 
  
##JAGS
#RUN apt-get install -y --no-install-recommends \
#  jags \
#  mercurial gdal-bin libgdal-dev gsl-bin libgsl-dev \ 
#  libc6-i386

#RUN install2.r --error \
#  --repos "https://stat.ethz.ch/CRAN/" \
#  rjags \
#  R2jags \ 
#  jagsUI 
  
##Nimble
#RUN install2.r --error \
#  --repos "https://stat.ethz.ch/CRAN/" \
#  nimble

##BUGS
#RUN wget -nd -P /tmp http://pj.freefaculty.org/Debian/squeeze/amd64/openbugs_3.2.2-1_amd64.deb
#RUN dpkg -i /tmp/openbugs_3.2.2-1_amd64.deb && rm /tmp/openbugs_3.2.2-1_amd64.deb 

#RUN install2.r --error \
#  --repos "https://stat.ethz.ch/CRAN/" \
#  R2OpenBUGS
  
##Stan
#RUN install2.r --error \
#  --repos "https://stat.ethz.ch/CRAN/" \
#  rstan \
#  rstantools \ 
#  rstanarm \
#  brms 

#Greta will not work without reinstalling tensorflow version incompatibility
#RUN install2.r --error \
#  --repos "https://stat.ethz.ch/CRAN/" \
#  tensorflow \
#  greta \ 
#  DiagrammeR
##RUN R -e "tensorflow::install_tensorflow(version = "1.14.0")"
#R -e "reticulate::py_install('tensorflow-probability')"
#  install_tensorflow(
#    version = "1.14.0",
#    extra_packages = "tensorflow-probability"
#  )
##RUN R -e "install.packages('tensorflow', repos='http://cran.rstudio.com/')"
##RUN R -e "tensorflow::install_tensorflow()"
#RUN R -e "install.packages('greta', repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages('DiagrammeR', repos='http://cran.rstudio.com/')"

###INLA install using wget to avoid install.packages timeout error from the INLA repo
#RUN install2.r --error \
#  --repos "https://stat.ethz.ch/CRAN/" \
#  foreach
#RUN wget -nd -P /tmp https://inla.r-inla-download.org/R/testing/src/contrib/INLA_21.01.26.tar.gz
#RUN R -e "install.packages('/tmp/INLA_21.01.26.tar.gz', repos = NULL, type='source')"


##Torch
#RUN install2.r --error \
#  --repos "https://stat.ethz.ch/CRAN/" \
#  torch 
#RUN R -e "reticulate::py_install('torch')"

#R -e "torch::cuda_is_available()"
##R -e "reticulate::install_miniconda()"
##R -e 'reticulate::py_install("tensorflow-gpu==1.5")'
