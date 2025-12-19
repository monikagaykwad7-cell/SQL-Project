-- Situation -2 To organize a corporate event, we need employees who joined after 2024-01-01. Retrieve their details.
SELECT *
FROM Employee
WHERE DateOfJoining > '2024-01-01';

-- Situation -3 The finance team is preparing budgets. List all employees whose salary is greater than ₹60,000.
SELECT *
FROM Employees
WHERE Salary > 60000;

-- Situation -4 We are sending a company-wide newsletter. Find the details of employees whose email ends with '@example.com'.
SELECT *
FROM Employee
WHERE Email LIKE '%@example.com';

-- Situation -5 The Marketing department is launching a new campaign and needs a cost-effective team. Retrieve the details of employees in the Marketing department (DepartmentID: 11) who earn less than ₹60,000.
SELECT *
FROM Employee
WHERE DepartmentID = 11
  AND Salary < 60000;

-- Situation -6 A client requires a project lead for their team. Find the employee details where the name starts with 'S'.
SELECT *
FROM Employee
WHERE FirstName LIKE 'S%';

-- Situation -7 For recruitment analysis, retrieve all employees who joined in February 2024.
SELECT *
FROM Employee
WHERE DateOfJoining BETWEEN '2024-02-01' AND '2024-02-29';

-- Situation -8 To shortlist mid-level employees, find the details of employees who are earning between ₹50,000 and ₹70,000.
SELECT *
FROM Employee
WHERE Salary BETWEEN 50000 AND 70000;

-- Situation -9 We need to identify senior employees. Retrieve the details of employees who joined before 2024-03-01 and earn more than ₹55,000.
SELECT *
FROM Employee
WHERE DateOfJoining < '2024-03-01'
  AND Salary > 55000;

-- Situation -10 A special campaign is being planned for team leaders. Find employees who have "Manager" in their name.
SELECT *
FROM Employee
WHERE FirstName LIKE '%Manager%';
-- Situation -11 To identify local opportunities, list all the departments located in Pune.Situation -12 The board is interested in high-budget projects. Find the details of departments where the budget exceeds ₹10,00,000.
SELECT *
FROM Department
WHERE Location = 'Pune';

-- Situation -13 For a leadership meeting, retrieve the departments headed by "Rakesh Mehta".
SELECT *
FROM Department
WHERE Budget > 1000000;

-- Situation -14 Marketing expansion is being planned. Find all departments whose names start with "M".
SELECT *
FROM Department
WHERE DepartmentName LIKE 'M%';

-- Situation -15 To allocate funds efficiently, list all departments where the budget is between ₹8,00,000 and ₹15,00,000
SELECT *
FROM Department
WHERE AnnualBudget BETWEEN 800000 AND 1500000;

-- Situation -1: To analyze salary distribution, find the total salary paid in each department.
SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY DepartmentID;

-- Situation -2: For employee retention analysis, count the number of employees in each department.
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY DepartmentID;

-- Situation -3: The finance team wants to understand salary variation. Find the average salary in each department.
SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY DepartmentID;

-- Situation -4: To reward experienced employees, identify the earliest joining date in each department.
SELECT DepartmentID, MIN(DateOfJoining) AS EarliestJoiningDate
FROM Employee
GROUP BY DepartmentID;

-- Situation -5: The HR team is preparing performance reports. Retrieve the maximum salary in each department.
SELECT DepartmentID, MAX(Salary) AS MaxSalary
FROM Employee
GROUP BY DepartmentID;

-- Situation -6: To analyze junior-level hiring, find the minimum salary in each department.
SELECT DepartmentID, MIN(Salary) AS MinSalary
FROM Employee
GROUP BY DepartmentID;

-- Situation -7: The finance team wants to review high-salary employees. Find the total salary paid for employees earning more than ₹60,000 in each department.
SELECT DepartmentID, SUM(Salary) AS TotalHighSalary
FROM Employee
WHERE Salary > 60000
GROUP BY DepartmentID;

