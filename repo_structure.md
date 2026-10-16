# Repository Structure

```text
youtube-content-intelligence-pipeline-and-analytics/
│
├── notebooks/
│   ├── 00_setup_infrastructure.ipynb
│   │
│   ├── bronze/
│   │   ├── creator_daily_stats.ipynb
│   │   ├── creators.ipynb
│   │   ├── video_category.ipynb
│   │   ├── video_daily_stats.ipynb
│   │   └── videos.ipynb
│   │
│   └── silver/
│       ├── creator_daily_stats.ipynb
│       ├── creators.ipynb
│       ├── video_category.ipynb
│       ├── video_daily_stats.ipynb
│       └── videos.ipynb
│
├── src/
│   ├── youtube_client.py
│   │
│   └── extraction/
│       ├── creator_daily_stats.py
│       ├── creators.py
│       ├── video_category.py
│       ├── video_daily_stats.py
│       └── videos.py
│
├── analytics_models/
│   ├── models/
│   │   ├── staging/
│   │   └── marts/
│   │
│   ├── macros/
│   ├── seeds/
│   ├── snapshots/
│   ├── tests/
│   └── dbt_project.yml
│
├── README.md
├── lakeflow_job_structure.md
├── metrics.md
├── repo_structure.md
└── requirements.txt
```

**Notes:**
- `notebooks/`: Databricks Bronze and Silver processing notebooks.
- `src/`: Python API client and extraction modules.
- `analytics_models/`: dbt staging models, marts, dimensions, facts, and macros.
- `requirements.txt`: Python dependencies.
