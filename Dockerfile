# Base image
FROM ixpantia/faucet:r4.4

# install R shiny
RUN Rscript -e "install.packages('shiny')"

# Copy the root files and directories to the container
COPY app1/ app1/
COPY app2/ app2/
COPY home/ home/
COPY frouter.toml frouter.toml

# open the port for normal people
EXPOSE 3838

# Permissions settings
RUN chown -R faucet:faucet /srv/faucet/
USER faucet

# Enable graceful shutdown
ENV FAUCET_SHUTDOWN=graceful

# Command to start the router
CMD ["router"]
