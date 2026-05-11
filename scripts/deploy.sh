#!/bin/bash
# Deploys deploy.sql to Snowflake for the given environment (dev or prod).
# Usage: ./deploy.sh <dev|prod>
set -e

# Require exactly one argument: the target environment
ENV=${1:-}
if [[ "$ENV" != "dev" && "$ENV" != "prod" ]]; then
  echo "Usage: $0 <dev|prod>" >&2
  exit 1
fi

# Resolve paths relative to this script so it works from any working directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Load env-specific vars: SF_DATABASE, SF_SCHEMA, SF_WAREHOUSE
source "$REPO_ROOT/environments/$ENV.env"

# Run from the snowflake/ directory so !source paths in deploy.sql resolve correctly
cd "$SCRIPT_DIR/../snowflake"
echo "$SCRIPT_DIR/../snowflake"
echo "$SF_DATABASE"
snow sql -f deploy.sql -D db="$SF_DATABASE" -D schema="$SF_SCHEMA"
