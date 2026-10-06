-- =============================================================================
-- fct_content_early_velocity.sql
-- Fact: early-life content performance milestones
-- Grain: one row per video (video_id)
--
-- Project assumption:
-- All tracked videos began observation on the same collection date.
-- Day 1 is therefore defined as the first collection date in the dataset,
-- with Day 3 and Day 7 calculated relative to that date.
--
-- Production approach:
-- For automatically discovered content, milestone periods should be based on
-- the content's published_at timestamp and actual elapsed time.
--
-- The current approach is intentionally simplified for this learning project
-- because historical snapshots were not available before tracking began.
-- =============================================================================

WITH daily_stats AS (

    SELECT
        video_id,
        collection_date,
        view_count
    FROM {{ ref('stg_video_daily_stats') }}

),

tracking_start AS (

    SELECT
        MIN(collection_date) AS first_collection_date
    FROM daily_stats

),

content_milestones AS (

    SELECT
        stats.video_id,
        stats.view_count,
        DATEDIFF(
            stats.collection_date,
            tracking.first_collection_date
        ) + 1 AS tracking_day

    FROM daily_stats AS stats

    CROSS JOIN tracking_start AS tracking

)

SELECT
    video_id,
    MAX(
        CASE
            WHEN tracking_day = 1
            THEN view_count
        END
    ) AS one_day_views,
    MAX(
        CASE
            WHEN tracking_day = 3
            THEN view_count
        END
    ) AS three_day_views,
    MAX(
        CASE
            WHEN tracking_day = 7
            THEN view_count
        END
    ) AS seven_day_views,
    ROUND(
        MAX(
            CASE
                WHEN tracking_day = 7
                THEN view_count
            END
        ) / 7,
        2
    ) AS seven_day_early_view_velocity

FROM content_milestones

GROUP BY video_id
