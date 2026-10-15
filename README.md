# YouTube Content Intelligence Pipeline & Analytics

## Overview

An end-to-end data pipeline that collects YouTube data, processes it in Databricks, transforms it with dbt, and presents insights in Power BI.

## Architecture

YouTube Data API → Python → JSON → Databricks Auto Loader → Bronze → Silver → dbt → Power BI

## Tech Stack

- **Python** – Data extraction
- **YouTube Data API** – Source data
- **Databricks** – Data platform and orchestration
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

[View pipeline task configuration](LINK_TO_JOB_OR_TASK_DIAGRAM)

## Data Models

The dbt project contains staging models, dimensions, and fact tables for:

- Video performance and engagement
- Daily content velocity
- Early video performance
- Content freshness and post-peak performance
- Creator growth and publishing performance

[View dbt models](LINK_TO_DBT_MODELS)

## Analytics

Power BI reports explore:

- Video performance
- Engagement trends
- Content freshness
- Early view velocity
- Creator growth; and
- Publishing patterns.

[View dashboard](LINK_TO_POWER_BI_DASHBOARD_OR_SCREENSHOTS)

## Repository Structure

See [repo_structure.md](LINK_TO_REPO_STRUCTURE_MD) for the project directory layout.

## Setup

1. Clone the repository.
2. Create and activate a Python virtual environment.
3. Install dependencies from `requirements.txt`.
4. Configure the YouTube Data API key in `.env`.
5. Configure Databricks access and the dbt profile.
6. Run the extraction pipeline using the project's entry point.

**Note:** Keep API keys, access tokens, and other credentials out of version control.

## Future Improvements

[Add only planned improvements that remain relevant to the project.]








