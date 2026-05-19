WITH instructors AS (
    SELECT * FROM {{ ref('stg_elearning__instructors') }}
)

SELECT
    instructor_id,
    name,
    expertise,
    rating,
    CASE
        WHEN rating >= 4.5 THEN 'Top Rated'
        WHEN rating >= 3.5 THEN 'Highly Rated'
        ELSE 'Standard'
    END AS rating_tier,
    total_courses,
    joined_date,
    CASE
        WHEN DATEDIFF('year', joined_date, CURRENT_DATE) >= 5 THEN 'Senior'
        WHEN DATEDIFF('year', joined_date, CURRENT_DATE) >= 2 THEN 'Mid'
        ELSE 'Junior'
    END AS experience_level
FROM instructors