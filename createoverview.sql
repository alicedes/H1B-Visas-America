USE hlb;

CREATE VIEW overview AS
SELECT state, city, avg(decision_date - received_date) AS avg_process_duration, industry, soc_title AS job, continued_employment
FROM visa
LEFT JOIN naics USING (naics_id)
LEFT JOIN soc_code USING (soc_id)
LEFT JOIN worksite USING (worksite_id)
GROUP BY state, city, industry, job, continued_employment;


