
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select channel_id
from `youtube_content_intelligence`.`marts`.`dim_creator`
where channel_id is null



  
  
      
    ) dbt_internal_test