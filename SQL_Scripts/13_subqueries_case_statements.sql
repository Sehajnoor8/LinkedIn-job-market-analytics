USE linkedin_job_analytics;

SELECT
    job_title,
    max_salary

FROM jobs
JOIN salaries
ON jobs.job_id = salaries.job_id

WHERE max_salary >

(
    SELECT AVG(max_salary)
    FROM salaries
);

SELECT
    company_name,
    COUNT(job_id) AS total_jobs

FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id

GROUP BY company_name

HAVING COUNT(job_id) =

(
    SELECT MAX(job_count)

    FROM
    (
        SELECT COUNT(job_id) AS job_count
        FROM jobs
        GROUP BY company_id
    ) AS company_counts
);

SELECT
    job_title,
    max_salary,

    CASE

        WHEN max_salary >= 1500000
        THEN 'High Paying'

        WHEN max_salary >= 800000
        THEN 'Medium Paying'

        ELSE 'Low Paying'

    END AS salary_category

FROM jobs
JOIN salaries
ON jobs.job_id = salaries.job_id;

SELECT
    city,
    remote_option,

    CASE

        WHEN remote_option = 'Remote'
        THEN 'Fully Flexible'

        WHEN remote_option = 'Hybrid'
        THEN 'Partially Flexible'

        ELSE 'Office Based'

    END AS work_flexibility

FROM locations;


SELECT
    job_title,
    experience_level,

    CASE

        WHEN experience_level = 'Entry Level'
        THEN 'Beginner Hiring'

        WHEN experience_level = 'Mid Level'
        THEN 'Experienced Hiring'

        ELSE 'Senior Hiring'

    END AS hiring_category

FROM jobs;


SELECT

    CASE

        WHEN max_salary >= 1000000
        THEN 'Above 10 LPA'

        ELSE 'Below 10 LPA'

    END AS salary_segment,

    COUNT(*) AS total_jobs

FROM salaries

GROUP BY salary_segment;