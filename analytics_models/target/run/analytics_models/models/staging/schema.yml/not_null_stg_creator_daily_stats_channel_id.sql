
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select channel_id
from `youtube_content_intelligence`.`staging`.`stg_creator_daily_stats`
where channel_id is null



  
  
      
    ) dbt_internal_test