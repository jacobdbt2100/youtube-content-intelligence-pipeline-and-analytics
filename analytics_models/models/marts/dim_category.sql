-- =============================================================================
-- dim_category.sql
-- Dimension: video category information
-- Grain: one row per category (category_id)
-- =============================================================================

SELECT
    category_id,
    category

FROM {{ ref('stg_video_category') }}
