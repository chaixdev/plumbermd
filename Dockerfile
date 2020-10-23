FROM rocker/r-base:4.0.3
RUN apt-get update -qq && apt-get install -y \
      libssl-dev \
      libcurl4-gnutls-dev \
      libsodium-dev \
      pandoc
RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('rmarkdown')"
RUN R -e "install.packages('ggplot2')"
RUN R -e "install.packages('lattice')"
RUN R -e "install.packages('knitr')"
COPY / /

EXPOSE 80

ENTRYPOINT ["Rscript", "run.R"]