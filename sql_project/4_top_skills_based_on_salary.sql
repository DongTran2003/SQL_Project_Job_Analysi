/*
Identify the top 50 skills based on salary for Data Analyst roles in the USA
*/

SELECT
    sd.skills,
    ROUND(AVG(salary_year_avg), 0) AS "Yearly Salary"
FROM job_postings_fact
JOIN skills_job_dim AS sjd
    ON sjd.job_id = job_postings_fact.job_id
JOIN skills_dim AS sd
    ON sd.skill_id = sjd.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL AND
    job_postings_fact.job_country = 'United States'
    
GROUP BY sd.skill_id
ORDER BY "Yearly Salary" DESC
LIMIT 50

/*
- High-Demand, High-Salary Skills: Specialized skills such as dplyr (196,250 USD), solidity (179,000 USD), and hugging face (175,000 USD) command top salaries, reflecting a high demand for niche expertise.

- Essential Tools and Platforms: Proficiency in tools like Bitbucket, GitLab, and Couchbase, as well as machine learning frameworks like TensorFlow and PyTorch, are highly valued.

Cloud and Big Data Technologies: Expertise in cloud databases (e.g., DynamoDB, Snowflake) and big data tools (e.g., Spark, Kafka) is crucial, highlighting the importance of managing and analyzing large datasets.

[
  {
    "skills": "dplyr",
    "Yearly Salary": "196250"
  },
  {
    "skills": "solidity",
    "Yearly Salary": "179000"
  },
  {
    "skills": "hugging face",
    "Yearly Salary": "175000"
  },
  {
    "skills": "bitbucket",
    "Yearly Salary": "163161"
  },
  {
    "skills": "couchbase",
    "Yearly Salary": "160515"
  },
  {
    "skills": "ansible",
    "Yearly Salary": "159640"
  },
  {
    "skills": "gitlab",
    "Yearly Salary": "154500"
  },
  {
    "skills": "mxnet",
    "Yearly Salary": "149000"
  },
  {
    "skills": "cassandra",
    "Yearly Salary": "148931"
  },
  {
    "skills": "vmware",
    "Yearly Salary": "147500"
  },
  {
    "skills": "golang",
    "Yearly Salary": "145000"
  },
  {
    "skills": "twilio",
    "Yearly Salary": "138500"
  },
  {
    "skills": "rust",
    "Yearly Salary": "138250"
  },
  {
    "skills": "keras",
    "Yearly Salary": "137020"
  },
  {
    "skills": "notion",
    "Yearly Salary": "133125"
  },
  {
    "skills": "perl",
    "Yearly Salary": "132119"
  },
  {
    "skills": "puppet",
    "Yearly Salary": "129820"
  },
  {
    "skills": "kafka",
    "Yearly Salary": "127430"
  },
  {
    "skills": "pytorch",
    "Yearly Salary": "125182"
  },
  {
    "skills": "dynamodb",
    "Yearly Salary": "123333"
  },
  {
    "skills": "airflow",
    "Yearly Salary": "122718"
  },
  {
    "skills": "node",
    "Yearly Salary": "122500"
  },
  {
    "skills": "swift",
    "Yearly Salary": "122500"
  },
  {
    "skills": "pyspark",
    "Yearly Salary": "120569"
  },
  {
    "skills": "elasticsearch",
    "Yearly Salary": "119333"
  },
  {
    "skills": "gcp",
    "Yearly Salary": "119049"
  },
  {
    "skills": "tensorflow",
    "Yearly Salary": "118324"
  },
  {
    "skills": "splunk",
    "Yearly Salary": "117350"
  },
  {
    "skills": "atlassian",
    "Yearly Salary": "116898"
  },
  {
    "skills": "spark",
    "Yearly Salary": "116324"
  },
  {
    "skills": "scala",
    "Yearly Salary": "114905"
  },
  {
    "skills": "hadoop",
    "Yearly Salary": "114686"
  },
  {
    "skills": "jupyter",
    "Yearly Salary": "114578"
  },
  {
    "skills": "databricks",
    "Yearly Salary": "114270"
  },
  {
    "skills": "confluence",
    "Yearly Salary": "114254"
  },
  {
    "skills": "pandas",
    "Yearly Salary": "114222"
  },
  {
    "skills": "express",
    "Yearly Salary": "114122"
  },
  {
    "skills": "unify",
    "Yearly Salary": "113520"
  },
  {
    "skills": "cordova",
    "Yearly Salary": "113270"
  },
  {
    "skills": "shell",
    "Yearly Salary": "112895"
  },
  {
    "skills": "scikit-learn",
    "Yearly Salary": "112671"
  },
  {
    "skills": "snowflake",
    "Yearly Salary": "112329"
  },
  {
    "skills": "bigquery",
    "Yearly Salary": "112178"
  },
  {
    "skills": "unix",
    "Yearly Salary": "112026"
  },
  {
    "skills": "numpy",
    "Yearly Salary": "111462"
  },
  {
    "skills": "node.js",
    "Yearly Salary": "111373"
  },
  {
    "skills": "mongodb",
    "Yearly Salary": "111236"
  },
  {
    "skills": "mongodb",
    "Yearly Salary": "111236"
  },
  {
    "skills": "php",
    "Yearly Salary": "110447"
  },
  {
    "skills": "git",
    "Yearly Salary": "110438"
  }
]
*/