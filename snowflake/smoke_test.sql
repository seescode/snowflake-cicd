-- Smoke tests for Snowflake native objects.
-- Any failing statement causes a non-zero exit code and fails the CI step.

-- Set context
USE DATABASE <%db%>;
USE SCHEMA <%schema%>;
USE WAREHOUSE <%wh%>;

-- Verify tables are deployed and columns are accessible
DESCRIBE TABLE members;
DESCRIBE TABLE providers;
DESCRIBE TABLE claims;

-- Verify view resolves (JOIN logic is valid against deployed tables)
DESCRIBE VIEW vw_claims_summary;
SELECT * FROM vw_claims_summary LIMIT 0;
