CREATE DATABASE company;
use company;

create table employees (
	SSN int primary key ,
	first_name varchar(50) ,
	last_name varchar(50) ,
	birth_data date ,
	gender char(1) ,
	supervisor_SSN int ,
	d_num int ,
	constraint sup_fk foreign key (supervisor_SSN)
	references employees (SSN) ,
	constraint dpt_fk foreign key (d_num)
	references departments (d_num)
);

create table managers (
	manager_SSN int ,
	d_num int ,
	hiring_date date ,
	constraint mng_pk primary key (manager_SSN , d_num) ,
	constraint mng_dpt_fk foreign key (d_num)
	references departments (d_num) ,
	constraint mng_fk foreign key (manager_SSN)
	references employees (SSN)
);

create table dependants (
	first_name varchar(50) ,
	employee_SSN int ,
	gender char(1) ,
	birth_date date ,
	constraint dep_pk primary key (first_name , employee_SSN) ,
	constraint dep_emp_fk foreign key (employee_SSN)
	references employees (SSN)
);

create table departments (
	d_num int primary key ,
	d_name varchar(50) ,
	d_location varchar(50) ,
	manager_SSN int ,
	constraint mngr_fk foreign key (manager_SSN)
	references employees (SSN) 
);

create table projects (
	p_num int primary key ,
	p_name varchar(50) ,
	city varchar(50) ,
	p_location varchar(50) ,
	d_num int ,
	constraint d_fk foreign key (d_num)
	references departments (d_num)
);

create table employees_projects (
	SSN int ,
	p_num int ,
	working_hours int ,
	constraint pk primary key (SSN , p_num) ,
	constraint emp_fk foreign key (SSN)
	references employees (SSN) ,
	constraint project_fk foreign key (p_num)
	references projects (p_num)
);
