-- Set context
USE DATABASE <%db%>;
USE SCHEMA <%schema%>;
USE WAREHOUSE <%wh%>;

!source tables/members.sql
!source tables/providers.sql
!source tables/claims.sql

!source views/vw_claims_summary.sql

!source stored_procedures/process_claim.sql
