#!/bin/bash
set -e

ENV=${1:-}
if [[ "$ENV" != "dev" && "$ENV" != "prod" ]]; then
  echo "Usage: $0 <dev|prod>" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Load env-specific vars: SF_DATABASE, SF_SCHEMA, SF_WAREHOUSE
source "$REPO_ROOT/environments/$ENV.env"

# # Build Snowflake CLI config from injected credentials
# mkdir -p ~/.snowflake
# cat > ~/.snowflake/config.toml <<TOML
# [connections.default]
# account = "$SNOWFLAKE_ACCOUNT"
# user = "$SNOWFLAKE_USER"
# password = "$SNOWFLAKE_PASSWORD"
# database = "$SF_DATABASE"
# schema = "$SF_SCHEMA"
# warehouse = "$SF_WAREHOUSE"
# TOML

cd "$SCRIPT_DIR"
snow sql -f deploy.sql -D db="$SF_DATABASE" -D schema="$SF_SCHEMA"
