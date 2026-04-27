CREATE OR REPLACE PROCEDURE analytics.transform_orders()
RETURNS STRING
LANGUAGE JAVASCRIPT
AS
$$
    var sql_command = `
        INSERT INTO analytics.orders (id, customer_id, amount, created_at)
        SELECT id, customer_id, amount, CURRENT_TIMESTAMP()
        FROM staging.orders
    `;

    snowflake.execute({ sqlText: sql_command });

    return "Orders transformed";
$$;