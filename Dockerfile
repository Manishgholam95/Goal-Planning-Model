FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y chromium && \
    apt-get install -y chromium-driver

ENV CHROME_BIN=/usr/bin/chromium
ENV CHROME_DRIVER=/usr/bin/chromedriver

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

#CMD ["python", "combine_code_milestone_frontend_25.01.2025.py"]
CMD ["streamlit", "run", "combine_code_milestone_frontend_25.01.2025.py", "--server.port=8501", "--server.address=0.0.0.0"]

