FROM python:3.11-slim

# Install Chrome + dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        chromium \
        chromium-driver \
        fonts-liberation \
        libnss3 \
        libatk-bridge2.0-0 \
        libgtk-3-0 \
        libgbm1 \
        libasound2 \
        wget \
        unzip \
    && rm -rf /var/lib/apt/lists/*

# Set Chrome paths for Selenium
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROME_DRIVER=/usr/bin/chromedriver

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Run your script
CMD ["python", "combine_code_milestone_frontend_25.01.2025.py"]

