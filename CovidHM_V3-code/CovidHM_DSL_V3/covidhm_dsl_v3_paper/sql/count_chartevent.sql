SELECT avg(chartevent.count_chartevent) as avg_count_chartevent
FROM(
	SELECT patient_id, COUNT(id_vital_sign) as count_chartevent
		FROM covidhm_dsl_v3.vital_signs
		GROUP BY patient_id)
as chartevent;