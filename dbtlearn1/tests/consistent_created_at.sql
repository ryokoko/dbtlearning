WITH fct_reviews as (
SELECT 
* FROM
{{ ref('fct_reviews') }}
)
,dim_listings_cleansed as (
  SELECT * 
  FROM {{ ref('dim_listings_cleansed') }}
)
select fct.* , dim.* from fct_reviews fct
inner join dim_listings_cleansed dim
--USING (listing_id)
on dim.listing_id = fct.listing_id
where dim.created_at >= fct.review_date