-- Situation -8: To monitor departmental growth, count the number of employees who joined in 2024 in each department.
SELECT DepartmentID, COUNT(*) AS JoinedIn2024
FROM Employee
WHERE YEAR(DateOfJoining) = 2024
GROUP BY DepartmentID;

-- Situation -9: For training allocation, count the number of employees with salaries between ₹50,000 and ₹70,000 in each department.
SELECT DepartmentID, COUNT(*) AS MidSalaryEmployees
FROM Employee
WHERE Salary BETWEEN 50000 AND 70000
GROUP BY DepartmentID;

-- Situation -10: For diversity analysis, count the number of employees whose names start with each letter of the alphabet.Department Table
SELECT LEFT(FirstName, 1) AS StartingLetter,
       COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY LEFT(FirstName, 1);

-- Situation -11: For city-based analysis, count the number of departments located in each city.
SELECT Location, COUNT(*) AS DepartmentCount
FROM Department
GROUP BY Location;

-- Situation -12: To manage high-budget projects, find the total budget allocated to all departments in each city.
SELECT Location, SUM(AnnualBudget) AS TotalBudget
FROM Department
GROUP BY Location;

-- Situation -13: For leadership tracking, count the number of departments headed by each manager.
SELECT HeadOfDepartment, COUNT(*) AS DepartmentCount
FROM Department
GROUP BY HeadOfDepartment;

-- Situation -14: To plan budget allocation, calculate the average budget of departments in each city.
SELECT Location, AVG(AnnualBudget) AS AverageBudget
FROM Department
GROUP BY Location;

-- Situation -15: For funding efficiency, find the maximum and minimum budgets among departments in each cit
SELECT Location,
       MAX(AnnualBudget) AS MaxBudget,
       MIN(AnnualBudget) AS MinBudget
FROM Department
GROUP BY Location;

-- Situation -1: To create a full name column, concatenate the first name and last name of each employee.
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employee;

-- Situation -2: For a project report, concatenate the department name and its location to display a complete department address.
SELECT CONCAT(DepartmentName, ' - ', Location) AS DepartmentAddress
FROM Department;

-- Situation -3: To prepare a personalized email greeting, concatenate "Hello " with the employee's name and a comma.
SELECT CONCAT('Hello ', FirstName, ',') AS Greeting
FROM Employee;

-- Situation -4: For creating a unique employee ID, concatenate the department ID and employee number.
SELECT CONCAT(DepartmentID, '-', EmployeeID) AS UniqueEmployeeID
FROM Employee;

-- Situation -5: For creating a company contact list, concatenate the employee's phone number with their extension (if applicable).
SELECT CONCAT(PhoneNumber, IFNULL(CONCAT(' Ext-', Extension), '')) AS ContactNumber
FROM Employee;

-- Situation -6: To display the complete address, concatenate the street, city, and postal code of each employee.
SELECT CONCAT(Street, ', ', City, ' - ', PostalCode) AS CompleteAddress
FROM Employee;

-- Situation -7: To create an employee login ID, concatenate the employee’s first name, last name, and their department ID.
SELECT CONCAT(FirstName, LastName, DepartmentID) AS LoginID
FROM Employee;

-- Situation -8: For sending out a personalized notification, concatenate the employee's department with their position.
SELECT CONCAT(DepartmentName, ' - ', Position) AS EmployeeRole
FROM Employee;

-- Situation -9: To display the employee's work status, concatenate their job title and current project.
SELECT CONCAT(JobTitle, ' working on ', CurrentProject) AS WorkStatus
FROM Employee;

-- Situation -10: For an annual report, concatenate the year and employee’s first name to create a unique report reference code
SELECT CONCAT(YEAR(DateOfJoining), '-', FirstName) AS ReportReferenceCode
FROM Employee;

-- Situation -1: As part of an organizational review, we need to update the salary of all employees who are part of the IT department (DepartmentID: 3). The salary of all employees in this department should be increased by 10%. Make sure that the increase is applied to every employee within the department.
UPDATE Employee
SET Salary = Salary * 1.10
WHERE DepartmentID = 3;

