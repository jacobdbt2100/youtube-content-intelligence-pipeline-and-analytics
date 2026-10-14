
    
    

select
    category_id as unique_field,
    count(*) as n_records

from `youtube_content_intelligence`.`staging`.`stg_video_category`
where category_id is not null
group by category_id
having count(*) > 1


