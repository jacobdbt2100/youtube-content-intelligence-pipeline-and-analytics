-- =============================================================================
-- fct_creator_publishing_performance.sql
-- Fact: creator-level publishing and channel performance metrics
-- Grain: one row per creator (channel_id)
-- =============================================================================

WITH publication_intervals AS (
    -- Calculate the gap between consecutive publications.
    SELECT
        channel_id,
        published_at,
        LAG(published_at) OVER (
            PARTITION BY channel_id
            ORDER BY published_at
        ) AS previous_published_at
    FROM {{ ref('stg_videos') }}
),

average_publication_interval AS (
    SELECT
        channel_id,
        ROUND(
            AVG(DATEDIFF(published_at, previous_published_at)),
            2
        ) AS average_days_between_publications
    FROM publication_intervals
    GROUP BY channel_id
),

latest_video_stats AS (
    -- Select the latest snapshot for each tracked video.
    SELECT
        video_id,
        view_count,
        ROW_NUMBER() OVER (
            PARTITION BY video_id
            ORDER BY collection_date DESC
        ) AS snapshot_rank
    FROM {{ ref('stg_video_daily_stats') }}
),

average_tracked_video_views AS (
    SELECT
        v.channel_id,
        ROUND(AVG(s.view_count), 2) AS average_views_per_tracked_video
    FROM {{ ref('stg_videos') }} AS v
    INNER JOIN latest_video_stats AS s
        ON v.video_id = s.video_id
    WHERE s.snapshot_rank = 1
    GROUP BY v.channel_id
),

latest_creator_stats AS (
    -- Select the latest snapshot for each creator.
    SELECT
        channel_id,
        subscriber_count,
        total_view_count,
        video_count,
        ROW_NUMBER() OVER (
            PARTITION BY channel_id
            ORDER BY collection_date DESC
        ) AS snapshot_rank
    FROM {{ ref('stg_creator_daily_stats') }}
)

SELECT
    c.channel_id,
    c.channel_name,
    s.subscriber_count,
    s.total_view_count,
    s.video_count,
    ROUND(
        s.total_view_count / NULLIF(s.video_count, 0),
        2
    ) AS average_views_per_video,
    p.average_days_between_publications,
    t.average_views_per_tracked_video
FROM {{ ref('stg_creators') }} AS c
LEFT JOIN latest_creator_stats AS s
    ON c.channel_id = s.channel_id
    AND s.snapshot_rank = 1
LEFT JOIN average_publication_interval AS p
    ON c.channel_id = p.channel_id
LEFT JOIN average_tracked_video_views AS t
    ON c.channel_id = t.channel_id
