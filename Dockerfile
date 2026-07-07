FROM node:24-bookworm-slim

ARG OPENCLAW_VERSION=2026.6.11
ARG GOG_VERSION=0.32.0
ARG TARGETARCH

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl git openssh-client \
  && npm install -g "openclaw@${OPENCLAW_VERSION}" \
  && curl -fsSL "https://github.com/openclaw/gogcli/releases/download/v${GOG_VERSION}/gogcli_${GOG_VERSION}_linux_${TARGETARCH}.tar.gz" \
    | tar -xz -C /usr/local/bin gog \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash sunday

USER sunday
WORKDIR /app

EXPOSE 18789

CMD ["openclaw", "gateway", "run", "--allow-unconfigured", "--bind", "auto", "--auth", "token", "--port", "18789"]
