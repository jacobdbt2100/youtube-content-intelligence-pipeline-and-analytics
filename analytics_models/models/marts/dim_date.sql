-- =============================================================================
-- dim_date.sql
-- Mart layer: calendar dimension for complete date-based analysis.
--
-- Grain: one row per calendar date
--
-- Generates every date between the earliest and latest collection dates,
-- including dates with no collected data.
-- =============================================================================

WITH date_range AS (

    -- Establish the boundaries of the available collection period
    SELECT
        MIN(collection_date) AS min_date,
        MAX(collection_date) AS max_date

    FROM {{ ref('stg_creator_daily_stats') }}

),

dates AS (

    -- Generate a continuous date range between the boundaries
    SELECT
        EXPLODE(
            SEQUENCE(
                min_date,
                max_date,
                INTERVAL 1 DAY
            )
        ) AS collection_date

    FROM date_range

),

date_attributes AS (

    -- Derive calendar attributes for analysis
    SELECT
        collection_date,
        YEAR(collection_date) AS year,
        QUARTER(collection_date) AS quarter,
        MONTH(collection_date) AS month,
        DATE_FORMAT(collection_date, 'MMMM') AS month_name,
        DAY(collection_date) AS day,
        DAYOFWEEK(collection_date) AS day_of_week,
        DATE_FORMAT(collection_date, 'EEEE') AS day_name,
        CASE
            WHEN DAYOFWEEK(collection_date) IN (1, 7) THEN 'Weekend'
            ELSE 'Weekday'
        END AS day_type,
        WEEKOFYEAR(collection_date) AS week_of_year

    FROM dates

)

SELECT
    collection_date,
    year,
    quarter,
    month,
    month_name,
    day,
    day_of_week,
    day_name,
    day_type,
    week_of_year

FROM date_attributes

ORDER BY collection_date
