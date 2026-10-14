
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select category_id
from `youtube_content_intelligence`.`marts`.`fct_video_performance`
where category_id is null



  
  
      
    ) dbt_internal_test