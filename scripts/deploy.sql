-- Set context
USE ROLE SYSADMIN;
USE WAREHOUSE COMPUTE_WH;
USE DATABASE MY_DATABASE;

-- Schemas
!source ddl/schemas.sql

-- Tables
!source ddl/tables.sql

-- Procedures
!source procedures/load_customers.sql
!source procedures/transform_orders.sql

-- Grants
!source ddl/grants.sql