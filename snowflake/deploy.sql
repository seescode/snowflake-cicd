-- Set context
USE WAREHOUSE COMPUTE_WH;

!source sql/create_users.sql
!source sql/insert_users.sql
!source sql/validate.sql

-- Procedures
!source procedures/load_customers.sql
!source procedures/transform_orders.sql
