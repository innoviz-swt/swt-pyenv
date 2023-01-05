# syntax based on https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
# default BASE
ARG BASE="focal"

# Start from base image of ubuntu - see https://hub.docker.com/_/ubuntu 
FROM ubuntu:${BASE}

# Run enviroment setup flow
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y \
  curl \
  git \
  ca-certificates \
  build-essential \
  ## pyenv - python dependencies, https://github.com/pyenv/pyenv/wiki/Common-build-problems
  libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev python-openssl\
  # clean apt-get cache
  && apt-get clean && rm -rf /var/lib/apt/lists/*
 
# pyenv, https://github.com/pyenv/pyenv
RUN curl https://pyenv.run | bash
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
ENV PATH $PYENV_ROOT/shims:$PATH

RUN echo "" >> ~/.bashrc && \
    echo "# pyenv" >> ~/.bashrc && \
    echo "eval \"\$(pyenv init -)\"" >> ~/.bashrc && \
    echo "" >> ~/.bashrc

# Set docker labels
# version format: "{major}.{minor}.{patch}"
ARG VER BUILD BASE
LABEL version=${VER} \
      build=${BUILD} \
      base=${BASE} \
      description="This is Docker Image with pyenv installed." \
      source-code="https://github.com/innoviz-swt/swt-pyenv"

# Set default CMD
CMD ["/bin/bash"]