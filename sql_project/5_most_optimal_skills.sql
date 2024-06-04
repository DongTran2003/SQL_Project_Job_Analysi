/*
Identify the most optimal skills for Data Analyst jobs in the USA based on high number of demands and salary

*/

-- 1. Identify the average salary for Data Analyst jobs in the USA
SELECT 
    job_title_short,
    ROUND(AVG(salary_year_avg),0)
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND
    job_country = 'United States' 
GROUP BY job_title_short;

-- The average salary for DA jobs in the USA is $94504, therefore, salary greater than $95000 is considered 'high'

-- Identify the skills that are well-paid (> $95000) and high-demanded
SELECT 
    sd.skills,
    ROUND(AVG(job_postings.salary_year_avg),0) AS "Yearly Salary",
    COUNT(skills_job_dim.job_id) AS number_of_posts
FROM skills_job_dim
JOIN skills_dim as sd
    ON sd.skill_id = skills_job_dim.skill_id
JOIN job_postings_fact AS job_postings
    ON job_postings.job_id = skills_job_dim.job_id

WHERE job_postings.job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL AND
    job_postings.job_country = 'United States' 
GROUP BY sd.skill_id
HAVING ROUND(AVG(job_postings.salary_year_avg),0) > 95000
ORDER BY number_of_posts DESC
LIMIT 20;

/*
Top 20 skills that are well-paid (salary > $95000) and highly demanding (times appeared in job postings) for DA roles in the USA:
1. SQL: 2514 times, salary $97438
2. Python: 1427 times, salary $103390
3. Tableau: 1366 times, salary $99496
4. R: 893 times, salary $100292

1. Most Common Skills:
SQL is the most frequently mentioned skill, appearing in 2514 job postings. This indicates a high demand for SQL expertise.
Python is the second most common skill, appearing in 1427 job postings, followed by Tableau with 1366 mentions.

2. Skills with Both High Demand and High Salary:
Python: $103,390 average yearly salary, 1427 postings.
Tableau: $99,496 average yearly salary, 1366 postings.
SQL: $97,438 average yearly salary, 2514 postings.

[
  {
    "skills": "sql",
    "Yearly Salary": "97438",
    "number_of_posts": "2514"
  },
  {
    "skills": "python",
    "Yearly Salary": "103390",
    "number_of_posts": "1427"
  },
  {
    "skills": "tableau",
    "Yearly Salary": "99496",
    "number_of_posts": "1366"
  },
  {
    "skills": "r",
    "Yearly Salary": "100292",
    "number_of_posts": "893"
  },
  {
    "skills": "sql server",
    "Yearly Salary": "95454",
    "number_of_posts": "287"
  },
  {
    "skills": "oracle",
    "Yearly Salary": "101975",
    "number_of_posts": "275"
  },
  {
    "skills": "go",
    "Yearly Salary": "99966",
    "number_of_posts": "224"
  },
  {
    "skills": "flow",
    "Yearly Salary": "98495",
    "number_of_posts": "216"
  },
  {
    "skills": "azure",
    "Yearly Salary": "105435",
    "number_of_posts": "213"
  },
  {
    "skills": "aws",
    "Yearly Salary": "107376",
    "number_of_posts": "211"
  },
  {
    "skills": "snowflake",
    "Yearly Salary": "112329",
    "number_of_posts": "193"
  },
  {
    "skills": "looker",
    "Yearly Salary": "107370",
    "number_of_posts": "168"
  },
  {
    "skills": "vba",
    "Yearly Salary": "96724",
    "number_of_posts": "146"
  },
  {
    "skills": "jira",
    "Yearly Salary": "108482",
    "number_of_posts": "115"
  },
  {
    "skills": "alteryx",
    "Yearly Salary": "107410",
    "number_of_posts": "106"
  },
  {
    "skills": "java",
    "Yearly Salary": "101742",
    "number_of_posts": "99"
  },
  {
    "skills": "hadoop",
    "Yearly Salary": "114686",
    "number_of_posts": "97"
  },
  {
    "skills": "spark",
    "Yearly Salary": "116324",
    "number_of_posts": "95"
  },
  {
    "skills": "visio",
    "Yearly Salary": "102049",
    "number_of_posts": "91"
  },
  {
    "skills": "ssis",
    "Yearly Salary": "99017",
    "number_of_posts": "88"
  }
]

*/
