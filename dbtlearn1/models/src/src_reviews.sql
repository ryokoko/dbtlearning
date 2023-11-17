WITH 
raw_reviews AS (
--SELECT * FROM airbnb.raw.raw_reviews
SELECT * FROM {{ source('airbnb', 'reviews') }}
)
--- rename the raw column names
SELECT 
listing_id,
date AS review_date,
reviewer_name,
comments AS review_text,
sentiment AS review_sentiment
from 
raw_reviews