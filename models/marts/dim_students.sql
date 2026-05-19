WITH students AS (
    SELECT * FROM {{ ref('stg_elearning__students') }}
)

SELECT
    student_id,
    first_name,
    last_name,
    full_name,
    email,
    age,
    CASE
        WHEN age < 25 THEN 'Gen Z'
        WHEN age < 35 THEN 'Millennial'
        WHEN age < 50 THEN 'Gen X'
        ELSE 'Boomer'
    END AS age_group,
    country,
    subscription_type,
    signup_date
FROM students