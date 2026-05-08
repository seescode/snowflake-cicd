#!/bin/bash
set -e  # fail on error

source ../environments/dev.env

snow sql -q "
CREATE OR REPLACE TABLE $SF_DATABASE.$SF_SCHEMA.users (
  id INT,
  name STRING
);
"

snow sql -q "
INSERT INTO $SF_DATABASE.$SF_SCHEMA.users VALUES
(1, 'Alice'),
(2, 'Bob');
"