FROM ubuntu:24.04

# Avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3-dev python3-pip python3-venv \
    libxml2-dev libxslt1-dev libevent-dev libsasl2-dev \
    libldap2-dev libpq-dev libpng-dev libjpeg-dev \
    build-essential node-less npm git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install RTL support for right-to-left languages
RUN npm install -g rtlcss

# Create a system user for Odoo
RUN useradd -m -U -r -d /opt/odoo -s /bin/bash odoo

# Optimization: Install Python requirements separately for better caching
COPY ./src/requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir --break-system-packages -r /tmp/requirements.txt

# Set ODOO_RC environment variable
ENV ODOO_RC /etc/odoo/odoo.conf

# Give ownership to odoo user
RUN chown -R odoo:odoo /opt/odoo

USER odoo