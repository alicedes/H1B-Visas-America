USE hlb;

SELECT DISTINCT soc_title, COUNT(visa_id) AS cases
FROM soc_code
LEFT JOIN visa USING (soc_id)
WHERE soc_title LIKE "%data%"
GROUP BY soc_title
ORDER BY cases DESC;

