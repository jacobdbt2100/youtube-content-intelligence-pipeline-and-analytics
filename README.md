### Data engineering layer

```text
Python
  ↓
API extraction
  ↓
Raw files
  ↓
Bronze
  ↓
PySpark
  ↓
Silver
```

### Analytics engineering / analytical modeling layer

```text
Silver
  ↓
dbt + SQL
  ↓
stg models
  ↓
int models
  ↓
Gold marts
```



# YouTube Content Intelligence Pipeline & Analytics

## Overview

An end-to-end data pipeline that collects YouTube channel and video data, processes it in Databricks, transforms it with dbt, and delivers insights through Power BI.

The project focuses on video performance, content freshness, early view velocity, and creator publishing performance.

## Architecture

YouTube Data API → Python → JSON → Databricks Auto Loader → Bronze → Silver → dbt → Power BI

## Tech Stack

- **Python:** API extraction and data preparation
- **YouTube Data API:** Source data
- **Databricks:** Data ingestion, processing, storage, and orchestration
- **Delta Lake:** Bronze and Silver tables
- **dbt Core:** SQL transformations, data modelling, and testing
- **Lakeflow Jobs:** Pipeline scheduling and task dependencies
- **Power BI:** Analytics and visualisation
- **Git & GitHub:** Version control and source management

## Data Pipeline

1. **Extraction:** Collects creator statistics, video metadata, categories, and daily video statistics through the YouTube Data API.
2. **Bronze:** Loads raw JSON data into Delta tables using Auto Loader.
3. **Silver:** Processes and standardises the ingested data using PySpark.
4. **Analytics:** Uses dbt to build staging models, dimensions, and fact tables.
5. **Orchestration:** Runs Bronze, Silver, and dbt tasks in dependency order through Lakeflow Jobs.

The pipeline is scheduled to run daily at **9:00 AM**.

## Data Models

The dbt project contains staging models, dimension tables, and fact tables covering:

- Video performance and engagement
- Daily view, like, and comment velocity
- Early video performance
- Content freshness and post-peak performance
- Creator growth and publishing performance

## Analytics

Power BI reports explore:

- Video performance and engagement trends
- Early view velocity and content freshness
- Performance changes over a video's tracking period
- Creator growth and publishing patterns

## Repository Structure

```text
youtube-content-intelligence-pipeline-and-analytics/
├── extraction/
├── transformation/
├── analytics_models/
│   ├── models/
│   │   ├── staging/
│   │   └── marts/
│   ├── macros/
│   └── dbt_project.yml
├── main.py
├── requirements.txt
├── .gitignore
└── README.md
```

*Update this structure to reflect the final repository contents.*

## Setup

1. Clone the repository.
2. Create and activate a Python virtual environment.
3. Install dependencies from `requirements.txt`.
4. Configure the YouTube Data API key in `.env`.
5. Configure Databricks access and the dbt profile.
6. Run the extraction pipeline using the project's entry point.

**Note:** Keep API keys, access tokens, and other credentials out of version control.

## Configuration

- **Databricks catalog:** `youtube_content_intelligence`
- **dbt project directory:** `analytics_models`
- **Schedule:** Daily at 9:00 AM
- **Tracked creators:** [Add final list or reference]

## Dashboard

[Add Power BI screenshots or dashboard link.]

## Future Improvements

[Add only planned improvements that remain relevant to the project.]






