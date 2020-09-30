FROM heroku/heroku:16-build

ENV WORKSPACE_DIR="/app/builds" \
    S3_BUCKET="lang-python" \
    S3_PREFIX="heroku-16/" \
    STACK="heroku-16"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        libsqlite3-dev \
        python3-pip \
        python3-setuptools \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/
RUN pip3 install --disable-pip-version-check --no-cache-dir -r /app/requirements.txt

COPY . /app
