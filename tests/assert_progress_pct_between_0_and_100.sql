SELECT *
FROM {{ ref('stg_elearning__enrollments') }}
WHERE progress_pct < 0 OR progress_pct > 100