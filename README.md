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
