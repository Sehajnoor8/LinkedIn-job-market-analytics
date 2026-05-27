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