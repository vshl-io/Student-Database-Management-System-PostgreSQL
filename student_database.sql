-- Create student_table
CREATE TABLE student_table (
    student_id INT PRIMARY KEY,
    stu_name VARCHAR(50) NOT NULL,
    department VARCHAR(20) NOT NULL,
    email_id VARCHAR(100) UNIQUE NOT NULL,
    phone_no VARCHAR(15) NOT NULL, -- used varchar to support STD & ISD codes
    address VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    major VARCHAR(50) NOT NULL,
    gpa DECIMAL(3, 2) NOT NULL,
    grade VARCHAR(5) NOT NULL
);


--Inserting 10 sample records into the "student_table".
INSERT INTO student_table (
    student_id, stu_name, department, email_id, phone_no, address,
    date_of_birth, gender, major, gpa, grade
) VALUES
(1, 'Karthik Subramanian', 'CSE', 'karthik.s@univ.in', '+91-9840012345', '12 T Nagar, Chennai, Tamil Nadu', '2002-01-12', 'Male', 'Machine Learning', 3.8, 'A'),
(2, 'Divya Lakshmi', 'ECE', 'divya.l@univ.in', '+91-9876543210', '45 RS Puram, Coimbatore, Tamil Nadu', '2001-11-25', 'Female', 'VLSI Design', 3.7, 'A-'),
(3, 'Praveen Kumar', 'Mechanical', 'praveen.k@univ.in', '+91-9003456789', '89 Srirangam, Tiruchirappalli, Tamil Nadu', '2000-06-30', 'Male', 'Automobile Engineering', 3.5, 'B+'),
(4, 'Meena Ramesh', 'IT', 'meena.r@univ.in', '+91-9789012345', '27 Anna Nagar, Madurai, Tamil Nadu', '2002-03-17', 'Female', 'Cloud Computing', 3.9, 'A+'),
(5, 'Arun Raj', 'EEE', 'arun.raj@univ.in', '+91-9445567890', '56 VOC Road, Salem, Tamil Nadu', '2001-05-21', 'Male', 'Power Systems', 3.6, 'A-'),
(6, 'Swathi Balaji', 'Civil Engineering', 'swathi.b@univ.in', '+91-9361412345', '34 KK Nagar, Tirunelveli, Tamil Nadu', '2002-08-03', 'Female', 'Structural Engineering', 3.4, 'B+'),
(7, 'Vignesh Kannan', 'Physics', 'vignesh.k@univ.in', '+91-9551612345', '78 Thillai Nagar, Trichy, Tamil Nadu', '2000-12-09', 'Male', 'Solid State Physics', 3.2, 'B'),
(8, 'Anitha Selvam', 'Mathematics', 'anitha.s@univ.in', '+91-9003212345', '11 Gandhipuram, Coimbatore, Tamil Nadu', '2002-10-14', 'Female', 'Applied Mathematics', 3.7, 'A'),
(9, 'Sathish Muthu', 'Commerce', 'sathish.m@univ.in', '+91-9600111222', '88 Periyar Nagar, Vellore, Tamil Nadu', '2001-07-05', 'Male', 'Banking and Finance', 3.3, 'B'),
(10, 'Priya Narayanan', 'Psychology', 'priya.n@univ.in', '+91-9380012345', '23 Race Course, Erode, Tamil Nadu', '2002-02-27', 'Female', 'Child Psychology', 3.8, 'A');


--Develop a query to retrieve all students' information from the "student_table" and sort them in descending order by their grade
SELECT * FROM student_table
ORDER BY grade DESC;

--Implement a query to retrieve information about all male students from the "student_table."
SELECT * FROM student_table
WHERE gender = 'Male';

--Create a query to fetch the details of students who have a GPA less than 5.0 from the "student_table."
SELECT * FROM student_table
WHERE gpa < 5;

--Write an update statement to modify the email and grade of a student with a specific ID in the "student_table."
UPDATE student_table
SET 
email_id = 'karthik.s@gmail.com',
grade = 'A'  
WHERE student_id = 1;  

--Develop a query to retrieve the names and ages of all students who have a grade of "B" from the "student_table."
SELECT stu_name, grade, EXTRACT (YEAR FROM AGE(date_of_birth)) AS age FROM student_table
WHERE grade = 'B';

--Create a query to group the "student_table" by the "Department" and "Gender" columns and calculate the average GPA for each combination.
SELECT department, gender, ROUND (AVG(gpa), 2) AS avg_gpa FROM student_table
GROUP BY department, gender;

--Rename the "student_table" to "student_info" using the appropriate SQL statement.
ALTER TABLE student_table
RENAME TO student_info;

--Write a query to retrieve the name of the student with the highest GPA from the "student_info" table.
SELECT stu_name FROM student_info
ORDER BY gpa DESC
LIMIT 1;



