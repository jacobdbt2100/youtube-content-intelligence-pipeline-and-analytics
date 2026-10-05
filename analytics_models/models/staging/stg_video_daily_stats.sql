-- =============================================================================
-- stg_video_daily_stats.sql
-- Staging layer: standardises daily video statistics
-- Grain: one row per video per collection date
-- =============================================================================

SELECT
    CAST(video_id AS STRING) AS video_id,
    CAST(collection_date AS DATE) AS collection_date,
    CAST(view_count AS BIGINT) AS view_count,
    CAST(like_count AS BIGINT) AS like_count,
    CAST(comment_count AS BIGINT) AS comment_count,
    CAST(ingested_at AS TIMESTAMP) AS ingested_at

FROM {{ source('youtube_silver', 'slv_video_daily_stats') }}
