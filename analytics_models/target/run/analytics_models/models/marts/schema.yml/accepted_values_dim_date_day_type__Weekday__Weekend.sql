
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        day_type as value_field,
        count(*) as n_records

    from `youtube_content_intelligence`.`marts`.`dim_date`
    group by day_type

)

select *
from all_values
where value_field not in (
    'Weekday','Weekend'
)



  
  
      
    ) dbt_internal_test