-- Situation -2: After the recent promotion evaluation, it has been decided that the employee with EmployeeID 101 should be promoted to a "Senior Developer" role. Update their job title accordingly and make sure the position is reflected correctly in the employee records.
UPDATE Employee
SET JobTitle = 'Senior Developer'
WHERE EmployeeID = 101;

-- Situation -3: The HR team has informed us of a change in the contact information of employee with EmployeeID 120. The new contact number for this employee should be updated to "9876543210". Ensure that the correct phone number is reflected in the system for any future communications.
UPDATE Employee
SET PhoneNumber = '9876543210'
WHERE EmployeeID = 120;

-- Situation -4: The company has recently implemented a new email domain. All employees who joined after January 1, 2023, need their email addresses updated to reflect the new domain "@newcompany.com". Update the email addresses accordingly for all the affected employees.
UPDATE Employee
SET Email = CONCAT(SUBSTRING_INDEX(Email, '@', 1), '@newcompany.com')
WHERE DateOfJoining > '2023-01-01';

-- Situation -5: It has come to our attention that there was an error in the naming of the HR department. The department name for DepartmentID 5 needs to be updated from "HR" to "Human Resources" to reflect the company's official title. Perform this update to ensure consistency across the records.
UPDATE Department
SET DepartmentName = 'Human Resources'
WHERE DepartmentID = 5;

-- Situation -6: As part of a company-wide salary review process, all employees who are currently earning below ₹50,000 need to receive a salary increase of ₹5,000. This update should only affect employees with a salary below the threshold and should apply the increase uniformly to each of their records.
UPDATE Employee
SET Salary = Salary + 5000
WHERE Salary < 50000;

-- Situation -7: The Marketing department has recently moved to a new office in a different city. The location of the Marketing department (DepartmentID: 11) needs to be updated to reflect this change. Please update the location to "Mumbai" in the department's records accordingly.
UPDATE Department
SET Location = 'Mumbai'
WHERE DepartmentID = 11;

-- Situation -8: Update the Salary of EmployeeID 135 to ₹60,000 as part of their annual appraisal.
UPDATE Employee
SET Salary = 60000
WHERE EmployeeID = 135;

-- Situation -9: EmployeeID 110, who was previously working on a different project, has now been assigned to "Project Alpha" after the successful completion of their prior assignment. Please update the project assignment for this employee to reflect this new responsibility.
UPDATE Employee
SET CurrentProject = 'Project Alpha'
WHERE EmployeeID = 110;

-- Situation -10: The employee with EmployeeID 103 had a delayed start date due to personal reasons. We need to update their joining date to the correct date, which is 2024-03-15, to ensure the records accurately reflect the employee's actual start date with the compan
UPDATE Employee
SET DateOfJoining = '2024-03-15'
WHERE EmployeeID = 103;

-- Situation -1: Due to an employee leaving the company, we need to delete the record of EmployeeID 101 from the Employee table.
DELETE FROM Employee
WHERE EmployeeID = 101;

-- Situation -2: The company is undergoing a restructuring. As part of this process, we need to delete all employees in the HR department (DepartmentID: 2) who joined before 2022.
DELETE FROM Employee
WHERE DepartmentID = 2
  AND DateOfJoining < '2022-01-01';

-- Situation -3: We are cleaning up the database and need to delete employees with a salary lower than ₹30,000, as they are no longer part of the workforce. 
DELETE FROM Employee
WHERE Salary < 30000;

-- Situation -4: As per a recent audit, employees who joined before 2020 but no longer have any active projects should be removed from the system. Delete these employee records.
DELETE FROM Employee
WHERE DateOfJoining  < '2020-01-01'
  AND (CurrentProject IS NULL OR CurrentProject = '');


-- Situation -5: After the closure of "Project Beta", we need to delete all records of employees who were working on this project (assumed to be recorded in ProjectName).
DELETE FROM Employee
WHERE ProjectName = 'Project Beta';

-- Situation -6: An employee, EmployeeID 135, was added mistakenly and is no longer part of the organization. Please delete their record from the Employee table.
DELETE FROM Employee
WHERE EmployeeID = 135;

