DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Dept_Emp CASCADE;
DROP TABLE IF EXISTS Dept_Manager CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;
DROP TABLE IF EXISTS Titles CASCADE;

CREATE TABLE Departments (
    dept_no varchar(5)   NOT NULL,
    dept_name varchar(30)   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE Dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar(5)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

CREATE TABLE Dept_manager (
    dept_no varchar(5)   NOT NULL,
    emp_no int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(30)   NOT NULL,
    last_name varchar(30)   NOT NULL,
    gender varchar(10)   NOT NULL,
    hire_date date   NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary numeric   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

CREATE TABLE Titles (
    emp_no int   NOT NULL,
    title varchar(30)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    PRIMARY KEY (emp_no,title,from_date),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);