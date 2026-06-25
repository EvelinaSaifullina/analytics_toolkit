-- Когортный анализ удержания (retention)
-- На основе таблицы user_cohorts и активности пользователей

WITH user_activity AS (
    SELECT 
        e.user_id,
        c.cohort_date,
        DATE(e.event_timestamp) AS event_date,
        JULIANDAY(DATE(e.event_timestamp)) - JULIANDAY(c.cohort_date) AS day_number
    FROM events e
    JOIN user_cohorts c ON e.user_id = c.user_id
    WHERE e.event_type = 'purchase'  -- или любое действие
),
cohort_stats AS (
    SELECT 
        cohort_date,
        day_number,
        COUNT(DISTINCT user_id) AS active_users
    FROM user_activity
    GROUP BY cohort_date, day_number
),
cohort_size AS (
    SELECT 
        cohort_date,
        active_users AS total_users
    FROM cohort_stats
    WHERE day_number = 0
)
SELECT 
    cs.cohort_date,
    cs.day_number,
    cs.active_users,
    ROUND(100.0 * cs.active_users / csize.total_users, 2) AS retention_rate
FROM cohort_stats cs
JOIN cohort_size csize ON cs.cohort_date = csize.cohort_date
ORDER BY cs.cohort_date, cs.day_number;