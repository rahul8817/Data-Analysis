/*
-- will be selected as a string
SELECT 
    '2023-09-25';


-- casting it into its datatype

SELECT 
    '2023-09-25'::DATE,
    '123'::INT,
    'John'::VARCHAR,
    'true'::BOOLEAN,
    '3.14'::REAL;
*/

SELECT *
FROM job_postings_fact
LIMIT 10;

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM job_postings_fact
LIMIT 10;

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' AS date
FROM job_postings_fact
LIMIT 10;


SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS job_month,
    EXTRACT(YEAR FROM job_posted_date) AS job_year
FROM job_postings_fact
LIMIT 10;


-- WORKING WITH EXTRACT FUNCTION

SELECT 
    COUNT(job_id) AS job_posting_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY job_posting_count DESC;


/* 
    1.
    write a query to find avg salary both yearly and hourly for job postings that were posted after June 1,2023. Group results by job schedule type.
*/

SELECT 
    AVG(salary_year_avg) AS yearly_avg,
    AVG(salary_hour_avg) AS hourly_avg,
    job_schedule_type
FROM job_postings_fact
WHERE job_posted_date > '2023-05-01'
    AND (salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL)
GROUP BY job_schedule_type;


/*
    Problem 2:
    Write a query to count the number of job postings in each month of 2023, adjusting the job_posted_date to be in 'America/New_York' time zone 
    before extracting the month.
    Assume the job_posted_date is stored in UTC. 
    Group and order by month. 
*/

SELECT 
    EXTRACT (MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
    COUNT(*) AS job_count
FROM job_postings_fact
WHERE EXTRACT( YEAR FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York')) = 2023
GROUP BY month
ORDER BY month;

/* 
    3.
    WAQ to find companies(inc cmp names) taht have posted jobs offering health insurance, where these postings were made in the 2nd quarter of 2023.
    Use date extraction to filter by quarter.     
*/

SELECT *
FROM company_dim
LIMIT 5;

SELECT company_dim.name AS company_name
FROM company_dim
INNER JOIN job_postings_fact
    ON company_dim.company_id=job_postings_fact.company_id
WHERE
    job_postings_fact.job_health_insurance = TRUE
    AND EXTRACT(YEAR from job_postings_fact.job_posted_date) = 2023
    AND EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2;


