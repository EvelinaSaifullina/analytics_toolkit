WITH session_events AS (
    SELECT 
        session_id,
        MAX(CASE WHEN event_type = 'product_view' THEN 1 ELSE 0 END) AS has_view,
        MAX(CASE WHEN event_type = 'add_to_cart' THEN 1 ELSE 0 END) AS has_cart,
        MAX(CASE WHEN event_type = 'checkout' THEN 1 ELSE 0 END) AS has_checkout,
        MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS has_purchase
    FROM events_clean
    WHERE event_date BETWEEN '2024-05-01' AND '2024-05-31'
    GROUP BY session_id
)
SELECT 
    COUNT(session_id) AS total_sessions,
    SUM(has_view) AS view_sessions,
    SUM(has_cart) AS cart_sessions,
    SUM(has_checkout) AS checkout_sessions,
    SUM(has_purchase) AS purchase_sessions,
    ROUND(100.0 * SUM(has_purchase) / COUNT(session_id), 2) AS overall_conversion,
    ROUND(100.0 * SUM(has_purchase) / SUM(has_view), 2) AS view_to_purchase_conversion,
    ROUND(100.0 * SUM(has_purchase) / SUM(has_cart), 2) AS cart_to_purchase_conversion
FROM session_events;
