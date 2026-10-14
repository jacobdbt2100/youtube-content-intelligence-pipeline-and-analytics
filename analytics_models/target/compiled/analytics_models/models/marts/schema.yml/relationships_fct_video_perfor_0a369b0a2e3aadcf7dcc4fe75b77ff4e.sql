
    
    

with child as (
    select category_id as from_field
    from `youtube_content_intelligence`.`marts`.`fct_video_performance`
    where category_id is not null
),

parent as (
    select category_id as to_field
    from `youtube_content_intelligence`.`marts`.`dim_category`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


