
    
    

select
    video_id as unique_field,
    count(*) as n_records

from `youtube_content_intelligence`.`marts`.`fct_content_early_velocity`
where video_id is not null
group by video_id
having count(*) > 1


