/*
Identify the skills required for the top 10 Data Analyst rols in the USA
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        cd.name AS company_name
    FROM job_postings_fact AS job_postings
    LEFT JOIN company_dim as cd 
        ON cd.company_id = job_postings.company_id
    WHERE job_title_short = 'Data Analyst' AND
        job_country = 'United States' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
   LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    sd.skills
FROM skills_job_dim AS sjd
JOIN skills_dim as sd
    ON sd.skill_id = sjd.skill_id
JOIN top_paying_jobs 
    ON top_paying_jobs.job_id = sjd.job_id
ORDER BY salary_year_avg DESC

/*
Most Common Required Skills for the top 10 Data Analyst roles in the USA:

Python: 5 occurrences
SQL: 4 occurrences
R: 4 occurrences
Excel: 4 occurrences
Tableau: 4 occurrences


[
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "python"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "r"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "vba"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "excel"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "tableau"
  },
  {
    "job_id": 641501,
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "salary_year_avg": "375000.0",
    "company_name": "Citigroup, Inc",
    "skills": "excel"
  },
  {
    "job_id": 641501,
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "salary_year_avg": "375000.0",
    "company_name": "Citigroup, Inc",
    "skills": "word"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "sql"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "python"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "r"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "sas"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "matlab"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "spark"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "airflow"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "excel"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "tableau"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "power bi"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "sas"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "sql"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "python"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "r"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "bigquery"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "snowflake"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "tableau"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "power bi"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "looker"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "sql"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "python"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "salary_year_avg": "285000.0",
    "company_name": "OpenAI",
    "skills": "github"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 285766,
    "job_title": "Partner Technology Manager, Data Analytics and AI",
    "salary_year_avg": "254000.0",
    "company_name": "Google",
    "skills": "gcp"
  }
]

*/
