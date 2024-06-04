/* 
Identify the top 10 highest-paying Data Analyst roles within USA both onsite and remote 
*/

SELECT
    job_title,
    job_location,
    job_schedule_type,
    job_work_from_home,
    salary_year_avg,
    job_posted_date,
    cd.name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim as cd 
    ON cd.company_id = job_postings_fact.company_id
WHERE job_title_short = 'Data Analyst' AND
    job_country = 'United States' AND
    salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg DESC
LIMIT 10

/*
The top 10 highest paid Data Analyst jobs in the States are:
- Sr Data Analyst
- HC Data Analyst
- Head of Infrastructure Management & Data Analytics - Financial...
- Director of Safety Data Analysis
- Data Analyst
- Head of Data Analytics
- Director of Analytics
- Research Scientist
- Associate Director- Data Insights
- Partner Technology Manager, Data Analytics and AI


[
  {
    "job_title": "Sr Data Analyst",
    "job_location": "Bethesda, MD",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-05 12:00:12",
    "company_name": "Illuminate Mission Solutions"
  },
  {
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-18 07:00:22",
    "company_name": "Illuminate Mission Solutions"
  },
  {
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "job_location": "Jacksonville, FL",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-03 11:30:01",
    "company_name": "Citigroup, Inc"
  },
  {
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics"
  },
  {
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-06-22 07:00:59",
    "company_name": "Anthropic"
  },
  {
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-10-23 05:01:05",
    "company_name": "Care.com"
  },
  {
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42",
    "company_name": "Meta"
  },
  {
    "job_title": "Research Scientist",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "285000.0",
    "job_posted_date": "2023-04-19 18:04:21",
    "company_name": "OpenAI"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T"
  },
  {
    "job_title": "Partner Technology Manager, Data Analytics and AI",
    "job_location": "Austin, TX",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "254000.0",
    "job_posted_date": "2023-07-28 13:01:20",
    "company_name": "Google"
  }
]
*/


