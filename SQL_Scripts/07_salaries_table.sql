CREATE DATABASE linkedin_job_analytics;

USE linkedin_job_analytics;
CREATE TABLE companies (
	company_id INT PRIMARY KEY auto_increment,
	company_name varchar(100),
    industry VARCHAR(100),
    company_size VARCHAR(50)
);

CREATE TABLE locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(100),
    country VARCHAR(100),
    remote_option VARCHAR(20)
);

USE linkedin_job_analytics;

CREATE TABLE jobs (
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

USE linkedin_job_analytics;

CREATE TABLE skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(100)
);

USE linkedin_job_analytics;

CREATE TABLE job_skills (
    job_id INT,
    skill_id INT,

    PRIMARY KEY (job_id, skill_id),

    FOREIGN KEY (job_id)
    REFERENCES jobs(job_id),

    FOREIGN KEY (skill_id)
    REFERENCES skills(skill_id)
);

USE linkedin_job_analytics;

CREATE TABLE salaries (
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT,
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2),
    currency VARCHAR(10),

    FOREIGN KEY (job_id)
    REFERENCES jobs(job_id)
);