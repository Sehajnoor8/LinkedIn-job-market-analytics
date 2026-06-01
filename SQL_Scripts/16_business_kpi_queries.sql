SELECT
    company_name,
    COUNT(job_id) AS total_openings
FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id
GROUP BY company_name
ORDER BY total_openings DESC;

SELECT
    company_name,
    AVG(max_salary) AS avg_salary
FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id
JOIN salaries
ON jobs.job_id = salaries.job_id
GROUP BY company_name
ORDER BY avg_salary DESC;

SELECT
    skill_name,
    COUNT(job_id) AS demand_count
FROM skills
JOIN job_skills
ON skills.skill_id = job_skills.skill_id
GROUP BY skill_name
ORDER BY demand_count DESC;

SELECT
    remote_option,
    COUNT(*) AS total_jobs
FROM locations
JOIN jobs
ON locations.location_id = jobs.location_id
GROUP BY remote_option;

SELECT
    experience_level,
    COUNT(*) AS total_jobs
FROM jobs
GROUP BY experience_level;