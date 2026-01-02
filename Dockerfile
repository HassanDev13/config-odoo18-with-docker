FROM ubuntu:24.04

# Avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3-dev python3-pip python3-venv \
    libxml2-dev libxslt1-dev libevent-dev libsasl2-dev \
    libldap2-dev libpq-dev libpng-dev libjpeg-dev \
    build-essential node-less npm git \
    && apt-get clean

# Install RTL support for right-to-left languages
RUN npm install -g rtlcss

# Install Python requirements from the source folder
# Using --break-system-packages for Ubuntu 24.04 compatibility
COPY ./src/requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir --break-system-packages -r /tmp/requirements.txt

# Create a system user for Odoo
RUN useradd -m -U -r -d /opt/odoo -s /bin/bash odoo
USER odoo