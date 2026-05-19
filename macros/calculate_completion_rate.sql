{% macro calculate_completion_rate(completed_column, total_column) %}
    ROUND(
        CASE 
            WHEN {{ total_column }} = 0 THEN 0
            ELSE ({{ completed_column }}::FLOAT / {{ total_column }}) * 100
        END, 2
    )
{% endmacro %}