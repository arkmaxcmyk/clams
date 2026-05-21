FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl ca-certificates xz-utils

RUN curl -sSL https://clams.tech/install.sh | sh

ENV PATH="/root/.local/bin:/root/.cargo/bin:${PATH}"
ENV CLAMS_DATA_ROOT=/data/clams/backend
ENV CLAMS_SERVER_BIND=0.0.0.0:$PORT
ENV CLAMS_SERVER_ENV=prod

CMD clams server run