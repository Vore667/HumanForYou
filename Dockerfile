FROM python:3.11-slim

# Empêche Python de générer des fichiers .pyc
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Dépendances système de base pour l'IA
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libgl1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Utilisateur standard pour éviter les problèmes de droits
RUN useradd -ms /bin/bash devuser
USER devuser
WORKDIR /home/devuser/app

# Installation des libs (PyTorch CPU est beaucoup plus léger)
ENV PATH="/home/devuser/.local/bin:${PATH}"
COPY --chown=devuser:devuser requirements.txt .

# Astuce : On force l'installation de la version CPU de Torch pour gagner de la place
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --user torch --index-url https://download.pytorch.org/whl/cpu && \
    pip install --no-cache-dir --user -r requirements.txt

COPY --chown=devuser:devuser . .