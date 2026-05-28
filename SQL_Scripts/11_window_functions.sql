USE linkedin_job_analytics;

SELECT
    job_title,
    max_salary,

    ROW_NUMBER() OVER(
        ORDER BY max_salary DESC
    ) AS salary_row_number

FROM salaries
JOIN jobs
ON salaries.job_id = jobs.job_id;

SELECT
    job_title,
    max_salary,

    RANK() OVER(
        ORDER BY max_salary DESC
    ) AS salary_rank

FROM salaries
JOIN jobs
ON salaries.job_id = jobs.job_id;

SELECT
    job_title,
    max_salary,

    DENSE_RANK() OVER(
        ORDER BY max_salary DESC
    ) AS dense_salary_rank

FROM salaries
JOIN jobs
ON salaries.job_id = jobs.job_id;

SELECT
    employment_type,
    job_title,
    max_salary,

    RANK() OVER(
        PARTITION BY employment_type
        ORDER BY max_salary DESC
    ) AS employment_salary_rank

FROM jobs
JOIN salaries
ON jobs.job_id = salaries.job_id;

SELECT
    company_name,
    job_title,
    max_salary,

    DENSE_RANK() OVER(
        ORDER BY max_salary DESC
    ) AS company_salary_rank

FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id
JOIN salaries
ON jobs.job_id = salaries.job_id;

SELECT
    company_name,

    COUNT(job_id) AS total_jobs,

    RANK() OVER(
        ORDER BY COUNT(job_id) DESC
    ) AS hiring_rank

FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id

GROUP BY company_name;