-- =============================================================================
-- fct_content_freshness_daily.sql
-- Fact: daily content freshness metrics
-- Grain: one row per video per collection date
-- =============================================================================

WITH daily_stats AS (

    SELECT
        video_id,
        collection_date,
        view_count,
        like_count,
        comment_count

    FROM {{ ref('stg_video_daily_stats') }}

),

tracking_start AS (

    SELECT
        MIN(collection_date) AS first_collection_date

    FROM daily_stats

)

SELECT
    stats.video_id,
    stats.collection_date,
    DATEDIFF(
        stats.collection_date,
        tracking.first_collection_date
    ) AS content_age,
    stats.view_count AS views_over_content_age,
    stats.like_count + stats.comment_count AS engagement_over_content_age

FROM daily_stats AS stats

CROSS JOIN tracking_start AS tracking
