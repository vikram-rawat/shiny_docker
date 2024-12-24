# Base image for our image
FROM ixpantia/faucet:r4.4

# Install the packages we need
RUN Rscript -e "install.packages(c('shiny'))"

# Copy the file app.R from our computer to the image
COPY app/app.R app


# Set four workers
ENV FAUCET_WORKERS=4

# Enable graceful shutdown
ENV FAUCET_SHUTDOWN=graceful
