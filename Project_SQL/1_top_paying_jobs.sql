/*
    Question: What are the top paying data analyst jobs.
    - Identify the top 10 highest paying DA roles that are remotely available
    - Focus on the job postings with specified salaries (remove nulls)
    - Why? Highlight the top paying oppurtunities for DA, offering insights into optimal skills to be a DA
    - Query can be modified to get insights for any role
*/

SELECT
    job_id,
    company_dim.name AS company_name,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short ILIKE 'Data Analyst' AND
    job_location ILIKE 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
