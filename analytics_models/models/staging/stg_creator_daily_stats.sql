-- =============================================================================
-- stg_creator_daily_stats.sql
-- Staging layer: standardises daily creator statistics
-- Grain: one row per creator per collection date
-- =============================================================================

SELECT
    CAST(channel_id AS STRING) AS channel_id,
    CAST(collection_date AS DATE) AS collection_date,
    CAST(subscriber_count AS BIGINT) AS subscriber_count,
    CAST(total_view_count AS BIGINT) AS total_view_count,
    CAST(video_count AS BIGINT) AS video_count,
    CAST(ingested_at AS TIMESTAMP) AS ingested_at

FROM {{ source('youtube_silver', 'slv_creator_daily_stats') }}
