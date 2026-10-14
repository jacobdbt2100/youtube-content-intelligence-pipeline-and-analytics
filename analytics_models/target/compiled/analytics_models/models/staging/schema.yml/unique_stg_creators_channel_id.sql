
    
    

select
    channel_id as unique_field,
    count(*) as n_records

from `youtube_content_intelligence`.`staging`.`stg_creators`
where channel_id is not null
group by channel_id
having count(*) > 1


