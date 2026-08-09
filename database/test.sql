SELECT
    u.full_name,
    COUNT(b.id) AS completed_count
FROM users u
LEFT JOIN bookings b
    ON b.client_user_id = u.id
   AND b.status = 'completed'
WHERE u.user_type = 'client'
GROUP BY u.id, u.full_name;