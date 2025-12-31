/*
    Question: What skills are required for the top-paying data analyst jobs.
    - Use the top 10 highest-paying DA jobs from the first query
    - Add the specific skills required for these roles
    - Why? It provides a detailed look at which high-paying roles demand what skills, 
        helping job seekers understand which skills to develop to allign with the top-paying salaries.
*/


WITH top_paying_job AS (   
     SELECT
        job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short ILIKE 'Data Analyst' AND
        job_location ILIKE 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_job.*,
    skills
FROM top_paying_job
INNER JOIN skills_job_dim
    ON top_paying_job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    top_paying_job.salary_year_avg DESC;