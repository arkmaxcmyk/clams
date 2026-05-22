FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    xz-utils \
    findutils

RUN curl -sSL https://clams.tech/install.sh | sh

RUN CLAMS_BIN="$(find / -name clams -type f 2>/dev/null | head -n 1)" && \
    test -n "$CLAMS_BIN" || (echo "clams binary not found" && exit 1) && \
    ln -s "$CLAMS_BIN" /usr/local/bin/clams

ENV CLAMS_DATA_ROOT=/data/clams/backend
ENV CLAMS_SERVER_ENV=prod

RUN mkdir -p /data/clams/backend

EXPOSE 8080

CMD ["sh", "-c", "CLAMS_SERVER_BIND=0.0.0.0:${PORT} clams server run"]