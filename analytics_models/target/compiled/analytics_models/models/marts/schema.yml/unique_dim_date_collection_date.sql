
    
    

select
    collection_date as unique_field,
    count(*) as n_records

from `youtube_content_intelligence`.`marts`.`dim_date`
where collection_date is not null
group by collection_date
having count(*) > 1


