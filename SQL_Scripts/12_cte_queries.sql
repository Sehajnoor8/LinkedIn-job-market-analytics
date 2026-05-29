USE linkedin_job_analytics;

WITH high_paying_jobs AS (

    SELECT
        jobs.job_id,
        job_title,
        max_salary

    FROM jobs
    JOIN salaries
    ON jobs.job_id = salaries.job_id

    WHERE max_salary > 1000000
)

SELECT *
FROM high_paying_jobs;

WITH company_job_count AS (

    SELECT
        company_name,
        COUNT(job_id) AS total_jobs

    FROM companies
    JOIN jobs
    ON companies.company_id = jobs.company_id

    GROUP BY company_name
)

SELECT *
FROM company_job_count
ORDER BY total_jobs DESC;

WITH average_salary_cte AS (

    SELECT
        employment_type,
        AVG(max_salary) AS avg_salary

    FROM jobs
    JOIN salaries
    ON jobs.job_id = salaries.job_id

    GROUP BY employment_type
)

SELECT *
FROM average_salary_cte;
WITH skill_demand AS (

    SELECT
        skills.skill_name,
        COUNT(job_skills.job_id) AS demand_count

    FROM skills
    JOIN job_skills
    ON skills.skill_id = job_skills.skill_id

    GROUP BY skills.skill_name
)

SELECT *
FROM skill_demand
ORDER BY demand_count DESC;

WITH ranked_salaries AS (

    SELECT
        company_name,
        job_title,
        max_salary,

        DENSE_RANK() OVER(
            ORDER BY max_salary DESC
        ) AS salary_rank

    FROM companies
    JOIN jobs
    ON companies.company_id = jobs.company_id

    JOIN salaries
    ON jobs.job_id = salaries.job_id
)

SELECT *
FROM ranked_salaries
WHERE salary_rank <= 3;

WITH remote_jobs AS (

    SELECT
        job_title,
        city,
        remote_option

    FROM jobs
    JOIN locations
    ON jobs.location_id = locations.location_id

    WHERE remote_option = 'Remote'
)

SELECT *
FROM remote_jobs;