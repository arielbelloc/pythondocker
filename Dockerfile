FROM python:2.7.18

RUN apt-get update && apt-get install -y \
    build-essential \
    python-dev \
    libxslt1-dev \
    libxml2-dev \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    lib32z1-dev \
    lib32ncurses5-dev \
    libaio1 \
    unzip \
    wget

RUN mkdir /app
WORKDIR /app

ADD requirements.txt /app/
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf /var/lib/apt/lists/*

VOLUME /app/scripts

CMD ["python", "/app/scripts/rates/get_rates.py"]
