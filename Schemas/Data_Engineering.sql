-- Make sure there are no tables currently existing for executing the creation of all tables.
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE employees;
DROP TABLE titles;
DROP TABLE departments;

-- Create the schemata for the tables
CREATE TABLE departments(
	dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(20) NOT NULL
);

CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(20) NOT NULL
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL, 
	emp_title_id VARCHAR(5) NOT NULL, 
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL, 
	last_name VARCHAR(30) NOT NULL,
	sex CHAR(1) NOT NULL, 
	hire_date DATE NOT NULL, 
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL, 
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL, 
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no), 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
	PRIMARY KEY (dept_no, emp_no)
);

-- Check datestyle and alter database datestyle if necessary to make sure date imports correctly
-- show datestyle;

-- ALTER DATABASE "sql_challenge" SET datestyle = "ISO, MDY";

