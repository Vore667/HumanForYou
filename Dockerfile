FROM python:3.11-slim

# 1. Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
# Ensure pip installs to a global path accessible by root
ENV PATH="/usr/local/bin:${PATH}"

# 2. System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libgl1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 3. Set Workdir (Using /app is standard for root)
WORKDIR /app

# 4. Install Python dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir torch --index-url https://download.pytorch.org/whl/cpu && \
    pip install --no-cache-dir -r requirements.txt

# 5. Copy project files
# Note: We removed --chown because root owns everything by default
COPY . .

# 6. Ensure we stay as root
USER root