-- Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Create Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    DateOfJoining DATE NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create SalaryDetails table
CREATE TABLE SalaryDetails (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    BaseSalary DECIMAL(10, 2) NOT NULL,
    Bonus DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Create AddressDetails table
CREATE TABLE AddressDetails (
    AddressID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    AddressLine1 VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(20) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Insert data into Department table
INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Finance');

-- Insert data into Employee table
INSERT INTO Employee (EmployeeID, FirstName, LastName, DepartmentID, DateOfJoining) VALUES
(101, 'John', 'Doe', 2, '2020-05-15'),
(102, 'Jane', 'Smith', 1, '2019-03-10'),
(103, 'Michael', 'Johnson', 3, '2021-07-20'),
(104, 'Emily', 'Davis', 4, '2018-11-25'),
(105, 'Chris', 'Brown', 2, '2020-01-15'),
(106, 'Patricia', 'Taylor', 1, '2022-02-28'),
(107, 'Robert', 'Martinez', 3, '2021-08-12'),
(108, 'Linda', 'Hernandez', 4, '2019-06-30'),
(109, 'James', 'Wilson', 2, '2020-09-19'),
(110, 'Barbara', 'Moore', 1, '2017-12-01');

-- Insert data into SalaryDetails table
INSERT INTO SalaryDetails (SalaryID, EmployeeID, BaseSalary, Bonus) VALUES
(1, 101, 75000, 5000),
(2, 102, 60000, 4000),
(3, 103, 55000, 3000),
(4, 104, 80000, 6000),
(5, 105, 72000, 4500),
(6, 106, 58000, 3500),
(7, 107, 50000, 2000),
(8, 108, 85000, 7000),
(9, 109, 70000, 4000),
(10, 110, 62000, 3000);

-- Insert data into AddressDetails table
INSERT INTO AddressDetails (AddressID, EmployeeID, AddressLine1, City, State, PostalCode) VALUES
(1, 101, '123 Main St', 'New York', 'NY', '10001'),
(2, 102, '456 Elm St', 'San Francisco', 'CA', '94101'),
(3, 103, '789 Pine St', 'Chicago', 'IL', '60601'),
(4, 104, '101 Maple Ave', 'Seattle', 'WA', '98101'),
(5, 105, '202 Oak Blvd', 'Austin', 'TX', '73301'),
(6, 106, '303 Cedar Rd', 'Boston', 'MA', '02101'),
(7, 107, '404 Birch Dr', 'Denver', 'CO', '80201'),
(8, 108, '505 Walnut Ct', 'Miami', 'FL', '33101'),
(9, 109, '606 Spruce Ln', 'Atlanta', 'GA', '30301'),
(10, 110, '707 Ash Way', 'Los Angeles', 'CA', '90001');
------------------------------------------------------------------------------------------------
-- Create Role table
CREATE TABLE Role (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL
);

-- Create Resource table
CREATE TABLE Resource (
    ResourceID INT PRIMARY KEY,
    ResourceName VARCHAR(100) NOT NULL
);

-- Create Actions table
CREATE TABLE Actions (
    ActionID INT PRIMARY KEY,
    ActionName VARCHAR(50) NOT NULL
);

-- Create Users table (renamed from User to avoid SQL keyword conflict)
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    RoleID INT NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

-- Create UserPermission table
CREATE TABLE UserPermission (
    PermissionID INT PRIMARY KEY,
    UserID INT NOT NULL,
    ResourceID INT NOT NULL,
    ActionID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID),
    FOREIGN KEY (ActionID) REFERENCES Actions(ActionID)
);

-- Create RolePermission table
CREATE TABLE RolePermission (
    RolePermissionID INT PRIMARY KEY,
    RoleID INT NOT NULL,
    ResourceID INT NOT NULL,
    ActionID INT NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
    FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID),
    FOREIGN KEY (ActionID) REFERENCES Actions(ActionID)
);

-- Insert data into Role table
INSERT INTO Role (RoleID, RoleName) VALUES
(1, 'Admin'),
(2, 'Editor'),
(3, 'Viewer');

-- Insert data into Users table
INSERT INTO Users (UserID, UserName, Email, RoleID) VALUES
(1, 'Alice', 'alice@example.com', 1),
(2, 'Bob', 'bob@example.com', 2),
(3, 'Charlie', 'charlie@example.com', 3),
(4, 'Diana', 'diana@example.com', 2),
(5, 'Eve', 'eve@example.com', 3);

-- Insert data into Resource table
INSERT INTO Resource (ResourceID, ResourceName) VALUES
(1, 'Dashboard'),
(2, 'Reports'),
(3, 'Settings');

-- Insert data into Actions table
INSERT INTO Actions (ActionID, ActionName) VALUES
(1, 'View'),
(2, 'Edit'),
(3, 'Delete');

-- Insert data into UserPermission table
INSERT INTO UserPermission (PermissionID, UserID, ResourceID, ActionID) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 2, 2, 1),
(4, 2, 2, 2),
(5, 3, 1, 1),
(6, 3, 2, 1),
(7, 4, 2, 2),
(8, 4, 3, 1),
(9, 5, 1, 1),
(10, 5, 2, 1);

-- Insert data into RolePermission table
INSERT INTO RolePermission (RolePermissionID, RoleID, ResourceID, ActionID) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 1, 1, 3),
(4, 2, 2, 1),
(5, 2, 2, 2),
(6, 3, 1, 1),
(7, 3, 2, 1);