-- Situation -7: The Marketing department (DepartmentID: 3) has undergone significant layoffs. Delete all records of employees who worked in the Marketing department and joined before 2021.
DELETE FROM Employee
WHERE DepartmentID = 3
  AND DateOfJoining < '2021-01-01';

-- Situation -8: As part of a data privacy initiative, we need to delete records of employees who have not provided their email addresses or contact numbers.
DELETE FROM Employee
WHERE Email IS NULL
   OR PhoneNumber IS NULL;

-- Situation -9: We need to remove all employees whose salary is above ₹1,00,000 but were part of a temporary contract that has now expired. Delete these employee records.
DELETE FROM Employee
WHERE Salary > 100000
  AND ContractType = 'Temporary';

-- Situation -10: The company has decided to shut down operations in certain regions. Delete the employee records of those who were hired in the "North" region (assuming a Region column exists), and whose employment ended before 2023
DELETE FROM Employee
WHERE Region = 'North'
  AND EmploymentEndDate < '2023-01-01';

-- Situation -1: Due to a change in company policy, we need to rename the Employee table to Staff. 
RENAME TABLE Employee TO Staff;
SHOW TABLES;
RENAME TABLE Staff TO Employee;

-- Situation -2: As the company has decided to start tracking employees' marital status, add a new column MaritalStatus of type VARCHAR(20) to the Employee table.Note: Please do retrieve the changes made for consistency of the data and ensure the dataremains accurate for all future entries.
ALTER TABLE Employee
ADD MaritalStatus VARCHAR(20);
DESC Employee;

-- Situation -3: The company has decided to store the employees' date of birth. Add a DateOfBirthcolumn of type DATE to the Employee table.Note: Please ensure to retrieve the changes made to check the column's impact on future data consistency.
ALTER TABLE Employee
ADD DateOfBirth DATE;

-- Situation -4: We need to change the data type of the Salary column in the Employee table from INTto DECIMAL(10,2) to accommodate fractional salary amounts.Note: Please do retrieve the changes made for consistency of the data, ensuring that all existing salary data is preserved accurately.
ALTER TABLE Employee
MODIFY Salary DECIMAL(10,2);

-- Situation -5: To better categorize employees, we need to add a new column EmployeeCategory in the Employee table. The column should accept values like "Full-time", "Part-time", or "Contract".Note: Please ensure the changes are reflected and retrieve the updated schema for consistency.
ALTER TABLE Employee
ADD EmployeeCategory VARCHAR(20);

-- Situation -6: The company wants to keep track of the department name for employees. Therefore, a column DepartmentName should be added to the Employee table.Note: After making the change, please retrieve the updates to ensure the column is populated correctly for future entrie
ALTER TABLE Employee
ADD DepartmentName VARCHAR(100);

-- Situation -7: We need to set the default value of the Status column in the Employee table to 
ALTER TABLE Employee
ALTER Status SET DEFAULT 'Active';

-- Situation -8: As part of a company-wide restructuring, the DepartmentID column in the Employeetable should be renamed to TeamID to reflect the new team-based structure.Note: Please retrieve the changes made for consistency of the data. If necessary, restore the column name back to DepartmentID for future references.
ALTER TABLE Employee
CHANGE DepartmentID TeamID INT;
DESC Employee;
ALTER TABLE Employee
CHANGE TeamID DepartmentID INT;

-- Situation -9: The company has decided to archive old employee data, so the Employee table needs to be partitioned by JoinDate in order to keep the data for employees who joined before 2020 separate.Note: After partitioning the data, ensure to retrieve the changes and check the data consistency and accessibility for employees prior to 2020.
ALTER TABLE Employee
PARTITION BY RANGE (YEAR(JoinDate)) (
  PARTITION p_before_2020 VALUES LESS THAN (2020),
  PARTITION p_2020_onwards VALUES LESS THAN MAXVALUE
);
SHOW CREATE TABLE Employee;

-- Situation -10: We need to create a foreign key constraint between the Employee table and the Department table to ensure the integrity of the department data linked to each employee.Note: Please retrieve the changes made to verify the foreign key relationship, ensuring data integrity and consistency across both tables
ALTER TABLE Employee
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID);
