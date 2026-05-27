CREATE DATABASE linkedin_job_analytics;

USE linkedin_job_analytics;
CREATE TABLE companies (
	company_id INT PRIMARY KEY auto_increment,
	company_name varchar(100),
    industry VARCHAR(100),
    company_size VARCHAR(50)
);