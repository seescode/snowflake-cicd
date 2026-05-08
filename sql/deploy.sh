#!/bin/bash
set -e  # fail on error

source ../environments/prod.env

snow sql -f create_users.sql -D db=$SF_DATABASE -D schema=$SF_SCHEMA
snow sql -f insert_users.sql -D db=$SF_DATABASE -D schema=$SF_SCHEMA
snow sql -f validate.sql -D db=$SF_DATABASE -D schema=$SF_SCHEMA
snow sql -f ../procedures/load_customers.sql -D db=$SF_DATABASE -D schema=$SF_SCHEMA
snow sql -f ../procedures/transform_orders.sql -D db=$SF_DATABASE -D schema=$SF_SCHEMA
