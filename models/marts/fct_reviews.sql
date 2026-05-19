WITH reviews AS (
    SELECT * FROM {{ ref('stg_elearning__reviews') }}
),

students AS (
    SELECT
        student_id,
        full_name AS student_name,
        country
    FROM {{ ref('stg_elearning__students') }}
),

courses AS (
    SELECT
        course_id,
        title AS course_title,
        category,
        instructor_id
    FROM {{ ref('stg_elearning__courses') }}
),

instructors AS (
    SELECT
        instructor_id,
        name AS instructor_name
    FROM {{ ref('stg_elearning__instructors') }}
)

SELECT
    r.review_id,
    r.enrollment_id,
    r.student_id,
    r.course_id,
    s.student_name,
    s.country,
    c.course_title,
    c.category,
    c.instructor_id,
    i.instructor_name,
    r.rating,
    {{ categorize_rating('r.rating') }} AS rating_category,
    r.title,
    r.body,
    r.sentiment,
    r.helpful_votes,
    r.verified_purchase,
    r.review_date,
    EXTRACT(MONTH FROM r.review_date) AS review_month,
    EXTRACT(YEAR FROM r.review_date) AS review_year
FROM reviews r
LEFT JOIN students s ON r.student_id = s.student_id
LEFT JOIN courses c ON r.course_id = c.course_id
LEFT JOIN instructors i ON c.instructor_id = i.instructor_id