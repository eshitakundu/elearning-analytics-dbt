SELECT *
FROM {{ ref('stg_elearning__courses') }}
WHERE price <= 0