-- =============================================================================
-- stg_creators.sql
-- Staging layer: standardises creator records from the Silver layer
-- Grain: one row per creator (channel_id)
-- =============================================================================

SELECT
    CAST(channel_id AS STRING) AS channel_id,
    CAST(channel_name AS STRING) AS channel_name

FROM `youtube_content_intelligence`.`silver`.`slv_creators`