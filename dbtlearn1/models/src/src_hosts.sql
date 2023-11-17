WITH 
raw_hosts AS (
--SELECT * FROM airbnb.raw.raw_hosts
SELECT * FROM {{ source('airbnb', 'hosts') }}
)
--- rename the raw column names
SELECT 
id AS host_id,
name AS host_name,
is_superhost,
created_at,
updated_at
from 
raw_hosts
