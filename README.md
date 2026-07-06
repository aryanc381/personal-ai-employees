# Sunday OpenClaw

Dockerized OpenClaw runtime for Sunday.

## Phase 1: Local Docker Baseline

Create local env:

```bash
cp .env.example .env
```

Build and start:

```bash
docker compose up -d --build
```

Check OpenClaw inside the container:

```bash
docker compose exec sunday openclaw --help
docker compose exec sunday openclaw --version
```

View logs:

```bash
docker compose logs -f sunday
```

Stop:

```bash
docker compose down
```

OpenClaw state is mounted at:

```text
./state/openclaw -> /home/sunday/.openclaw
```

Do not commit `state/` or `.env`.

## Phase 2: Persistent State

OpenClaw state is intentionally stored outside the image and outside Git.

Local development:

```text
./state/openclaw
```

VPS deployment:

```text
/var/lib/sunday-openclaw/openclaw
```

See [docs/state.md](docs/state.md).

## Phase 3: OpenClaw Gateway Runtime

The container now starts the OpenClaw gateway:

```bash
docker compose up -d --build
```

Check it:

```bash
docker compose ps
docker compose logs -f sunday
docker compose exec sunday openclaw gateway health
```

The local default gateway token is:

```text
dev-token-change-me
```

Change `OPENCLAW_GATEWAY_TOKEN` in `.env` before using this outside local development.

For local development, recreate state if needed:

```bash
mkdir -p state/openclaw
```

If your local OpenClaw already uses port `18789`, run this test container on another host port:

```bash
OPENCLAW_PORT=18790 docker compose up -d --build
```
