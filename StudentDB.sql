CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE IF NOT EXISTS Departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    head_of_department VARCHAR(100),
    office_location VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    address TEXT,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    admission_year INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE IF NOT EXISTS Courses (
    course_id INT PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL,
    credit_hours INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE IF NOT EXISTS Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE IF NOT EXISTS Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    date DATE,
    status VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE IF NOT EXISTS Results (
    result_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    exam_type VARCHAR(20),
    score DECIMAL(5, 2),
    exam_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE IF NOT EXISTS Fees (
    fee_id INT PRIMARY KEY,
    student_id INT,
    amount_due DECIMAL(10, 2),
    amount_paid DECIMAL(10, 2),
    due_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE IF NOT EXISTS Scholarships (
    scholarship_id INT PRIMARY KEY,
    student_id INT,
    scholarship_name VARCHAR(100),
    amount DECIMAL(10, 2),
    award_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Departments (department_id, name, head_of_department, office_location)
VALUES
(1, 'Computer Science', 'Dr. John Doe', 'Building A, Room 101'),
(2, 'Business Administration', 'Prof. Jane Smith', 'Building B, Room 202'),
(3, 'Mechanical Engineering', 'Dr. William Brown', 'Building C, Room 303'),
(4, 'Electrical Engineering', 'Dr. Sarah White', 'Building D, Room 404'),
(5, 'Civil Engineering', 'Prof. Mark Green', 'Building E, Room 505');

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender, address, contact_number, email, admission_year, department_id)
VALUES
(1, 'Alice', 'Johnson', '2000-05-15', 'Female', '123 Maple St', '555-1234', 'alice.johnson@example.com', 2020, 1),
(2, 'Bob', 'Williams', '1999-08-22', 'Male', '456 Oak St', '555-5678', 'bob.williams@example.com', 2021, 2),
(3, 'Charlie', 'Brown', '2001-11-10', 'Male', '789 Pine St', '555-9876', 'charlie.brown@example.com', 2022, 3),
(4, 'David', 'Miller', '2000-02-14', 'Male', '321 Birch St', '555-5432', 'david.miller@example.com', 2021, 4),
(5, 'Eva', 'Taylor', '1998-12-04', 'Female', '654 Cedar St', '555-8765', 'eva.taylor@example.com', 2020, 5);

INSERT INTO Courses (course_id, course_code, name, credit_hours, department_id)
VALUES
(1, 'CS101', 'Introduction to Programming', 3, 1),
(2, 'BUS202', 'Business Ethics', 3, 2),
(3, 'ME303', 'Mechanics of Materials', 4, 3),
(4, 'EE404', 'Circuit Design', 4, 4),
(5, 'CE505', 'Structural Analysis', 3, 5);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, semester, enrollment_date)
VALUES
(1, 1, 1, 'Fall 2020', '2020-08-01'),
(2, 2, 2, 'Spring 2021', '2021-01-15'),
(3, 3, 3, 'Fall 2022', '2022-08-25'),
(4, 4, 4, 'Spring 2021', '2021-01-10'),
(5, 5, 5, 'Fall 2020', '2020-09-05');

INSERT INTO Attendance (attendance_id, student_id, course_id, date, status)
VALUES
(1, 1, 1, '2020-09-01', 'Present'),
(2, 2, 2, '2021-03-10', 'Absent'),
(3, 3, 3, '2022-09-12', 'Present'),
(4, 4, 4, '2021-02-20', 'Present'),
(5, 5, 5, '2020-10-05', 'Absent');

INSERT INTO Results (result_id, student_id, course_id, exam_type, score, exam_date)
VALUES
(1, 1, 1, 'Final', 85.50, '2020-12-15'),
(2, 2, 2, 'Midterm', 78.00, '2021-05-10'),
(3, 3, 3, 'Project', 92.00, '2022-12-05'),
(4, 4, 4, 'Final', 88.00, '2021-05-15'),
(5, 5, 5, 'Midterm', 75.00, '2020-11-01');

INSERT INTO Fees (fee_id, student_id, amount_due, amount_paid, due_date, payment_status)
VALUES
(1, 1, 1000.00, 500.00, '2020-09-30', 'Paid'),
(2, 2, 1200.00, 1200.00, '2021-02-28', 'Paid'),
(3, 3, 1500.00, 300.00, '2022-08-15', 'Pending'),
(4, 4, 1100.00, 1100.00, '2021-03-01', 'Paid'),
(5, 5, 1300.00, 500.00, '2020-12-15', 'Pending');

INSERT INTO Scholarships (scholarship_id, student_id, scholarship_name, amount, award_date)
VALUES
(1, 1, 'Merit Scholarship', 500.00, '2020-08-01'),
(2, 3, 'Sports Scholarship', 300.00, '2022-09-01'),
(3, 4, 'Engineering Excellence Scholarship', 700.00, '2021-01-15'),
(4, 5, 'Academic Achievement Scholarship', 450.00, '2020-11-20');
