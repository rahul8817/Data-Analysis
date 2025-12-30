/*
    Find job postings from Q1 having salary > $70K 
    - Combine job postings table from Q1 of 2023 (Jan-Mar)
    - Get job postings with avg salary > $70K 
*/


SELECT 
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM (    
    SELECT *
    FROM jobs_jan

    UNION ALL

    SELECT *
    FROM jobs_feb

    UNION ALL

    SELECT *
    FROM jobs_mar
) AS Q1_jobs
WHERE 
    salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;