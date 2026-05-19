WITH source AS (
    SELECT * FROM {{ source('raw', 'raw_payments') }}
),

renamed AS (
    SELECT
        payment_id,
        student_id,
        course_id,
        enrollment_id,
        CAST(amount AS DECIMAL(10,2)) AS amount,
        CAST(payment_date AS DATE) AS payment_date,
        payment_method,
        status
    FROM source
)

SELECT * FROM renamed