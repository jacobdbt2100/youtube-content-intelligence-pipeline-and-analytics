
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select video_id
from `youtube_content_intelligence`.`staging`.`stg_video_daily_stats`
where video_id is null



  
  
      
    ) dbt_internal_test