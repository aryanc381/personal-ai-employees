FROM node:24-bookworm-slim

ARG OPENCLAW_VERSION=2026.6.11

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates git openssh-client \
  && npm install -g "openclaw@${OPENCLAW_VERSION}" \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash sunday

USER sunday
WORKDIR /app

EXPOSE 18789

CMD ["openclaw", "gateway", "run", "--allow-unconfigured", "--bind", "auto", "--auth", "token", "--port", "18789"]
