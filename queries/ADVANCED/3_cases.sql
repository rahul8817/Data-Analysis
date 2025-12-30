/* 
        Create 3 tables:
    1. Jan 2023 jobs
    2. Feb 2023 jobs
    3. March 2023 jobs
*/

CREATE TABLE jobs_jan AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date) = 1;

CREATE TABLE jobs_feb AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date) = 2;

CREATE TABLE jobs_mar AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date) = 3;


-- Example query using CASE statement:
SELECT
    CASE
        WHEN column_name = 'Value 1' THEN 'Description for Value 1'
        WHEN column_name = 'Value 2' THEN 'Description for Value 2'
        ELSE 'Other'
    END AS column_description
FROM
    table_name;

SELECT
    COUNT(job_id) AS num_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;


SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 120000 THEN 'High'
        WHEN salary_year_avg >= 70000 THEN 'Standard'
        ELSE 'Low'
    END AS salary_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_category;

