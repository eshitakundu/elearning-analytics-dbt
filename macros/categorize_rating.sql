{% macro categorize_rating(rating_column) %}
    CASE
        WHEN {{rating_column}} >= 4.5 THEN 'Excellent'
        WHEN {{rating_column}} >= 3.5 THEN 'Good'
        WHEN {{rating_column}} >= 2.5 THEN 'Average'
        ELSE 'Poor'
    END
{% endmacro %}