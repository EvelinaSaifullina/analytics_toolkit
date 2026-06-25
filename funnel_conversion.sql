-- Воронка конверсии по этапам (на уровне сессий или пользователей)
-- Адаптируй под свои названия таблиц и этапы

WITH stage_counts AS (
    SELECT 
        COUNT(DISTINCT CASE WHEN event_type = 'view' THEN session_id END) AS step1_view,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN session_id END) AS step2_cart,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN session_id END) AS step3_purchase
    FROM events
    WHERE campaign_id = 1  -- фильтр по эксперименту
)
SELECT 
    step1_view AS start,
    step2_cart AS cart,
    step3_purchase AS purchase,
    ROUND(100.0 * step2_cart / step1_view, 2) AS view_to_cart_pct,
    ROUND(100.0 * step3_purchase / step2_cart, 2) AS cart_to_purchase_pct,
    ROUND(100.0 * step3_purchase / step1_view, 2) AS view_to_purchase_pct
FROM stage_counts;