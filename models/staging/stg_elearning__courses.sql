WITH source AS(
    SELECT * FROM {{source('raw', 'raw_courses')}}
),

renamed AS(
    SELECT 
        course_id,
        TRIM(title) AS title,
        category,
        instructor_id,
        CAST(price AS DECIMAL(10,2)) AS price,
        CAST(duration_hours AS INT) AS duration_hours,
        level,
        CAST(created_date AS DATE) AS created_date,
        CAST(rating AS FLOAT) AS rating,
        CAST(total_enrollments AS INT) as total_enrollments
    FROM source
)

SELECT * FROM renamed