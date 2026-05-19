WITH courses AS (
    SELECT * FROM {{ ref('stg_elearning__courses') }}
)

SELECT
    course_id,
    title,
    category,
    instructor_id,
    price,
    CASE
        WHEN price < 20 THEN 'Budget'
        WHEN price < 50 THEN 'Mid'
        ELSE 'Premium'
    END AS price_tier,
    duration_hours,
    CASE
        WHEN duration_hours < 10 THEN 'Short'
        WHEN duration_hours < 25 THEN 'Medium'
        ELSE 'Long'
    END AS course_length,
    level,
    created_date,
    rating,
    total_enrollments
FROM courses