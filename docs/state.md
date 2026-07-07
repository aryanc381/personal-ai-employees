# Persistent State

OpenClaw runtime state must live outside the Docker image.

## Local Path

```text
./state/openclaw
./state/gogcli
```

The compose file mounts it into the container:

```text
./state/openclaw -> /home/sunday/.openclaw
./state/gogcli/config -> /home/sunday/.config/gogcli
./state/gogcli/data -> /home/sunday/.local/share/gogcli
```

## VPS Path

Use a stable host path:

```text
/var/lib/the-ai-council/openclaw
/var/lib/the-ai-council/gogcli
```

In production, mount it the same way:

```text
/var/lib/the-ai-council/openclaw -> /home/sunday/.openclaw
/var/lib/the-ai-council/gogcli/config -> /home/sunday/.config/gogcli
/var/lib/the-ai-council/gogcli/data -> /home/sunday/.local/share/gogcli
```

## What Lives Here

```text
OpenClaw config
WhatsApp login/session
Google Calendar auth
gog encrypted keyring
agent sessions
media/cache/log state
```

## What Never Goes In Git

```text
state/
.env
client_secret*.json
tokens
auth/session files
```

## Why This Matters

The container can be rebuilt or recreated without losing Sunday auth/state.

```text
rebuild container
state mount remains
Sunday keeps config and auth
```
