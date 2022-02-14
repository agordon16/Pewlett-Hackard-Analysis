--DELIVERABLE #1
--Employee_Database_challenge.sql
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

--Create Retiring Titles Table
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--DELIVERABLE #2

SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
--INTO 
FROM employees as e
JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (de.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY emp_no;


--DELIVERABLE #3

SELECT SUM (count) as total_count
FROM retiring_titles;

SELECT COUNT (*)
FROM mentorship_eligibilty;
