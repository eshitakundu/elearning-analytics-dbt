WITH payments AS (
    SELECT * FROM {{ ref('stg_elearning__payments') }}
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
        level,
        price AS listed_price
    FROM {{ ref('stg_elearning__courses') }}
)

SELECT
    p.payment_id,
    p.student_id,
    p.course_id,
    p.enrollment_id,
    s.student_name,
    s.country,
    s.subscription_type,
    c.course_title,
    c.category,
    c.listed_price,
    p.amount AS paid_amount,
    ROUND(((c.listed_price - p.amount) / c.listed_price) * 100, 2) AS discount_pct,
    CASE
        WHEN p.amount < 20 THEN 'Low'
        WHEN p.amount < 50 THEN 'Medium'
        ELSE 'High'
    END AS amount_tier,
    p.payment_date,
    p.payment_method,
    p.status,
    EXTRACT(MONTH FROM p.payment_date) AS payment_month,
    EXTRACT(YEAR FROM p.payment_date) AS payment_year
FROM payments p
LEFT JOIN students s ON p.student_id = s.student_id
LEFT JOIN courses c ON p.course_id = c.course_id