CREATE DATABASE IF NOT EXISTS linkedin_job_analytics;

USE linkedin_job_analytics;

-- COMPANIES TABLE

CREATE TABLE IF NOT EXISTS companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100),
    industry VARCHAR(100),
    company_size VARCHAR(50)
);

-- LOCATIONS TABLE

CREATE TABLE IF NOT EXISTS locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(100),
    country VARCHAR(100),
    remote_option VARCHAR(20)
);

-- JOBS TABLE

CREATE TABLE IF NOT EXISTS jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT,
    location_id INT,
    job_title VARCHAR(150),
    experience_level VARCHAR(50),
    employment_type VARCHAR(50),
    posted_date DATE,

    FOREIGN KEY (company_id)
    REFERENCES companies(company_id),

    FOREIGN KEY (location_id)
    REFERENCES locations(location_id)
);

-- SKILLS TABLE

CREATE TABLE IF NOT EXISTS skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(100)
);

-- JOB SKILLS TABLE

CREATE TABLE IF NOT EXISTS job_skills (
    job_id INT,
    skill_id INT,

    PRIMARY KEY (job_id, skill_id),

    FOREIGN KEY (job_id)
    REFERENCES jobs(job_id),

    FOREIGN KEY (skill_id)
    REFERENCES skills(skill_id)
);

-- SALARIES TABLE

CREATE TABLE IF NOT EXISTS salaries (
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT,
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2),
    currency VARCHAR(10),

    FOREIGN KEY (job_id)
    REFERENCES jobs(job_id)
);

-- INSERT COMPANIES

INSERT INTO companies
(company_name, industry, company_size)
VALUES
('Google', 'Technology', 'Enterprise'),
('Microsoft', 'Technology', 'Enterprise'),
('Amazon', 'E-commerce', 'Enterprise'),
('Infosys', 'IT Services', 'Large'),
('TCS', 'IT Services', 'Large');

-- INSERT LOCATIONS

INSERT INTO locations
(city, country, remote_option)
VALUES
('Bangalore', 'India', 'Hybrid'),
('Hyderabad', 'India', 'Remote'),
('Pune', 'India', 'On-site'),
('Mumbai', 'India', 'Hybrid'),
('Delhi', 'India', 'Remote');

-- INSERT SKILLS

INSERT INTO skills
(skill_name)
VALUES
('SQL'),
('Python'),
('Power BI'),
('Tableau'),
('Excel'),
('Machine Learning'),
('Data Analysis');

-- INSERT JOBS

INSERT INTO jobs
(company_id, location_id, job_title,
experience_level, employment_type, posted_date)
VALUES
(1,1,'Data Analyst','Entry Level','Full-Time','2026-05-01'),
(2,2,'Business Analyst','Mid Level','Full-Time','2026-05-03'),
(3,3,'Data Scientist','Senior Level','Full-Time','2026-05-05'),
(4,4,'MIS Analyst','Entry Level','Contract','2026-05-07'),
(5,5,'SQL Developer','Mid Level','Full-Time','2026-05-09');

-- INSERT SALARIES

INSERT INTO salaries
(job_id, min_salary, max_salary, currency)
VALUES
(1,500000,800000,'INR'),
(2,700000,1200000,'INR'),
(3,1200000,2200000,'INR'),
(4,350000,600000,'INR'),
(5,650000,1100000,'INR');

-- INSERT JOB SKILLS

INSERT INTO job_skills
(job_id, skill_id)
VALUES
(1,1),
(1,2),
(1,5),
(2,1),
(2,3),
(3,2),
(3,6),
(4,1),
(4,5),
(5,1),
(5,2);

-- ANALYTICS QUERIES

SELECT * FROM jobs;

SELECT
job_title,
max_salary
FROM jobs
JOIN salaries
ON jobs.job_id = salaries.job_id
ORDER BY max_salary DESC;

SELECT
skill_name,
COUNT(*) AS demand_count
FROM job_skills
JOIN skills
ON job_skills.skill_id = skills.skill_id
GROUP BY skill_name
ORDER BY demand_count DESC;

SELECT
job_title,
city,
remote_option
FROM jobs
JOIN locations
ON jobs.location_id = locations.location_id
WHERE remote_option = 'Remote';