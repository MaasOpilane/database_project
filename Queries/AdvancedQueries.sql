--Average salary by occupation
SELECT
    o.occupation_name,
    COUNT(w.worker_id) AS number_of_workers,
    AVG(w.salary) AS average_salary
FROM Occupation o
JOIN Worker w
    ON o.occupation_id = w.occupation_id
GROUP BY o.occupation_id, o.occupation_name
ORDER BY average_salary DESC;

--Highest AI exposure industries
SELECT
    i.industry_name,
    AVG(o.ai_exposure_score) AS average_ai_exposure
FROM Industry i
JOIN Occupation o
    ON i.industry_id = o.industry_id
GROUP BY i.industry_id, i.industry_name
ORDER BY average_ai_exposure DESC;

--AI technologies used by each company
SELECT
    c.company_name,
    a.technology_name,
    cat.adoption_date,
    cat.implementation_status
FROM Company c
JOIN Company_AI_Technology cat
    ON c.company_id = cat.company_id
JOIN AI_Technology a
    ON cat.technology_id = a.technology_id
ORDER BY c.company_name;

--Occupations with the most hot technologies
SELECT
    o.occupation_name,
    COUNT(*) AS hot_technologies
FROM Occupation o
JOIN Software_Skill ss
    ON o.occupation_id = ss.occupation_id
WHERE ss.hot_technology = 'Y'
GROUP BY o.occupation_id, o.occupation_name
ORDER BY hot_technologies DESC;


-- In-demand software skills by occupation
SELECT
    software_name,
    COUNT(DISTINCT occupation_id) AS occupations
FROM Software_Skill
WHERE in_demand = TRUE
GROUP BY software_name
ORDER BY occupations DESC;

-- O*NET alternate job titles for occupations in this project
SELECT
    o.occupation_name,
    o.onetsoc_code,
    jt.job_title,
    jt.short_title
FROM Occupation o
JOIN job_titles jt
    ON o.onetsoc_code = jt.onetsoc_code
ORDER BY o.occupation_name, jt.job_title;

-- O*NET software skills associated with occupations in this project
SELECT
    o.occupation_name,
    o.onetsoc_code,
    ss.workplace_example AS software_or_technology,
    ss.hot_technology,
    ss.in_demand
FROM Occupation o
JOIN software_skills ss
    ON o.onetsoc_code = ss.onetsoc_code
ORDER BY o.occupation_name, ss.workplace_example;