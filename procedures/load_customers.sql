CREATE OR REPLACE PROCEDURE analytics.load_customers()
RETURNS STRING
LANGUAGE SQL
AS
$$
    INSERT INTO analytics.customers (id, name, created_at)
    SELECT id, name, CURRENT_TIMESTAMP()
    FROM staging.customers;

    RETURN 'Customers loaded';
$$;