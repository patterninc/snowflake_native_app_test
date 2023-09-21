-- Setup script for the bi_tv_dashboards application.

CREATE APPLICATION ROLE bi_tv_dashboards__app_role;
CREATE SCHEMA IF NOT EXISTS core;
GRANT USAGE ON SCHEMA core TO APPLICATION ROLE bi_tv_dashboards__app_role;

CREATE OR ALTER VERSIONED SCHEMA code_schema;
GRANT USAGE ON SCHEMA code_schema TO APPLICATION ROLE bi_tv_dashboards__app_role;

CREATE VIEW IF NOT EXISTS code_schema.REPORT__DAYS_TO_BILLION__VELOCITY__VIEW AS 
SELECT 
    *
FROM 
    bi_tv_dashboards__app_package.shared_data.REPORT__DAYS_TO_BILLION__VELOCITY__VIEW
;

GRANT SELECT ON VIEW code_schema.REPORT__DAYS_TO_BILLION__VELOCITY__VIEW TO APPLICATION ROLE bi_tv_dashboards__app_role;


CREATE STREAMLIT code_schema.Days_to_Two_Billion__Streamlit
  FROM '/streamlit'
  MAIN_FILE = '/days_to_billion.py'
;

GRANT USAGE ON STREAMLIT code_schema.Days_to_Two_Billion__Streamlit TO APPLICATION ROLE bi_tv_dashboards__app_role;