
    
    

with child as (
    select video_id as from_field
    from `youtube_content_intelligence`.`marts`.`fct_content_early_velocity`
    where video_id is not null
),

parent as (
    select video_id as to_field
    from `youtube_content_intelligence`.`marts`.`dim_video`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


