-- =============================================================================
-- stg_video_category.sql
-- Staging layer: standardises video category records
-- Grain: one row per category (category_id)
-- =============================================================================

SELECT
    CAST(category_id AS INT) AS category_id,
    CAST(category AS STRING) AS category

FROM {{ source('youtube_silver', 'slv_video_category') }}
