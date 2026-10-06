-- =============================================================================
-- fct_video_performance.sql
-- Fact: daily video performance and engagement metrics
-- Grain: one row per video per collection date
-- =============================================================================

WITH video_stats AS (

    SELECT
        video_id,
        collection_date,
        view_count,
        like_count,
        comment_count,
        ROUND(like_count / NULLIF(view_count, 0) * 100, 4) AS like_rate,
        ROUND(comment_count / NULLIF(view_count, 0) * 100, 4) AS comment_rate,
        ROUND(
            (like_count + comment_count) / NULLIF(view_count, 0) * 100,
            4
        ) AS engagement_rate

    FROM {{ ref('stg_video_daily_stats') }}

),

video_attributes AS (

    SELECT
        video_id,
        channel_id,
        category_id

    FROM {{ ref('stg_videos') }}

)

SELECT
    stats.video_id,
    attributes.channel_id,
    attributes.category_id,
    stats.collection_date,
    stats.view_count,
    stats.like_count,
    stats.comment_count,
    stats.like_rate,
    stats.comment_rate,
    stats.engagement_rate

FROM video_stats AS stats

INNER JOIN video_attributes AS attributes
    ON stats.video_id = attributes.video_id
