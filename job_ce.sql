USE hlb;

SELECT DISTINCT soc_title, continued_employment AS ce, COUNT(visa_id) AS total_cases
FROM visa
LEFT JOIN soc_code USING (soc_id)
LEFT JOIN worksite USING (worksite_id)
WHERE soc_title LIKE "%data%"
AND continued_employment > 1
GROUP BY soc_title, ce
ORDER BY total_cases DESC;