
    
    

with child as (
    select collection_date as from_field
    from `youtube_content_intelligence`.`marts`.`fct_video_performance`
    where collection_date is not null
),

parent as (
    select collection_date as to_field
    from `youtube_content_intelligence`.`marts`.`dim_date`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


