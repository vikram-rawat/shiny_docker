# Base image
FROM ixpantia/faucet:r4.4

# Environment variables for renv
ENV RENV_CONFIG_CACHE_SYMLINKS=FALSE
ENV RENV_PATHS_LIBRARY=/srv/faucet/renv/library

# install R shiny
RUN Rscript -e "install.packages('shiny')"

# Copy the root files and directories to the container
COPY app1/ app1/
COPY app2/ app2/
COPY home/ home/
COPY frouter.toml frouter.toml

# Set working directory and restore packages for app1
# WORKDIR /srv/faucet/app1
# RUN Rscript -e "tryCatch(renv::restore(), error = function(e) { warning('app1 renv restore failed: ', e) })"

# # Set working directory and restore packages for app2
# WORKDIR /srv/faucet/app2
# RUN Rscript -e "tryCatch(renv::restore(), error = function(e) { warning('app2 renv restore failed: ', e) })"

# # Set working directory and restore packages for home
# WORKDIR /srv/faucet/home
# RUN Rscript -e "tryCatch(renv::restore(), error = function(e) { warning('home renv restore failed: ', e) })"

# Reset working directory to root
# WORKDIR /srv/faucet

# open the port for normal people
EXPOSE 3838

# Permissions settings
RUN chown -R faucet:faucet /srv/faucet/
USER faucet

# Enable graceful shutdown
ENV FAUCET_SHUTDOWN=graceful

# Command to start the router
CMD ["router"]
