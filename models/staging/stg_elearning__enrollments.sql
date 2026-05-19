WITH source AS(
    SELECT * FROM {{source('raw', 'raw_enrollments')}}
),

renamed AS(
    SELECT
        enrollment_id,
        student_id,
        course_id,
        CAST(enrolled_date AS date) AS enrolled_date,
        completion_status,
        CAST(completion_date AS date) AS completion_date,
        CAST(progress_pct AS INT) AS progress_pct,
        CAST(rating AS FLOAT) AS rating
    FROM source
)

SELECT * FROM renamed