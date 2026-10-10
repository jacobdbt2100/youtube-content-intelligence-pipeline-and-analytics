-- =============================================================================
-- fct_creator_daily_performance.sql
-- Fact: daily creator subscriber growth metrics
-- Grain: one row per creator per collection date
-- =============================================================================

WITH creator_stats AS (
    -- Compare each snapshot with the previous collection date.
    SELECT
        channel_id,
        collection_date,
        subscriber_count,
        LAG(subscriber_count) OVER (
            PARTITION BY channel_id
            ORDER BY collection_date
        ) AS previous_subscribers
    FROM {{ ref('stg_creator_daily_stats') }}
),

daily_growth AS (
    SELECT
        channel_id,
        collection_date,
        subscriber_count,
        previous_subscribers,
        subscriber_count - previous_subscribers AS subscriber_growth,
        ROUND(
            (subscriber_count - previous_subscribers)
                / NULLIF(previous_subscribers, 0) * 100,
            2
        ) AS subscriber_growth_rate
    FROM creator_stats
)

SELECT
    channel_id,
    collection_date,
    subscriber_count,
    previous_subscribers,
    subscriber_growth,
    subscriber_growth_rate
FROM daily_growth
