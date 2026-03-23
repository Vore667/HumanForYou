# Image de base légère avec Python 3.11
FROM mcr.microsoft.com/devcontainers/python:3.11

# Mise à jour et installation de dépendances système si besoin
RUN apt-get update && apt-get install -y git curl

# Installation des libs Python de notre projet
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt