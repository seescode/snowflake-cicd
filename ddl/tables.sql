CREATE TABLE IF NOT EXISTS analytics.customers (
    id            INTEGER,
    name          STRING,
    created_at    TIMESTAMP
);

CREATE TABLE IF NOT EXISTS analytics.orders (
    id            INTEGER,
    customer_id   INTEGER,
    amount        NUMBER(10,2),
    created_at    TIMESTAMP
);