# Repository Structure

```text
youtube-content-intelligence-pipeline-and-analytics/
├── notebooks/
│   │
│   ├── bronze/
│   │   ├── creator_daily_stats
│   │   ├── creators
│   │   ├── video_category
│   │   ├── video_daily_stats
│   │   └── videos
│   │
│   └── silver/
│       ├── creator_daily_stats
│       ├── creators
│       ├── video_category
│       ├── video_daily_stats
│       └── videos
│
├── src/
│   ├── youtube_client.py
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
│   │
│   ├── dbt_project.yml
│   └── [other retained dbt files]
│ 
├── requirements.txt
├── README.md
└── repo_structure.md
```

**Notes:**
- `notebooks/`: Databricks Bronze and Silver processing notebooks.
- `src/`: Python API client and extraction modules.
- `analytics_models/`: dbt staging models, dimensions, facts, and macros.
- `transformation/`: Local testing files, if retained in the repository.
- `requirements.txt`: Python dependencies.
