

SELECT *
FROM Industry;

SELECT *
FROM Company;

SELECT c.company_name, i.industry_name
FROM Company c
JOIN Industry i ON c.industry_id = i.industry_id;

SELECT o.occupation_name, i.industry_name
FROM Occupation o
JOIN Industry i ON o.industry_id = i.industry_id;

SELECT *
FROM Worker
WHERE salary > 100000;

SELECT *
FROM Occupation
WHERE ai_exposure_score >= 70;

SELECT c.company_name, a.technology_name
FROM Company c
JOIN Company_AI_Technology ca ON c.company_id = ca.company_id
JOIN AI_Technology a ON ca.technology_id = a.technology_id;
