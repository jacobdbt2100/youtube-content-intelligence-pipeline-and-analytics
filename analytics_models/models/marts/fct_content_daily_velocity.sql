-- =============================================================================
-- fct_content_daily_velocity.sql
-- Fact: daily video performance velocity
-- Grain: one row per video per collection date
-- =============================================================================

WITH daily_stats AS (

    SELECT
        video_id,
        collection_date,
        view_count,
        like_count,
        comment_count,
        LAG(view_count) OVER (
            PARTITION BY video_id
            ORDER BY collection_date
        ) AS previous_view_count,
        LAG(like_count) OVER (
            PARTITION BY video_id
            ORDER BY collection_date
        ) AS previous_like_count,
        LAG(comment_count) OVER (
            PARTITION BY video_id
            ORDER BY collection_date
        ) AS previous_comment_count

    FROM {{ ref('stg_video_daily_stats') }}

)

SELECT
    video_id,
    collection_date,
    view_count - previous_view_count AS views_gained_per_day,
    like_count - previous_like_count AS likes_gained_per_day,
    comment_count - previous_comment_count AS comments_gained_per_day

FROM daily_stats
