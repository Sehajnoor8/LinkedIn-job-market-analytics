USE linkedin_job_analytics;

DELIMITER //

CREATE PROCEDURE GetHighPayingJobs()
BEGIN

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

END //

DELIMITER ;
CALL GetHighPayingJobs();

DELIMITER //

CREATE PROCEDURE GetCompanyHiringReport()
BEGIN

    SELECT
        company_name,
        COUNT(job_id) AS total_jobs

    FROM companies
    JOIN jobs
        ON companies.company_id = jobs.company_id

    GROUP BY company_name
    ORDER BY total_jobs DESC;

END //

DELIMITER ;
CALL GetCompanyHiringReport();

DELIMITER //

CREATE PROCEDURE GetSkillDemandReport()
BEGIN

    SELECT
        skills.skill_name,
        COUNT(job_skills.job_id) AS demand_count

    FROM skills
    JOIN job_skills
        ON skills.skill_id = job_skills.skill_id

    GROUP BY skills.skill_name
    ORDER BY demand_count DESC;

END //

DELIMITER ;
CALL GetSkillDemandReport();

DELIMITER //

CREATE PROCEDURE GetJobsByLocation(
    IN city_name VARCHAR(100)
)
BEGIN

    SELECT
        job_title,
        city

    FROM jobs
    JOIN locations
        ON jobs.location_id = locations.location_id

    WHERE city = city_name;

END //

DELIMITER ;

CALL GetJobsByLocation('Bangalore');

CALL GetJobsByLocation('Delhi');

SHOW PROCEDURE STATUS
WHERE Db = 'linkedin_job_analytics';