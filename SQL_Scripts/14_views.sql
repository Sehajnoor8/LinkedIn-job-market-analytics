USE linkedin_job_analytics;

-- View 1: Salary Analytics

CREATE OR REPLACE VIEW salary_analytics_view AS

SELECT
    company_name,
    job_title,
    max_salary
FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id
JOIN salaries
ON jobs.job_id = salaries.job_id;


-- View 2: Skill Demand Analytics

CREATE OR REPLACE VIEW skill_demand_view AS

SELECT
    skills.skill_name,
    COUNT(job_skills.job_id) AS demand_count
FROM skills
JOIN job_skills
ON skills.skill_id = job_skills.skill_id
GROUP BY skills.skill_name;


-- View 3: Company Hiring Analytics

CREATE OR REPLACE VIEW company_hiring_view AS

SELECT
    company_name,
    COUNT(job_id) AS total_jobs
FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id
GROUP BY company_name;


-- View 4: High Paying Jobs

CREATE OR REPLACE VIEW high_paying_jobs_view AS

SELECT
    company_name,
    job_title,
    max_salary
FROM companies
JOIN jobs
ON companies.company_id = jobs.company_id
JOIN salaries
ON jobs.job_id = salaries.job_id
WHERE max_salary >= 1000000;

SELECT * FROM salary_analytics_view;

SELECT * FROM skill_demand_view;

SELECT * FROM company_hiring_view;

SELECT * FROM high_paying_jobs_view;