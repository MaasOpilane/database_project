CREATE TABLE Industry(
    industry_id INT AUTO_INCREMENT PRIMARY KEY,
    industry_name VARCHAR(100) NOT NULL,
    sector VARCHAR(100), 
    country VARCHAR(100)
);

CREATE TABLE Company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    industry_id INT NOT NULL,
    company_name VARCHAR(150) NOT NULL,
    company_size INT CHECK (company_size >= 0),

    FOREIGN KEY (industry_id)
        REFERENCES Industry(industry_id)
);

CREATE TABLE Occupation(
    occupation_id INT AUTO_INCREMENT PRIMARY KEY,
    industry_id INT NOT NULL,
    occupation_name VARCHAR(100) NOT NULL, 
    ai_exposure_score DECIMAL(5,2)
        CHECK (ai_exposure_score BETWEEN 0 AND 100),

    FOREIGN KEY (industry_id)
        REFERENCES Industry(industry_id)    
);

CREATE TABLE Skill (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    occupation_id INT NOT NULL,
    skill_name VARCHAR(150) NOT NULL,
    ai_complementarity_rating DECIMAL(5,2)
        CHECK (ai_complementarity_rating BETWEEN 0 AND 100),

    FOREIGN KEY (occupation_id)
        REFERENCES Occupation(occupation_id)
);

CREATE TABLE Worker (
    worker_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    occupation_id INT NOT NULL,
    salary DECIMAL(10,2)
        CHECK (salary >= 0),

    FOREIGN KEY (company_id)
        REFERENCES Company(company_id),

    FOREIGN KEY (occupation_id)
        REFERENCES Occupation(occupation_id)
);

CREATE TABLE AI_Technology (
    technology_id INT AUTO_INCREMENT PRIMARY KEY,
    technology_name VARCHAR(150) NOT NULL,
    technology_type VARCHAR(100)
);

CREATE TABLE Company_AI_Technology (
    company_id INT NOT NULL,
    technology_id INT NOT NULL,
    adoption_date DATE,
    implementation_status VARCHAR(50),

    PRIMARY KEY (company_id, technology_id),

    FOREIGN KEY (company_id)
        REFERENCES Company(company_id),

    FOREIGN KEY (technology_id)
        REFERENCES AI_Technology(technology_id)
);