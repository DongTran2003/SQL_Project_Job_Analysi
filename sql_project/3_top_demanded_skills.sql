/*
Identify the top 5 highest in demand skills for Data Analyst jobs in the USA
*/


SELECT 
    COUNT(skills_job_dim.job_id) AS number_of_posts,
    sd.skills,
    sd.skill_id,
    sd.type
FROM skills_job_dim
JOIN skills_dim as sd
    ON sd.skill_id = skills_job_dim.skill_id
JOIN job_postings_fact AS job_postings
    ON job_postings.job_id = skills_job_dim.job_id

WHERE job_postings.job_title_short = 'Data Analyst' AND
    job_postings.job_country = 'United States'
GROUP BY sd.skill_id
ORDER BY number_of_posts DESC
LIMIT 5

/*
Most highest in demand skills:
1. SQL
2. Excel
3. Tableau
4. Python
5. R

[
  {
    "number_of_posts": "34505",
    "skills": "sql",
    "skill_id": 0,
    "type": "programming"
  },
  {
    "number_of_posts": "27576",
    "skills": "excel",
    "skill_id": 181,
    "type": "analyst_tools"
  },
  {
    "number_of_posts": "19350",
    "skills": "tableau",
    "skill_id": 182,
    "type": "analyst_tools"
  },
  {
    "number_of_posts": "18411",
    "skills": "python",
    "skill_id": 1,
    "type": "programming"
  },
  {
    "number_of_posts": "11670",
    "skills": "r",
    "skill_id": 5,
    "type": "programming"
  }
]

*/