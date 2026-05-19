SELECT *
FROM {{ ref('stg_elearning__enrollments') }}
WHERE completion_date IS NOT NULL
AND completion_date < enrolled_date