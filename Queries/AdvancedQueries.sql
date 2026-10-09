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


--In-demand software skills by occupation
SELECT
    software_name,
    COUNT(DISTINCT occupation_id) AS occupations
FROM Software_Skill
WHERE in_demand = TRUE
GROUP BY software_name
ORDER BY occupations DESC;

--O*NET alternate job titles for occupations in this project
SELECT
    o.occupation_name,
    o.onetsoc_code,
    jt.job_title,
    jt.short_title
FROM Occupation o
JOIN job_titles jt
    ON o.onetsoc_code = jt.onetsoc_code
ORDER BY o.occupation_name, jt.job_title;

--O*NET software skills associated with occupations in this project
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

--Occupations with industry and AI-exposure score  Celine Reintjes
SELECT
    o.occupation_name,
    i.industry_name,
    o.ai_exposure_score
FROM Occupation o
JOIN Industry i
    ON o.industry_id = i.industry_id
ORDER BY o.ai_exposure_score DESC;

--O*NET software skills for project occupations  Celine Reintjes
SELECT
    o.occupation_name,
    o.onetsoc_code,
    ss.workplace_example AS software_or_technology,
    ss.hot_technology,
    ss.in_demand
FROM Occupation o
JOIN software_skills ss
    ON o.onetsoc_code = ss.onetsoc_code
ORDER BY o.occupation_name, ss.workplace_example
LIMIT 100;

-- Workers earning high salaries who also faces high AI exposure by Michelle Zefanya
SELECT
    w.worker_id, 
    w.salary,
    o.occupation_name,
    o.ai_exposure_score
FROM Worker w
JOIN Occupation o
    ON w.occupation_id = o.occupation_id
WHERE o.ai_exposure_score >= 70
    AND w.salary > (SELECT AVG(salary) FROM Worker)
ORDER BY w.salary DESC;

-- Occupations with skills that work best with AI by Michelle Zefanya
SELECT
    o.occupation_name,
    i.industry_name,
    s.skill_name,
    s.ai_complementarity_rating
FROM Skill s
JOIN Occupation o
    ON s.occupation_id = i.industry_id
WHERE s.ai_complementarity_rating >= 70.00
ORDER BY s.ai_complementarity_rating DESC;



-- Companies using AI by industry Andre Vardja

SELECT
    i.industry_name,
    COUNT(DISTINCT c.company_id) AS companies_using_ai
FROM Industry i
JOIN Company c
    ON i.industry_id = c.industry_id
JOIN Company_AI_Technology cat
    ON c.company_id = cat.company_id
WHERE cat.implementation_status = 'Active'
GROUP BY i.industry_name
ORDER BY companies_using_ai DESC;


-- Workers with high AI exposure by company Andre Vardja

SELECT
    c.company_name,
    COUNT(w.worker_id) AS exposed_workers
FROM Company c
JOIN Worker w
    ON c.company_id = w.company_id
JOIN Occupation o
    ON w.occupation_id = o.occupation_id
WHERE o.ai_exposure_score >= 70
GROUP BY c.company_id, c.company_name
ORDER BY exposed_workers DESC;

-- Occupations with high AI exposure by company Andre Vardja
SELECT
    c.company_name,
    o.occupation_name,
    o.ai_exposure_score
FROM Company c
JOIN Worker w
    ON c.company_id = w.company_id
JOIN Occupation o
    ON w.occupation_id = o.occupation_id
ORDER BY o.ai_exposure_score DESC

-- Most common AI technologies across companies by Simon Tepper
SELECT
    a.technology_name,
    a.technology_type,
    COUNT(cat.company_id) AS number_of_companies
FROM AI_Technology a
JOIN Company_AI_Technology cat
    ON a.technology_id = cat.technology_id
GROUP BY
    a.technology_id,
    a.technology_name,
    a.technology_type
ORDER BY number_of_companies DESC;


-- Companies with the most workers by Simon Tepper
SELECT
    c.company_name,
    i.industry_name,
    c.company_size,
    COUNT(w.worker_id) AS recorded_workers
FROM Company c
JOIN Industry i
    ON c.industry_id = i.industry_id
LEFT JOIN Worker w
    ON c.company_id = w.company_id
GROUP BY
    c.company_id,
    c.company_name,
    i.industry_name,
    c.company_size
ORDER BY recorded_workers DESC;
