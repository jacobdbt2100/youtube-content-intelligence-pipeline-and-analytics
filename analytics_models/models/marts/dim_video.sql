-- =============================================================================
-- dim_video.sql
-- Dimension: video information
-- Grain: one row per video (video_id)
-- =============================================================================

SELECT
    video_id,
    channel_id,
    category_id,
    title,
    published_at,
    duration_minutes,
    video_url,
    collected_at

FROM {{ ref('stg_videos') }}
