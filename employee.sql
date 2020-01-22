----------Coding Challenge 2----------

create database EmployeeDBcc2;
go

use EmployeeDBcc2;
go

create table Department(
	DepartmentID int identity(1,1) primary key,
	Name varchar(max) not null,
	Location varchar(max) not null
)

create table Employee(
	EmployeeID int identity(1,1) primary key,
	FirstName varchar(max) not null,
	LastName varchar(max) not null,
	SSN int not null,
	DeptID int,
	CONSTRAINT fk_DeptID foreign key (DeptID) references Department(DepartmentID)
)

create table EmpDetails(
	EmpDetailsID int identity(1,1) primary key,
	EmployeeID int not null,
	Salary money,
	Address1 varchar(max),
	Address2 varchar(max),
	City varchar(max),
	State varchar(max),
	Country varchar(max),
	CONSTRAINT fk_EmployeeID foreign key (EmployeeID) references Employee(EmployeeID)
)

insert into Department (Name, Location)
	values ('Marketing', 'West Building'),
		('Tech', 'North Building'),
		('Finance', 'East Building');

insert into Employee (FirstName, LastName, SSN, DeptID)
	values ('Tina', 'Smith', 123456789, 1),
		('John', 'Doe', 987654321, 3)

insert into Employee (FirstName, LastName, SSN, DeptID)
	values ('Jose', 'Bautista', 222444666, 2),
		('Alexis', 'Grant', 888888888, 1),
		('Bob', 'Hope', 777777777, 1)

insert into EmpDetails(EmployeeID, Salary)
	values (1, 5000),
		(2, 5000),
		(3, 5000)

insert into EmpDetails(EmployeeID, Salary)
	values (4, 5000),
		(5, 5000),
		(6, 5000)

select * from Employee
where Employee.DeptID = 1;

update EmpDetails
set Salary = 90000
where EmpDetails.EmployeeID = 1;

select * from Department;
select * from Employee;
select * from EmpDetails;

with DeptEmployees (DeptName, EmpID, EmployeeName)
as (
	select Name, EmployeeID, FirstName
	from Department
	join Employee
	on DepartmentID = DeptID
)
select DeptName, sum(Salary) as 'Total Salary' 
from DeptEmployees
join EmpDetails
on EmpID = EmployeeID
where DeptName = 'Marketing'
group by DeptName
