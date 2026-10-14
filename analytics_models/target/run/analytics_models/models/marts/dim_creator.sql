
  
    
        create or replace table `youtube_content_intelligence`.`marts`.`dim_creator`
      
      
    using delta
  
      
      
      
      
      
      
      
      
      as
      -- =============================================================================
-- dim_creator.sql
-- Dimension: creator information
-- Grain: one row per creator (channel_id)
-- =============================================================================

SELECT
    channel_id,
    channel_name

FROM `youtube_content_intelligence`.`staging`.`stg_creators`
  