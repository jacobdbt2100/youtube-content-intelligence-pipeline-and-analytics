# Lakeflow Job Structure

**Job:** `youtube_content_intelligence_daily`

```text
youtube_content_intelligence_daily
│
├── creator_daily_stats_bronze
│   └── creator_daily_stats_silver ─────┐
│                                       │
└── video_daily_stats_bronze             ├──→ dbt_transformations_youtube_content_intelligence
    └── video_daily_stats_silver ───────┘
```

**Execution order**
- `creator_daily_stats_bronze` → `creator_daily_stats_silver`
- `video_daily_stats_bronze` → `video_daily_stats_silver`
- `dbt_transformations_youtube_content_intelligence` runs after both Silver tasks succeed.

**Schedule:** Daily at 9:00 AM.
