
    
    

select
    video_id as unique_field,
    count(*) as n_records

from `youtube_content_intelligence`.`staging`.`stg_videos`
where video_id is not null
group by video_id
having count(*) > 1


