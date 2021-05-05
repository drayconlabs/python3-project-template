FROM python:3.9-slim-buster
ARG DEBIAN_FRONTEND=noninteractive
ENV user worker

# Install required tools and set folder permissions for "worker" user
RUN apt-get update \
    && useradd -m -d /home/${user} ${user}

WORKDIR /home/${user}/
COPY requirements.txt /home/${user}/
COPY configs/ /home/${user}/configs/
COPY src/ /home/${user}/src/
RUN chown -R ${user} /home/${user} \
    && pip3 install -r requirements.txt