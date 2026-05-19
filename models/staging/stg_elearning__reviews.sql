WITH source AS (
    SELECT * FROM {{ source('raw', 'raw_reviews') }}
),

renamed AS (
    SELECT
        review_id,
        enrollment_id,
        student_id,
        course_id,
        CAST(rating AS DECIMAL(10,2)) AS rating,
        TRIM(title) AS title,
        TRIM(body) AS body,
        sentiment,
        CAST(helpful_votes AS INT) AS helpful_votes,
        verified_purchase,
        CAST(review_date AS DATE) AS review_date
    FROM source
)

SELECT * FROM renamed