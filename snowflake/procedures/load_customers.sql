CREATE OR REPLACE PROCEDURE <%db%>.<%schema%>.load_customers()
RETURNS STRING
LANGUAGE SQL
AS
$$
    INSERT INTO <%schema%>.customers (id, name, created_at)
    SELECT id, name, CURRENT_TIMESTAMP()
    FROM staging.customers;
$$;