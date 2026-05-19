SELECT *
FROM {{ ref('stg_elearning__reviews') }}
WHERE rating < 1 OR rating > 5