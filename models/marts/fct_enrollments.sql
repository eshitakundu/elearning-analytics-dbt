WITH enrollments AS (
    SELECT * FROM {{ ref('stg_elearning__enrollments') }}
),

students AS (
    SELECT
        student_id,
        full_name AS student_name,
        country,
        subscription_type
    FROM {{ ref('stg_elearning__students') }}
),

courses AS (
    SELECT
        course_id,
        title AS course_title,
        category,
        level
    FROM {{ ref('stg_elearning__courses') }}
)

SELECT
    e.enrollment_id,
    e.student_id,
    e.course_id,
    s.student_name,
    s.country,
    s.subscription_type,
    c.course_title,
    c.category,
    c.level,
    e.enrolled_date,
    e.completion_status,
    e.completion_date,
    e.progress_pct,
    e.rating,
    CASE
        WHEN e.completion_status = 'Completed' THEN TRUE
        ELSE FALSE
    END AS is_completed,
    CASE
        WHEN e.completion_date IS NOT NULL
        THEN DATEDIFF('day', e.enrolled_date, e.completion_date)
        ELSE NULL
    END AS days_to_complete
FROM enrollments e
LEFT JOIN students s ON e.student_id = s.student_id
LEFT JOIN courses c ON e.course_id = c.course_id