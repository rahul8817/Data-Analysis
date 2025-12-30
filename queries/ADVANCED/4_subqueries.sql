SELECT *
FROM ( -- SubQuery starts from here
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;
-- SubQuery ends here

WITH january_jobs AS (  -- CTE definition starts here
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE definition ends here

SELECT * 
FROM january_jobs;


SELECT 
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM 
        job_postings_fact
    WHERE 
        job_no_degree_mention = 'True'
)

/*
    find the companies with the most job openings
    - get the total number of job postings per company id (job_posting_fact)
    - return the total number of jobs with the company name (company_dim)
*/



WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) as total_jobs
    FROM
        job_postings_fact
    GROUP BY 
        company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs 
FROM company_dim
-- Perform a LEFT JOIN between two tables
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC;


/*
    1.  Identify the top 5 skills that are most frequently mentioned in jobs postings. 
        Use a subquery to find the skill ids with the highest count in the skills_job_dim table and join this result with the skills_dim table 
        to get the skill names.
*/

SELECT 
    s.skill_id,
    s.skills,
    t.total_skills
FROM skills_dim s
INNER JOIN (
    SELECT
        skill_id,
        COUNT(*) AS total_skills
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY total_skills DESC
    LIMIT 5
) t
ON s.skill_id = t.skill_id
ORDER BY t.total_skills DESC;

-- used CTE not subquery
WITH top_skills AS (
    SELECT 
        skill_id,
        COUNT(*) AS total_skills
    FROM skills_job_dim
    GROUP BY skill_id
)

SELECT 
    top_skills.skill_id,
    skills,
    top_skills.total_skills
FROM skills_dim
INNER JOIN top_skills 
    ON skills_dim.skill_id = top_skills.skill_id
ORDER BY total_skills DESC
LIMIT 5;


/*
    2.  Determine the size category (S,M,L) for each company by first identifying the no. of job postings each has.
        Use a subquery to calculate the total job postings per company.
        Small < 10 job postings
        Medium between 10 and 50 postings.
        Large > 50 
        Implement a subquery to aggregate job counts per company before classifying them based on size.
*/


SELECT
    c.name AS company_name,
    jc.total_jobs,
    CASE
        WHEN jc.total_jobs < 10 THEN 'S'
        WHEN jc.total_jobs BETWEEN 10 AND 50 THEN 'M'
        ELSE 'L'
    END AS company_size
FROM company_dim c
INNER JOIN (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact 
    GROUP BY company_id
) jc
    ON c.company_id = jc.company_id;

-- practice problems.
--  1. Find companies that have more job postings than the average number of postings per company.


SELECT
    company_id
FROM
    job_postings_fact j
    GROUP BY company_id
    HAVING COUNT(*) > (
    SELECT 
        AVG(job_count)
    FROM (
        SELECT 
            company_id,
            COUNT(*) AS job_count
        FROM job_postings_fact j
        GROUP BY company_id
    ) t
);

-- 2.List job titles where the salary is greater than the average salary across all jobs.

SELECT 
    job_id, 
    job_title_short,
    salary_year_avg
FROM 
    job_postings_fact
WHERE salary_year_avg >
(
    SELECT
        AVG(salary_year_avg) 
    FROM job_postings_fact 
)


/*
3.   find the count of the number of remote job postings per skill 
        - display the top 5 skills by their demand in remote jobs
        - include skill ID, name and count of postings requiring the skill

*/

WITH remote_job_skills AS (
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings
        ON job_postings.job_id = skills_to_job.job_id
    WHERE 
        job_postings.job_work_from_home = 'True' AND
        job_postings.job_title_short = 'Data Analyst'

    GROUP BY 
        skill_id
)

SELECT 
    skills.skill_id,
    skills.skills,
    remote_job_skills.skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills
    ON skills.skill_id = remote_job_skills.skill_id 
ORDER BY 
    remote_job_skills.skill_count DESC
LIMIT 5;
