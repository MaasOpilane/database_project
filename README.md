# Impact of AI on Employment

This project uses a MySQL relational database to explore how AI adoption and occupational characteristics can be viewed across industries, companies, workers, and occupations. It combines illustrative project data with occupation reference data from O*NET 31.0.

The salaries, AI adoption records, skills, and AI exposure scores in `data/MockData.sql` are mock values for the project; they are not official O*NET measurements or evidence of a causal effect of AI on employment. The O*NET files provide occupation titles and software-skill information that can be matched to project occupations by SOC code.

## Repository Layout

```text
schema/                 Core project table definitions
data/                   Mock records and versioned O*NET source data
	onet31.0/              O*NET 31.0 SQL files and source note
queries/                Basic and advanced example queries
docs/                   Assignment briefs and entity-relationship diagram
README.md               Setup, data, and query guide
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
3. `data/onet31.0/23_software_skills.sql` creates and loads the O*NET `software_skills` table.
4. `data/onet31.0/36_job_titles.sql` creates and loads the O*NET `job_titles` table.
5. Run either query file after both data sources have loaded.

For example, when using the interactive MySQL client from the repository root:

```sql
SOURCE schema/Schema.sql;
SOURCE data/MockData.sql;
SOURCE data/onet31.0/23_software_skills.sql;
SOURCE data/onet31.0/36_job_titles.sql;
```

The scripts are intended for a fresh database. To reload from scratch, drop and recreate `ai_employment` before repeating the steps; the O*NET scripts include `CREATE TABLE` statements and are not designed to be run twice against already-created tables.

## Data Model

The core schema models:

- `Industry` and `Company`: industries contain companies.
- `Occupation`: associates each occupation with an industry and stores its SOC code and project AI-exposure score.
- `Worker`: associates a worker and salary with a company and occupation.
- `Skill`: stores project skills and their AI-complementarity ratings by occupation.
- `AI_Technology` and `Company_AI_Technology`: represent AI technologies and each company's adoption status and date.
- O*NET `job_titles` and `software_skills`: imported occupation reference data. These tables are created by their supplied O*NET SQL files, not by the core schema.

`Occupation.onetsoc_code` is the join key to `job_titles.onetsoc_code` and `software_skills.onetsoc_code`. This SOC code connects a project's occupation to O*NET's occupation records; one occupation can have many alternate titles and many software-skill records. The advanced queries demonstrate both joins.

## Query Guide

`queries/BasicQueries.sql` contains short examples for inspecting `Industry` and `Company`, listing companies and occupations with their industry, and listing companies with their adopted AI technologies. It also demonstrates filtering occupations by AI-exposure score and workers by salary. The salary example uses a threshold above 100,000; the current mock salaries are all below that threshold, so that query returns no rows unless the data or threshold changes.

`queries/AdvancedQueries.sql` demonstrates:

- Average salary and worker count by occupation.
- Average AI-exposure score by industry.
- AI technologies adopted by each company, including adoption date and status.
- Counts of hot technologies by occupation and counts of occupations listing each in-demand software skill.
- Two one-to-many joins from project occupations to O*NET: alternate job titles and software-skill examples, matched using `onetsoc_code`.

In O*NET's `software_skills` table, `hot_technology` and `in_demand` use `Y`/`N` values. The advanced query filters hot technologies using `Y`.

## O*NET Source and Attribution

The project uses O*NET database version 31.0. Source URLs, publisher, license, download-date status, table descriptions, and row counts are recorded in [`data/onet31.0/Sources.txt`](data/onet31.0/Sources.txt).
