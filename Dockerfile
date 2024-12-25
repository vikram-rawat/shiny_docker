FROM ixpantia/faucet:r4.4

# Some environment variables to tell `renv`
# to install packages in the correct location
# and without unnecessary symlinks
ENV RENV_CONFIG_CACHE_SYMLINKS FALSE
ENV RENV_PATHS_LIBRARY /srv/faucet/renv/library

# You copy the necessary files to bootstrap `renv`
COPY ./renv.lock .
COPY ./renv ./renv
COPY ./.Rprofile .

# You install the packages
RUN Rscript -e "renv::restore()"

# Copy the app/API files in this case replace
# `app.R` with `plumber.R` if you are using a
# Plumber API
COPY app/app.R .

# You can run the container as a non-root user
# for security reasons if we want to though
# this is not necessary. You could ignore this
RUN chown -R faucet:faucet /srv/faucet/
USER faucet

# Set four workers
# ENV FAUCET_WORKERS=2

# Enable graceful shutdown
ENV FAUCET_SHUTDOWN=graceful
