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
├── jobs_structure.md
├── repo_structure.md
├── README.md
└── requirements.txt
```

**Notes:**
- `notebooks/`: Databricks Bronze and Silver processing notebooks.
- `src/`: Python API client and extraction modules.
- `analytics_models/`: dbt staging models, dimensions, facts, and macros.
- `transformation/`: Local testing files, if retained in the repository.
- `requirements.txt`: Python dependencies.
