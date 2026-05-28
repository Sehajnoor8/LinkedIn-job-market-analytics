USE linkedin_job_analytics;

SELECT
    company_name,
    COUNT(job_id) AS total_jobs
FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id
GROUP BY company_name
ORDER BY total_jobs DESC;

SELECT
    job_title,
    ROUND(AVG(max_salary),2) AS average_salary
FROM jobs
JOIN salaries
ON jobs.job_id = salaries.job_id
GROUP BY job_title
ORDER BY average_salary DESC;

SELECT
    skills.skill_name,
    COUNT(job_skills.job_id) AS skill_demand
FROM skills
JOIN job_skills
ON skills.skill_id = job_skills.skill_id
GROUP BY skills.skill_name
ORDER BY skill_demand DESC;

SELECT
    remote_option,
    COUNT(*) AS total_jobs
FROM locations
JOIN jobs
ON locations.location_id = jobs.location_id
GROUP BY remote_option;

SELECT
    company_name,
    job_title,
    max_salary
FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id
JOIN salaries
ON jobs.job_id = salaries.job_id
ORDER BY max_salary DESC;


SELECT
    company_name,
    job_title,
    experience_level
FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id
WHERE experience_level = 'Entry Level';