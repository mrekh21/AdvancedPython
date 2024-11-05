### Welcome to my first dbt project!

This project aims to transform sales data from multiple sources 
into data marts using dbt. The source data is provided as Parquet
files, and dbt is used to create models for raw data, 
staging transformations, and final data marts for analysis.


### Project Structure

The dbt project has the following directory structure:

- **models/raw:** Contains raw models that load the data from the Parquet files.
- **models/staging:** Contains staging models that perform intermediate transformations.
- **models/dm:** Contains data mart models, which are the final transformations for business needs.
- **models/sources.yml:** Defines the sources (Parquet files).
- **models\data:** contains all parquet files.
- **tests:** Contains YAML files that define tests for dbt models.
- **analyses:** Contains analysis queries to derive insights from data marts.


### Using the project

Try running the following commands:
- dbt run
- dbt test

