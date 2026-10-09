-- Query 1: Occupations with industry and AI-exposure score | Author: GitHub Copilot
SELECT
    o.occupation_name,
    i.industry_name,
    o.ai_exposure_score
FROM Occupation o
JOIN Industry i
    ON o.industry_id = i.industry_id
ORDER BY o.ai_exposure_score DESC;

-- Query 2: O*NET software skills for project occupations | Author: GitHub Copilot
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