# Impact of AI on Employment

This database implementation is used to analyse the impact of Artificial Intelligence on the labor market. The database models relationships between industries, companies, occupation, AI technology and workers to track salary distribution, task exposure and automation risks. 

## Structure and Execution Order

To run this project on a local MySQL server, execute the '.sql' scripts in the order below:

1. **'Schema.sql'** creates the database tables ('Industry', 'Company', 'Occupation', 'Skill', 'Worker', etc.)
2. **'MockData.sql'** inserts data into tables with realistic test data across the sectors 
3. **'BasicQueries.sql'** includes standard CRUD and data retrieval operations (eg. filtering high salary roles)
4. **'AdvancedQueries.sql'** demonstrates complex multi-table JOINs and aggregations (eg. evaluating highest AI exposure by industry) 

## Prerequisites 
- A functional MySQL DBMS environment (or a compatible SQL client).
- Execute 'Schema.sql' first before running data insertion or queries. 

## ONet Dataset Integration
To incorporate real-world occupational data, we replaced our original Job_Title and Software_Skill tables with the job_titles and software_skills tables from the O*NET dataset.

The original tables used occupation_id as a foreign key to reference the Occupation table. However, the O*NET dataset identifies occupations using standardized onetsoc_code values. To accommodate this, we added an onetsoc_code column to our existing Occupation table.

The imported tables retain their original O*NET structure, including job titles, software examples, and technology demand indicators. This allows us to use real occupational data without manually assigning internal IDs to thousands of records.

Our existing relationships, such as those between Occupation, Worker, and Skill, still use occupation_id. The new O*NET tables can be linked to Occupation through SQL JOIN queries using onetsoc_code instead.

This approach preserves the existing database structure while integrating larger, real-world datasets.