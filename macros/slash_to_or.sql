{% macro slash_to_or(column_name) %}
    replace({{ column_name }}, '/', ' or ')
{% endmacro %}




