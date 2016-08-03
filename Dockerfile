FROM ubuntu:trusty

# Grab the bare necessities for installing RVM and some Rubies
RUN apt-get update && \
    apt-get install -yq git build-essential curl gnupg && \
    useradd -c "RVM User" -d /home/rvm -G sudo -s /bin/bash -m rvm

USER rvm

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
    curl -sSL https://get.rvm.io | bash -s stable

COPY sudoers /etc/sudoers.d/10-sudo-nopasswd
COPY rvmrc /home/rvm/.rvmrc
