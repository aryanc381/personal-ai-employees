#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${APP_DIR:-/opt/the-ai-council}"
DEPLOY_BRANCH="${DEPLOY_BRANCH:-main}"

cd "$APP_DIR"

git fetch origin "$DEPLOY_BRANCH"
git checkout "$DEPLOY_BRANCH"
git reset --hard "origin/$DEPLOY_BRANCH"

docker compose up -d --build
docker compose ps
