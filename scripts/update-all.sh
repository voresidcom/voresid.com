#!/bin/bash

# Opdater alle stacks fra GitHub-repo (kun stacks-mappe)
# Kør på Raspberry Pi med: ./scripts/update-all.sh

set -e  # Stop ved første fejl

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_DIR"

echo "🔄 Henter nyeste version fra GitHub..."
git pull origin main

echo "🔄 Finder alle docker-compose.yml i stacks-mappen..."
for compose_file in stacks/*/docker-compose.yml; do
  if [ -f "$compose_file" ]; then
    stack_name=$(basename "$(dirname "$compose_file")")
    echo "⬆️  Opdaterer $stack_name..."

    docker compose -f "$compose_file" pull --quiet
    docker compose -f "$compose_file" up -d --remove-orphans
  fi
done

echo "✅ Alle stacks er opdateret! 🚀"
