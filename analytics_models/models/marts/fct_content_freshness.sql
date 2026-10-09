-- =============================================================================
-- fct_content_freshness.sql
-- Fact: content freshness and post-peak performance
-- Grain: one row per video (video_id)
-- =============================================================================

WITH daily_velocity AS (

    SELECT
        video_id,
        collection_date,
        views_gained_per_day

    FROM {{ ref('fct_content_daily_velocity') }}

),

tracking_start AS (

    SELECT
        MIN(collection_date) AS first_collection_date

    FROM daily_velocity

),

tracking_days AS (

    SELECT
        velocity.video_id,
        velocity.collection_date,
        DATEDIFF(
            velocity.collection_date,
            tracking.first_collection_date
        ) + 1 AS tracking_day,
        velocity.views_gained_per_day

    FROM daily_velocity AS velocity

    CROSS JOIN tracking_start AS tracking

),

peak_ranked AS (

    SELECT
        video_id,
        tracking_day,
        views_gained_per_day,
        ROW_NUMBER() OVER (
            PARTITION BY video_id
            ORDER BY views_gained_per_day DESC, tracking_day DESC
        ) AS peak_rank

    FROM tracking_days

),

peak AS (

    SELECT
        video_id,
        tracking_day AS peak_tracking_day,
        views_gained_per_day AS peak_view_velocity

    FROM peak_ranked

    WHERE peak_rank = 1

),

velocity_summary AS (

    SELECT
        days.video_id,
        peak.peak_tracking_day,
        peak.peak_view_velocity,
        AVG(
            CASE
                WHEN days.tracking_day < peak.peak_tracking_day
                THEN days.views_gained_per_day
            END
        ) AS pre_peak_view_velocity,
        AVG(
            CASE
                WHEN days.tracking_day > peak.peak_tracking_day
                THEN days.views_gained_per_day
            END
        ) AS post_peak_view_velocity

    FROM tracking_days AS days

    INNER JOIN peak
        ON days.video_id = peak.video_id

    GROUP BY
        days.video_id,
        peak.peak_tracking_day,
        peak.peak_view_velocity

)

SELECT
    video_id,
    peak_view_velocity,
    peak_tracking_day - 1 AS time_to_peak,
    ROUND(pre_peak_view_velocity, 2) AS pre_peak_view_velocity,
    ROUND(post_peak_view_velocity, 2) AS post_peak_view_velocity,
    ROUND(
        post_peak_view_velocity - pre_peak_view_velocity,
        2
    ) AS velocity_change_after_peak

FROM velocity_summary
