#!/bin/bash
set -e  # fail on error

source ../environments/prod.env

snow sql -f deploy.sql -D db=$SF_DATABASE -D schema=$SF_SCHEMA
