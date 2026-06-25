-- Подготовка данных для A/B-теста: таблица с сессией, группой и флагом покупки

CREATE TABLE ab_test_data AS
WITH session_first_group AS (
    SELECT 
        session_id,
        experiment_group,
        ROW_NUMBER() OVER (PARTITION BY session_id ORDER BY timestamp) AS rn
    FROM events
    WHERE campaign_id = 1
      AND experiment_group IN ('Control', 'Variant_A')
      AND device_type IS NOT NULL
      AND device_type != ''
),
session_purchase AS (
    SELECT 
        session_id,
        MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS has_purchase
    FROM events
    WHERE campaign_id = 1
    GROUP BY session_id
)
SELECT 
    f.experiment_group,
    COUNT(DISTINCT f.session_id) AS total_sessions,
    SUM(p.has_purchase) AS sessions_with_purchase,
    ROUND(100.0 * SUM(p.has_purchase) / COUNT(DISTINCT f.session_id), 2) AS conversion_rate
FROM session_first_group f
LEFT JOIN session_purchase p ON f.session_id = p.session_id
WHERE f.rn = 1
GROUP BY f.experiment_group;