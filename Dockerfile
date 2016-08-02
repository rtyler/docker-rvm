FROM ubuntu:trusty

# Grab the bare necessities for installing RVM and some Rubies
RUN apt-get update && apt-get install -yq git build-essential curl gnupg
# Accept mpapis' key so we can safely install RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# Grab the latest stable version of RVM
RUN curl -sSL https://get.rvm.io | bash -s stable

COPY rvmrc /root/.rvmrc
