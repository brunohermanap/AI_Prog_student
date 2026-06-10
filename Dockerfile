FROM python:3.11

WORKDIR /workspace

RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip uv

COPY requirements.txt .

# Install ONLY fast base
RUN uv pip install --system -r requirements.txt

CMD ["sleep", "infinity"]