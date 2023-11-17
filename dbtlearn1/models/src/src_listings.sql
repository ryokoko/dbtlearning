--- a dbt model ---
WITH 
raw_listings AS (
  /* use sources.yml to refer the table name directly
  from the yml file in which all the names are variables 
  so flexibility is provided. */
--SELECT * FROM airbnb.raw.raw_listings
SELECT * FROM {{ source('airbnb', 'listings') }}
)
--- rename the raw column names
SELECT 
id AS listing_id,
name AS listing_name,
listing_url,
room_type,
minimum_nights,
host_id,
price AS price_str,
created_at,
updated_at
FROM 
raw_listings



