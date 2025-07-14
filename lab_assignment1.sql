mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sales              |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> create database student;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sales              |
| student            |
| sys                |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> use student;
Database changed
mysql> create table student(
    -> student_id INT PRIMARY KEY,
    -> full_name VARCHAR(100),
    -> department VARCHAR(50));
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE course (
    -> course_id INT PRIMARY KEY,
    -> course_name VARCHAR(100),
    ->  credits INT);
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE enrollment (
    -> enrollment_id INT PRIMARY KEY,
    -> student_id INT,
    -> course_id INT,
    -> enrollment_date DATE,
    -> FOREIGN KEY (student_id) REFERENCES student(student_id),
    ->  FOREIGN KEY (course_id) REFERENCES course(course_id));
Query OK, 0 rows affected (0.06 sec)
mysql> desc student;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| student_id | int          | NO   | PRI | NULL    |       |
| full_name  | varchar(100) | YES  |     | NULL    |       |
| department | varchar(50)  | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> desc course;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| course_id   | int          | NO   | PRI | NULL    |       |
| course_name | varchar(100) | YES  |     | NULL    |       |
| credits     | int          | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc enrollment;
+-----------------+------+------+-----+---------+-------+
| Field           | Type | Null | Key | Default | Extra |
+-----------------+------+------+-----+---------+-------+
| enrollment_id   | int  | NO   | PRI | NULL    |       |
| student_id      | int  | YES  | MUL | NULL    |       |
| course_id       | int  | YES  | MUL | NULL    |       |
| enrollment_date | date | YES  |     | NULL    |       |
+-----------------+------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> INSERT INTO student VALUES
    -> (1, 'Rohit Kapur', 'Computer Science'),
    -> (2, 'Rahul Verma', 'Electronics'),
    -> (3, 'Divya Sharma', 'Mechanical'),
    -> (4, 'Aman Jain', 'Civil'),
    -> (5, 'Sneha Iyer', 'Computer Science'),
    -> (6, 'Raj Malhotra', 'Electrical'),
    -> (7, 'Tanya Singh', 'Mechanical'),
    -> (8, 'Kunal Joshi', 'Electronics');
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> INSERT INTO course VALUES
    -> (101, 'Database Systems', 4),
    -> (102, 'Digital Electronics', 3),
    -> (103, 'Thermodynamics', 4),
    -> (104, 'Structural Engineering', 4),
    -> (105, 'Data Structures', 3),
    -> (106, 'Microprocessors', 3),
    -> (107, 'Environmental Studies', 2);
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> INSERT INTO enrollment VALUES
    -> (1001, 1, 101, '2025-06-10'),
    -> (1002, 1, 105, '2025-06-15'),
    -> (1003, 2, 102, '2025-06-11'),
    -> (1004, 2, 106, '2025-06-17'),
    -> (1005, 3, 103, '2025-06-12'),
    -> (1006, 4, 104, '2025-06-13'),
    -> (1007, 5, 101, '2025-06-14'),
    -> (1008, 5, 105, '2025-06-18'),
    -> (1009, 6, 106, '2025-06-19'),
    -> (1010, 7, 103, '2025-06-20'),
    -> (1011, 8, 102, '2025-06-21'),
    -> (1012, 3, 107, '2025-06-22'),
    -> (1013, 4, 107, '2025-06-23'),
    -> (1014, 7, 101, '2025-06-24'),
    -> (1015, 8, 105, '2025-06-25');
Query OK, 15 rows affected (0.01 sec)
Records: 15  Duplicates: 0  Warnings: 0
mysql> SELECT * FROM student;
+------------+--------------+------------------+
| student_id | full_name    | department       |
+------------+--------------+------------------+
|          1 | Rohit Kapur  | Computer Science |
|          2 | Rahul Verma  | Electronics      |
|          3 | Divya Sharma | Mechanical       |
|          4 | Aman Jain    | Civil            |
|          5 | Sneha Iyer   | Computer Science |
|          6 | Raj Malhotra | Electrical       |
|          7 | Tanya Singh  | Mechanical       |
|          8 | Kunal Joshi  | Electronics      |
+------------+--------------+------------------+
8 rows in set (0.00 sec)

mysql> select * from course;
+-----------+------------------------+---------+
| course_id | course_name            | credits |
+-----------+------------------------+---------+
|       101 | Database Systems       |       4 |
|       102 | Digital Electronics    |       3 |
|       103 | Thermodynamics         |       4 |
|       104 | Structural Engineering |       4 |
|       105 | Data Structures        |       3 |
|       106 | Microprocessors        |       3 |
|       107 | Environmental Studies  |       2 |
+-----------+------------------------+---------+
7 rows in set (0.00 sec)
mysql> select * from enrollment;
+---------------+------------+-----------+-----------------+
| enrollment_id | student_id | course_id | enrollment_date |
+---------------+------------+-----------+-----------------+
|          1001 |          1 |       101 | 2025-06-10      |
|          1002 |          1 |       105 | 2025-06-15      |
|          1003 |          2 |       102 | 2025-06-11      |
|          1004 |          2 |       106 | 2025-06-17      |
|          1005 |          3 |       103 | 2025-06-12      |
|          1006 |          4 |       104 | 2025-06-13      |
|          1007 |          5 |       101 | 2025-06-14      |
|          1008 |          5 |       105 | 2025-06-18      |
|          1009 |          6 |       106 | 2025-06-19      |
|          1010 |          7 |       103 | 2025-06-20      |
|          1011 |          8 |       102 | 2025-06-21      |
|          1012 |          3 |       107 | 2025-06-22      |
|          1013 |          4 |       107 | 2025-06-23      |
|          1014 |          7 |       101 | 2025-06-24      |
|          1015 |          8 |       105 | 2025-06-25      |
+---------------+------------+-----------+-----------------+
15 rows in set (0.00 sec)
