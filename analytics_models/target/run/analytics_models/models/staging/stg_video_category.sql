
  
  
  
  create or replace view `youtube_content_intelligence`.`staging`.`stg_video_category`
  
  as (
    -- =============================================================================
-- stg_video_category.sql
-- Staging layer: standardises video category records
-- Grain: one row per category (category_id)
-- =============================================================================

SELECT
    CAST(category_id AS INT) AS category_id,
    CAST(category AS STRING) AS category

FROM `youtube_content_intelligence`.`silver`.`slv_video_category`
  )
