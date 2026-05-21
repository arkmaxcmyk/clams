FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl ca-certificates

RUN curl -sSL https://clams.tech/install.sh | sh

ENV PATH="/root/.local/bin:/root/.cargo/bin:${PATH}"
ENV CLAMS_DATA_ROOT=/data/clams/backend

CMD clams server run --host 0.0.0.0 --port $PORT