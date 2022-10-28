SELECT emp.emp_no,
       emp.first_name,
       emp.last_name,
       ti.title,
       ti.from_date,
       ti.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles as ti
ON emp.emp_no = ti.emp_no
WHERE (birth_date between '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no ;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp.emp_no, ti.to_date DESC;

SELECT COUNT(title),
	   title
FROM unique_titles
GROUP BY title
ORDER BY count DESC

SELECT DISTINCT ON (emp.emp_no) emp.emp_no,  
       emp.first_name,
       emp.last_name,
       emp.birth_date,
       dept_emp.from_date,
       dept_emp.to_date,
       titles.title
INTO mentorship_eligibility
FROM employees as emp 
INNER JOIN dept_emp 
ON emp.emp_no = dept_emp.emp_no 
INNER JOIN titles
ON emp.emp_no = titles.emp_no
WHERE(dept_emp.to_date = '9999-01-01' AND emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no ASC, titles.from_date DESC;