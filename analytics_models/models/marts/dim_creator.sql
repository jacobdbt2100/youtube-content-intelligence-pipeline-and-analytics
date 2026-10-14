-- =============================================================================
-- dim_creator.sql
-- Dimension: creator information
-- Grain: one row per creator (channel_id)
-- =============================================================================

SELECT
    channel_id,
    channel_name

FROM {{ ref('stg_creators') }}
