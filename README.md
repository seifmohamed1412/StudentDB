# Student Database Management

Project Overview
The Student Database Management System is a comprehensive SQL-based project designed to store and manage student-related data for a fictional educational institution. This system allows the management of various records such as student details, course enrollments, attendance, results, fees, scholarships, and departments.

The project demonstrates the use of relational database design principles by creating multiple interrelated tables, including Students, Departments, Courses, Enrollments, Attendance, Results, Fees, and Scholarships. The system is designed to manage and query information related to student performance, course participation, and financial records in a centralized manner.

Key Features
Departments Table: Stores information about different academic departments within the institution, including department names, heads, and office locations.

Students Table: Contains essential student information such as name, gender, date of birth, address, contact details, and admission year. This table references the Departments table to link students to their respective departments.

Courses Table: Holds details about the courses offered, including course codes, names, and associated department.

Enrollments Table: Links students to their respective courses and tracks the semester and date of enrollment.

Attendance Table: Tracks student attendance for each course, marking their attendance status on specific dates.

Results Table: Contains student exam results, including exam type (e.g., Midterm, Final), scores, and exam dates.

Fees Table: Stores the fee details for each student, including due amounts, payments made, and payment status.

Scholarships Table: Tracks scholarship awards for students, including scholarship type and awarded amounts.

Database Structure
The database uses foreign keys to establish relationships between different tables. For example, each student is linked to a department via department_id, and each course enrollment references both the student and the course through student_id and course_id.

Technologies Used

SQL: The query language used to define the database schema, insert data, and perform CRUD operations.
