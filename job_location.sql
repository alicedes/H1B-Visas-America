USE hlb;

SELECT DISTINCT state, COUNT(visa_id) AS total_cases
FROM visa
LEFT JOIN soc_code USING (soc_id)
LEFT JOIN naics USING (naics_id)
LEFT JOIN worksite USING (worksite_id)
WHERE soc_title LIKE "%data%"
AND (industry = 'Custom Computer Programming Services' OR industry = 'Internet Publishing and Broadcasting and Web Search Portals' OR industry = 'Computing Infrastructure Providers, Data Processing, Web Hosting, and Related Services')
GROUP BY state
ORDER BY total_cases DESC;