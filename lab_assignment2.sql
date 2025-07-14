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


--INNER JOIN --
--Students and their enrollments--
mysql> SELECT
    -> s.student_id,
    -> s.full_name,
    -> e.enrollment_id,
    -> e.course_id,
    -> e.enrollment_date
    -> FROM student s
    -> INNER JOIN enrollment e ON s.student_id = e.student_id;
+------------+--------------+---------------+-----------+-----------------+
| student_id | full_name    | enrollment_id | course_id | enrollment_date |
+------------+--------------+---------------+-----------+-----------------+
|          1 | Rohit Kapur  |          1001 |       101 | 2025-06-10      |
|          1 | Rohit Kapur  |          1002 |       105 | 2025-06-15      |
|          2 | Rahul Verma  |          1003 |       102 | 2025-06-11      |
|          2 | Rahul Verma  |          1004 |       106 | 2025-06-17      |
|          3 | Divya Sharma |          1005 |       103 | 2025-06-12      |
|          3 | Divya Sharma |          1012 |       107 | 2025-06-22      |
|          4 | Aman Jain    |          1006 |       104 | 2025-06-13      |
|          4 | Aman Jain    |          1013 |       107 | 2025-06-23      |
|          5 | Sneha Iyer   |          1007 |       101 | 2025-06-14      |
|          5 | Sneha Iyer   |          1008 |       105 | 2025-06-18      |
|          6 | Raj Malhotra |          1009 |       106 | 2025-06-19      |
|          7 | Tanya Singh  |          1010 |       103 | 2025-06-20      |
|          7 | Tanya Singh  |          1014 |       101 | 2025-06-24      |
|          8 | Kunal Joshi  |          1011 |       102 | 2025-06-21      |
|          8 | Kunal Joshi  |          1015 |       105 | 2025-06-25      |
+------------+--------------+---------------+-----------+-----------------+
15 rows in set (0.00 sec)

--LEFT JOIN--
--All students (even those not enrolled)--
mysql> SELECT
    -> s.student_id,
    -> s.full_name,
    -> e.enrollment_id,
    -> e.course_id
    -> FROM student s
    -> LEFT JOIN enrollment e ON s.student_id = e.student_id;
+------------+--------------+---------------+-----------+
| student_id | full_name    | enrollment_id | course_id |
+------------+--------------+---------------+-----------+
|          1 | Rohit Kapur  |          1001 |       101 |
|          1 | Rohit Kapur  |          1002 |       105 |
|          2 | Rahul Verma  |          1003 |       102 |
|          2 | Rahul Verma  |          1004 |       106 |
|          3 | Divya Sharma |          1005 |       103 |
|          3 | Divya Sharma |          1012 |       107 |
|          4 | Aman Jain    |          1006 |       104 |
|          4 | Aman Jain    |          1013 |       107 |
|          5 | Sneha Iyer   |          1007 |       101 |
|          5 | Sneha Iyer   |          1008 |       105 |
|          6 | Raj Malhotra |          1009 |       106 |
|          7 | Tanya Singh  |          1010 |       103 |
|          7 | Tanya Singh  |          1014 |       101 |
|          8 | Kunal Joshi  |          1011 |       102 |
|          8 | Kunal Joshi  |          1015 |       105 |
+------------+--------------+---------------+-----------+
15 rows in set (0.00 sec)

--RIGHT JOIN--
--All enrollments--
mysql> SELECT
    -> s.full_name,
    -> e.enrollment_id,
    -> e.course_id
    -> FROM student s
    -> RIGHT JOIN enrollment e ON s.student_id = e.student_id;
+--------------+---------------+-----------+
| full_name    | enrollment_id | course_id |
+--------------+---------------+-----------+
| Rohit Kapur  |          1001 |       101 |
| Rohit Kapur  |          1002 |       105 |
| Rahul Verma  |          1003 |       102 |
| Rahul Verma  |          1004 |       106 |
| Divya Sharma |          1005 |       103 |
| Aman Jain    |          1006 |       104 |
| Sneha Iyer   |          1007 |       101 |
| Sneha Iyer   |          1008 |       105 |
| Raj Malhotra |          1009 |       106 |
| Tanya Singh  |          1010 |       103 |
| Kunal Joshi  |          1011 |       102 |
| Divya Sharma |          1012 |       107 |
| Aman Jain    |          1013 |       107 |
| Tanya Singh  |          1014 |       101 |
| Kunal Joshi  |          1015 |       105 |
+--------------+---------------+-----------+
15 rows in set (0.00 sec)

--SELF JOIN--
--Students from same department--
mysql> SELECT
    -> A.full_name AS student1,
    -> B.full_name AS student2,
    -> A.department
    -> FROM student A
    -> JOIN student B ON A.department = B.department
    -> WHERE A.student_id < B.student_id;
+--------------+-------------+------------------+
| student1     | student2    | department       |
+--------------+-------------+------------------+
| Rohit Kapur  | Sneha Iyer  | Computer Science |
| Rahul Verma  | Kunal Joshi | Electronics      |
| Divya Sharma | Tanya Singh | Mechanical       |
+--------------+-------------+------------------+
3 rows in set (0.00 sec)

--FULL OUTER JOIN--
--Show all students and all enrollments (matched and unmatched)--
--LEFT JOIN All students--
mysql> SELECT
    ->     s.student_id,
    ->     s.full_name,
    ->     e.enrollment_id,
    ->     e.course_id
    -> FROM
    ->     student s
    -> LEFT JOIN
    ->     enrollment e ON s.student_id = e.student_id
    -> UNION
--RIGHT JOIN All enrollments--
    -> SELECT
    ->     s.student_id,
    ->     s.full_name,
    ->     e.enrollment_id,
    ->     e.course_id
    -> FROM
    ->     student s
    -> RIGHT JOIN
    ->     enrollment e ON s.student_id = e.student_id;
+------------+--------------+---------------+-----------+
| student_id | full_name    | enrollment_id | course_id |
+------------+--------------+---------------+-----------+
|          1 | Rohit Kapur  |          1001 |       101 |
|          1 | Rohit Kapur  |          1002 |       105 |
|          2 | Rahul Verma  |          1003 |       102 |
|          2 | Rahul Verma  |          1004 |       106 |
|          3 | Divya Sharma |          1005 |       103 |
|          3 | Divya Sharma |          1012 |       107 |
|          4 | Aman Jain    |          1006 |       104 |
|          4 | Aman Jain    |          1013 |       107 |
|          5 | Sneha Iyer   |          1007 |       101 |
|          5 | Sneha Iyer   |          1008 |       105 |
|          6 | Raj Malhotra |          1009 |       106 |
|          7 | Tanya Singh  |          1010 |       103 |
|          7 | Tanya Singh  |          1014 |       101 |
|          8 | Kunal Joshi  |          1011 |       102 |
|          8 | Kunal Joshi  |          1015 |       105 |
+------------+--------------+---------------+-----------+
15 rows in set (0.01 sec)

mysql>