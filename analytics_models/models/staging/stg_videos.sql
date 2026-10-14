-- =============================================================================
-- stg_videos.sql
-- Staging layer: standardises video records
-- Grain: one row per video (video_id)
-- =============================================================================

SELECT
    CAST(video_id AS STRING) AS video_id,
    CAST(channel_id AS STRING) AS channel_id,
    CAST(category_id AS INT) AS category_id,
    CAST(title AS STRING) AS title,
    CAST(published_at AS TIMESTAMP) AS published_at,
    CAST(duration_minutes AS DOUBLE) AS duration_minutes,
    CAST(video_url AS STRING) AS video_url,
    CAST(collected_at AS TIMESTAMP) AS collected_at

FROM {{ source('youtube_silver', 'slv_videos') }}
