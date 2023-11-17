-- For incremental materialization
{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
  )
}}
-- on_schema_change: what will happen if the schema is changed when code is deployed
WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
SELECT 
-- generte sk using dbt-utils
{{ dbt_utils.generate_surrogate_key([
  'listing_id', 'review_date', 'reviewer_name', 'review_text'
]) }} as review_id,
* FROM src_reviews
WHERE review_text IS NOT NULL
{% if is_incremental() %}
    AND review_date > (select max(review_date) from {{ this }})
{% endif %}