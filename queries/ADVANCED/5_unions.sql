SELECT *
FROM jobs_jan_2023
LIMIT 10;

SELECT * 
FROM jobs_feb_2023
LIMIT 10;

SELECT *
FROM jobs_mar_2023
LIMIT 10;

SELECT column_name
FROM table_one

UNION -- combine 2 tables

SELECT column_name
FROM table_two;

-- get jobs and companies from Jan
SELECT
    job_title_short,
    company_id,
    job_location
FROM jobs_jan

UNION ALL
-- get jobs and companies from Feb

SELECT
    job_title_short,
    company_id,
    job_location
FROM jobs_feb

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM jobs_mar