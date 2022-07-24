-- CHALLANGE
-- Create a new Table with Join and Filter by birth date 
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
-- INTO retirement_title
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
-- INTO unique_titles
FROM retirement_title 
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;


-- Create a new table with number of employees by their job titile who are about to retire 
SELECT COUNT (emp_no), title
-- INTO retiring_titles
FROM unique_titles 
GROUP BY title 
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- Create a table for mentorship eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
                e.first_name,
                e.last_name,
                e.birth_date,
				de.from_date,
				de.to_date,
				t.title
INTO mentorship_prog
FROM employees as e
    INNER JOIN dept_emp as de
	     ON (e.emp_no = de.emp_no)
	INNER JOIN titles as t
	     ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
     AND(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');		 