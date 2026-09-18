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