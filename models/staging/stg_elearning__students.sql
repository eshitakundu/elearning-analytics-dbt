 WITH source AS (
    SELECT * FROM {{ source('raw', 'raw_students') }}
),

renamed AS (
    SELECT
        student_id,
        first_name,
        last_name,
        first_name || ' ' || last_name AS full_name,
        email,
        CAST(age AS INT) AS age,
        country,
        subscription_type,
        CAST(signup_date AS DATE) AS signup_date
    FROM source
)

SELECT * FROM renamed