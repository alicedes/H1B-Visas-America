USE hlb;

SELECT DISTINCT soc_title, industry, COUNT(visa_id) AS total_cases
FROM visa
LEFT JOIN soc_code USING (soc_id)
LEFT JOIN naics USING (naics_id)
WHERE soc_title LIKE "%data%"
GROUP BY soc_title, industry
ORDER BY total_cases DESC;