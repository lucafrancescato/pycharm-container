FROM ubuntu:20.04

ARG PYCHARM_VERSION="2020.2.3"

ENV DEBIAN_FRONTEND=noninteractive

# Install wget and other required libraries for pycharm to be rendered
RUN apt-get update \
    && apt-get install -y --no-install-recommends libxrender1 libxtst6 libxi6 libfontconfig1 \
    && apt-get install -y wget python3 python3-venv \
    && apt-get autoclean -y \
    && apt-get clean -y

# Download and extract Pycharm
RUN mkdir -p /opt/pycharm && \
    wget -qO- https://download.jetbrains.com/python/pycharm-community-${PYCHARM_VERSION}.tar.gz | tar xz --strip 1 -C /opt/pycharm

# Clean up
RUN apt-get purge wget -y && apt-get --purge autoremove -y && apt-get autoclean -y

ARG USER=vncuser

ENV DISPLAY=:0 \
    USER=${USER} \
    HOME=/home/$USER/

# Create new user and set a set a valid shell for them
RUN useradd -ms /bin/bash $USER

# Unpack Pycharm pre-configurations (Pycharm configuration and consent options on license and usage stats)
ADD ["pycharm-preconf-${PYCHARM_VERSION}.tar.gz", "$HOME"]

CMD su -p $USER -c "/opt/pycharm/bin/pycharm.sh $PROJECT_DIR"
