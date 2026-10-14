
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select collection_date
from `youtube_content_intelligence`.`staging`.`stg_creator_daily_stats`
where collection_date is null



  
  
      
    ) dbt_internal_test