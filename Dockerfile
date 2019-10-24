FROM ubuntu:bionic
# Does a build ot the RDKit Python wrappers and runs the tests
# Mainly intended as a demo of what's required to do so
MAINTAINER Md Mahmudulla hassan<mhassan@miners.utep.edu>

# For silent  and  unobtrusive, a perfect frontend for automatic installs
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt install -y \
  curl \
  wget \
  libboost-all-dev \
  cmake \
  git \
  g++ \
#  libeigen-dev \
  python \
  libpython-all-dev \
  python-numpy \
  python-pip \
#  python-pil \
#  python-pandas \
  python-rdkit \
  librdkit1 \
  rdkit-data \
  pymol \
  openbabel \
  python-openbabel \
  imagemagick \
  swig

WORKDIR src/
COPY plip-stable .
RUN python setup.py install
WORKDIR /home/ubuntu
RUN cp -r /src/plip .

RUN useradd -u 1000 -U -G 0 ubuntu
USER ubuntu
#ENTRYPOINT ["python", "plip/plipcmd.py", "-f"]

# Install dependencies
#COPY requirements.txt .
#RUN pip install -r requirements.txt
