INSERT INTO Industry (industry_name, sector, country)
VALUES
('Technology', 'IT', 'Netherlands'),
('Healthcare', 'healthcare', 'Netherlands'),
('Finance', 'accounting', 'Poland'),
('Manufacturing', 'industrial', 'Belgium'),
('Education', 'education', 'Poland');

INSERT INTO Company (industry_id, company_name, company_size)
VALUES
(1, 'TechSolutionsNL', 820),
(1, 'CodeCraft Amsterdam', 340),
(1, 'CloudWorks Netherlands', 560),
(1, 'DigitalFlow NL', 190),

(2, 'Maastricht Hospital', 1200),
(2, 'HealthCare Limburg', 480),
(2, 'MedTech Netherlands', 275),
(2, 'CareConnect NL', 150),

(3, 'Polish Finance Group', 950),
(3, 'Warsaw Accounting Partners', 320),
(3, 'Baltic Financial Services', 610),
(3, 'Krakow Investment Group', 180),

(4, 'Belgian Industrial Works', 1100),
(4, 'Brussels Manufacturing', 670),
(4, 'Flanders Engineering', 430),
(4, 'Antwerp Production Group', 820),

(5, 'Polish Education Group', 750),
(5, 'Warsaw Learning Institute', 320),
(5, 'Krakow Academic Services', 185),
(5, 'FutureLearn Poland', 240);

INSERT INTO Occupation
(industry_id, occupation_name, ai_exposure_score)
VALUES

(1, 'Software Developer', 82.50),
(1, 'Data Analyst', 88.00),
(1, 'IT Project Manager', 68.00),

(2, 'Nurse', 38.00),
(2, 'Medical Assistant', 45.00),
(2, 'Healthcare Data Analyst', 78.50),

(3, 'Accountant', 85.50),
(3, 'Financial Analyst', 91.00),
(3, 'Risk Manager', 72.00),

(4, 'Production Engineer', 70.00),
(4, 'Machine Operator', 82.00),
(4, 'Quality Control Specialist', 64.00),

(5, 'Teacher', 42.00),
(5, 'Education Coordinator', 55.00),
(5, 'Instructional Designer', 73.00);

INSERT INTO Skill
(occupation_id, skill_name, ai_complementarity_rating)
VALUES

(1, 'Programming', 88.00),
(1, 'Problem Solving', 94.00),
(1, 'System Design', 85.00),

(2, 'Data Analysis', 92.00),
(2, 'Statistics', 89.00),
(2, 'Data Visualization', 86.00),

(3, 'Project Management', 82.00),
(3, 'Communication', 91.00),

(4, 'Patient Care', 95.00),
(4, 'Clinical Communication', 93.00),

(5, 'Patient Administration', 86.00),
(5, 'Medical Documentation', 80.00),

(6, 'Healthcare Analytics', 91.00),
(6, 'Statistics', 88.00),
(6, 'Data Management', 90.00),

(7, 'Financial Reporting', 84.00),
(7, 'Bookkeeping', 76.00),
(7, 'Attention to Detail', 92.00),

(8, 'Financial Modeling', 89.00),
(8, 'Data Analysis', 93.00),
(8, 'Forecasting', 87.00),

(9, 'Risk Analysis', 91.00),
(9, 'Financial Risk Assessment', 94.00),

(10, 'Engineering Design', 84.00),
(10, 'Process Optimization', 88.00),
(10, 'Problem Solving', 90.00),

(11, 'Machine Operation', 75.00),
(11, 'Technical Troubleshooting', 82.00),

(12, 'Quality Assurance', 87.00),
(12, 'Data Analysis', 85.00),

(13, 'Communication', 94.00),
(13, 'Classroom Management', 88.00),
(13, 'Critical Thinking', 91.00),

(14, 'Organization', 89.00),
(14, 'Communication', 93.00),

(15, 'Curriculum Design', 91.00),
(15, 'Digital Learning', 88.00);

INSERT INTO Worker
(company_id, occupation_id, salary)
VALUES

(1, 1, 58000.00),
(1, 1, 64000.00),
(1, 2, 61000.00),
(1, 3, 72000.00),

(2, 1, 55000.00),
(2, 2, 59000.00),
(2, 3, 68000.00),

