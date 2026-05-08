-- Set context
USE WAREHOUSE COMPUTE_WH;

!source create_users.sql
!source insert_users.sql
!source validate.sql

-- Procedures
!source ../procedures/load_customers.sql
!source ../procedures/transform_orders.sql
