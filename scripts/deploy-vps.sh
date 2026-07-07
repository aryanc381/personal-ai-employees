#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${APP_DIR:-/opt/sunday-openclaw}"
DEPLOY_BRANCH="${DEPLOY_BRANCH:-p3-gateway}"

cd "$APP_DIR"

git fetch origin "$DEPLOY_BRANCH"
git checkout "$DEPLOY_BRANCH"
git reset --hard "origin/$DEPLOY_BRANCH"

docker compose up -d --build
docker compose ps
