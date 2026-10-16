# YouTube Content Intelligence Pipeline & Analytics

## Overview

An end-to-end data pipeline that collects YouTube creator statistics, video metadata, and daily performance data across tracked channels and their published content, processes the data in Databricks, transforms it with dbt, and presents insights in Power BI.

## Architecture

YouTube Data API → Python → JSON → Databricks Auto Loader → Bronze → PySpark → Silver → dbt → Power BI

## Tech Stack

- **Python** – Data extraction
- **YouTube Data API** – Source data
- **Databricks** – Data platform and orchestration
- **Auto Loader** – Incremental file ingestion
- **PySpark** – Data processing and standardisation
- **Delta Lake** – Data storage
- **dbt Core** – SQL transformations and data testing
- **Lakeflow Jobs** – Pipeline scheduling and task dependencies
- **Power BI** – Analytics and visualisation
- **Git & GitHub** – Version control

## Data Pipeline

1. **Extraction:** Collects creator statistics, video metadata, categories, and daily video statistics through the YouTube Data API.
2. **Bronze:** Loads raw JSON data into Delta tables using Auto Loader.
3. **Silver:** Processes and standardises the ingested data using PySpark.
4. **Analytics:** Uses dbt to build staging models, dimensions, and fact tables.
5. **Orchestration:** Runs Bronze, Silver, and dbt tasks in dependency order through Lakeflow Jobs.
6. **Visualisation:** Dashboards in Power B&#x49;**.**

The pipeline is scheduled to run daily at **9:00 AM**.

## Orchestration

The Lakeflow Job, `youtube_content_intelligence_daily`, coordinates the pipeline:

- Creator statistics: Bronze → Silver
- Video statistics: Bronze → Silver
- dbt transformations run after both Silver tasks succeed.

[lakeflow job structure](https://github.com/jacobdbt2100/youtube-content-intelligence-pipeline-and-analytics/blob/main/lakeflow_job_structure.md)

## Data Models

The dbt project contains staging models, dimensions, and fact tables for:

- Video performance and engagement
- Daily content velocity
- Early video performance
- Content freshness and post-peak performance
- Creator growth and publishing performance

[dbt models](https://github.com/jacobdbt2100/youtube-content-intelligence-pipeline-and-analytics/tree/main/analytics_models/models)

## Analytics

Power BI reports explore:

- Video performance
- Engagement trends
- Content freshness
- Early view velocity
- Creator growth; and
- Publishing patterns.

[youtube content intelligence dashboards](https://github.com/jacobdbt2100/youtube-content-intelligence-pipeline-and-analytics/blob/main/visualisation/youtube%20content%20intelligence%20dashboards.pbix)

## Repository Structure

See [repo structure.md](https://github.com/jacobdbt2100/youtube-content-intelligence-pipeline-and-analytics/blob/main/repo_structure.md) for the project directory layout.

## Setup

1. Clone the repository.
2. Create and activate a Python virtual environment.
3. Install dependencies from `requirements.txt`.
4. Configure the YouTube Data API key in `.env`.
5. Configure Databricks access and the dbt profile.
6. Run the extraction pipeline using the project's entry point.

**Note:** Keep API keys, access tokens, and other credentials out of version control.

## Future Improvements

These improvements would make the pipeline more efficient, reliable, and maintainable:

- Implement incremental Silver processing using Delta Lake `MERGE` operations (upserts).
- Implement incremental dbt models to process only new or changed records.
- Add automated data quality checks and pipeline failure monitoring.
- Introduce CI/CD with GitHub Actions for automated testing and deployment.
