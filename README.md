# Impact of AI on Employment

This project uses a MySQL relational database to explore how AI adoption and occupational characteristics can be viewed across industries, companies, workers, and occupations. It combines illustrative project data with occupation reference data from O*NET 31.0.

The salaries, AI adoption records, skills, and AI exposure scores in `data/MockData.sql` are mock values for the project; they are not official O*NET measurements or evidence of a causal effect of AI on employment. The O*NET files provide occupation titles and software-skill information that can be matched to project occupations by SOC code.

## Repository Layout

```text
schema/                    Core project table definitions
data/                      Mock records and versioned O*NET source data
onet31.0/                  O*NET 31.0 SQL files and source note
Queries/                   Basic, advanced, and SELECT examples
docs/                      Assignment briefs and entity-relationship diagram
README.md                  Setup, data, and query guide
```

## Requirements

- MySQL 8.0 or a compatible MySQL server and SQL client.
- Run all scripts in the same database. The O*NET scripts create their own tables, so do not pre-create those tables separately.

## Create and Load the Database

Create a database and select it before loading any scripts:

```sql
CREATE DATABASE ai_employment;
USE ai_employment;
```

From the MySQL client, run the scripts in this order:

1. `schema/Schema.sql` creates the core project tables.
2. `data/MockData.sql` inserts the illustrative project records. It expects the schema's auto-increment IDs to start from an empty database.
3. `data/onet31.0/23_software_skills.sql` creates and loads O*NET database table 23, `software_skills`.
4. `data/onet31.0/36_job_titles.sql` creates and loads O*NET database table 36, `job_titles`.
5. Run the query files after both data sources have loaded.

For example, from the repository root in the interactive MySQL client:

```sql
SOURCE schema/Schema.sql;
SOURCE data/MockData.sql;
SOURCE data/onet31.0/23_software_skills.sql;
SOURCE data/onet31.0/36_job_titles.sql;
```

The scripts are intended for a fresh database. To reload from scratch, drop and recreate `ai_employment`; the O*NET scripts include `CREATE TABLE` statements and are not designed to run twice against existing tables.

## Data Model

The core schema models:

- `Industry` and `Company`: industries contain companies.
- `Occupation`: associates each occupation with an industry and stores its SOC code and project AI-exposure score.
- `Worker`: associates a worker and salary with a company and occupation.
- `Skill`: stores project skills and their AI-complementarity ratings by occupation.
- `AI_Technology` and `Company_AI_Technology`: represent AI technologies and each company's adoption status and date.
- O*NET `job_titles` and `software_skills`: imported occupation reference data. Their supplied SQL files create and load these tables.

## O*NET Integration

The O*NET tables replace the project's original occupation-title and software-skill tables. Unlike the project's internal relationships, which use `occupation_id`, O*NET identifies occupations with standardized `onetsoc_code` values. The O*NET tables retain their supplied structure, and the project `Occupation` table stores this code so its records can join to O*NET without assigning internal IDs to the external records.

`Occupation.onetsoc_code` is the join key to `job_titles.onetsoc_code` and `software_skills.onetsoc_code`. These are one-to-many relationships: an occupation may have multiple alternate titles and multiple software-skill records. The advanced query examples demonstrate both joins.

## Query Guide

`Queries/BasicQueries.sql` contains examples for inspecting industries and companies, joining companies and occupations to their industries, listing adopted technologies, and filtering occupations by AI-exposure score or workers by salary. Its salary threshold is above 100,000; the current mock salaries are all below that amount, so that query returns no rows unless the data or threshold changes.

`Queries/AdvancedQueries.sql` demonstrates average salary and worker counts by occupation, average exposure by industry, company technology adoption details, counts of hot technologies and in-demand skills, and joins from project occupations to O*NET job titles and software skills. In O*NET's `software_skills` table, `hot_technology` and `in_demand` use `Y`/`N` values. It also contains additional SELECT examples with authors identified. 


## O*NET Source and Attribution

The project uses O*NET database version 31.0, stored in the `onet31.0` folder. Publisher, license, trademark notice, source links, table descriptions, and row counts are recorded in`data/onet31.0/Sources.txt`


## Reflection and Future Work

### Project Reflection
Throughout this project, our relational database evolved with the combination of real-world dataset benchmarks: 

1. **Integration of O*NET Data:** We incorporated official O*NET 31.0 tables. Mapping customs occupations to standardised values allowed for real-world skills evaluation that worked with the 3NF structure.
2. Our design assumes that AI impacts labor markets through task-level transformation and skill augmentation instead of immediate job elimination.

### Limitations
- **Static Data Snapshot:** The database does not represent dynamic tracking of real-time labor changes.
- **Qualitative Metrics:** While numerical values quantify task exposure scores and salary levels, worker attributes (eg. leadership, team dynamics) stay outside the scope.

### Next Steps & Future Work
1. **Interactive Visualization Layer:** Connect SQL query outputs to a visual dashboard tool to display AI exposure metrics in interactive graphs for non-technical stakeholders.
2. **Live Data API Ingestion:** Replace static SQL data imports with live API pipelines (e.g., job portal feeds or live O*NET Web Services) to update skill demand and salary metrics continuously.