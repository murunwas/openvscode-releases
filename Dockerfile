FROM gitpod/openvscode-server:latest

#USER root # to get permissions to install packages and such
# Replace shell with bash so we can source files
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
# RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install base dependencies
# RUN  apt update && apt install -y -q --no-install-recommends \
#         apt-transport-https \
#         build-essential \
#         ca-certificates \
#         curl \
#         git \
#         libssl-dev \
#         wget \
#     &&  rm -rf /var/lib/apt/lists/*

ENV NVM_DIR /usr/local/nvm # or ~/.nvm , depending
ENV NODE_VERSION 16.13.2

# Install nvm with node and npm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH
EXPOSE 3001
EXPOSE 3002
EXPOSE 3003
#USER openvscode-server
