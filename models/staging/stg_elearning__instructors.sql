WITH source AS (
    SELECT * FROM {{ source('raw', 'raw_instructors') }}
),

renamed AS (
    SELECT
        instructor_id,
        TRIM(name) AS name,
        expertise,
        CAST(rating AS DECIMAL(10,2)) AS rating,
        CAST(total_courses AS INT) AS total_courses,
        CAST(joined_date AS DATE) AS joined_date
    FROM source
)

SELECT * FROM renamed