(3, 1, 62000.00),
(3, 2, 67000.00),
(3, 2, 71000.00),

(4, 1, 52000.00),
(4, 3, 65000.00),

(5, 4, 48000.00),
(5, 4, 52000.00),
(5, 5, 43000.00),
(5, 6, 61000.00),

(6, 4, 47000.00),
(6, 5, 42000.00),
(6, 6, 58000.00),

(7, 4, 46000.00),
(7, 6, 62000.00),

(8, 4, 49000.00),
(8, 5, 44000.00),

(9, 7, 54000.00),
(9, 8, 72000.00),
(9, 9, 78000.00),

(10, 7, 51000.00),
(10, 8, 69000.00),

(11, 8, 75000.00),
(11, 9, 82000.00),

(12, 7, 49000.00),
(12, 8, 68000.00),

(13, 10, 65000.00),
(13, 11, 46000.00),
(13, 12, 54000.00),

(14, 10, 69000.00),
(14, 11, 48000.00),

(15, 11, 45000.00),
(15, 12, 52000.00),

(16, 10, 71000.00),
(16, 12, 55000.00),

(17, 13, 42000.00),
(17, 14, 48000.00),

(18, 13, 44000.00),
(18, 15, 53000.00),

(19, 13, 41000.00),
(19, 14, 47000.00),

(20, 13, 43000.00),
(20, 15, 55000.00);

INSERT INTO AI_Technology
(technology_name, technology_type)
VALUES
    ('ChatGPT', 'Generative AI'),
    ('Microsoft Copilot', 'Generative AI'),
    ('GitHub Copilot', 'AI Coding Assistant'),
    ('Google Gemini', 'Generative AI'),
    ('TensorFlow', 'Machine Learning Framework'),
    ('Microsoft Azure AI', 'AI Platform'),
    ('Amazon Bedrock', 'AI Platform'),
    ('IBM watsonx', 'Enterprise AI'),
    ('Tableau AI', 'Data Analytics AI'),
    ('UiPath AI', 'Process Automation');

INSERT INTO Company_AI_Technology
(company_id, technology_id, adoption_date, implementation_status)
VALUES

(1, 1, '2024-02-15', 'Active'),
(1, 3, '2024-04-10', 'Active'),
(1, 6, '2024-06-20', 'Active'),

(2, 1, '2024-03-01', 'Active'),
(2, 3, '2024-03-15', 'Active'),

(3, 2, '2024-01-20', 'Active'),
(3, 6, '2024-05-10', 'Active'),
(3, 7, '2024-08-01', 'Testing'),

(4, 4, '2024-04-12', 'Testing'),
(4, 9, '2024-07-15', 'Active'),

(5, 2, '2024-02-01', 'Active'),
(5, 4, '2024-06-01', 'Testing'),
(5, 8, '2024-09-10', 'Testing'),

(6, 2, '2024-03-20', 'Active'),
(6, 9, '2024-05-25', 'Active'),

(7, 5, '2023-11-15', 'Active'),
(7, 6, '2024-02-10', 'Active'),

(8, 2, '2024-07-01', 'Testing'),

(9, 2, '2024-01-15', 'Active'),
(9, 9, '2024-03-10', 'Active'),
(9, 10, '2024-05-20', 'Active'),

(10, 1, '2024-02-20', 'Testing'),
(10, 10, '2024-04-15', 'Active'),

(11, 2, '2024-01-30', 'Active'),
(11, 8, '2024-06-12', 'Active'),

(12, 9, '2024-08-20', 'Testing'),

(13, 5, '2023-10-10', 'Active'),
(13, 10, '2024-01-15', 'Active'),

(14, 6, '2024-03-05', 'Active'),
(14, 7, '2024-07-20', 'Testing'),

(15, 5, '2024-02-25', 'Active'),
(15, 3, '2024-05-15', 'Active'),

(16, 10, '2024-04-30', 'Active'),

(17, 1, '2024-01-10', 'Active'),
(17, 2, '2024-03-15', 'Testing'),

(18, 4, '2024-05-01', 'Active'),
(18, 9, '2024-06-20', 'Active'),

(19, 2, '2024-02-15', 'Testing'),

(20, 4, '2024-04-01', 'Active'),
(20, 2, '2024-05-10', 'Active');