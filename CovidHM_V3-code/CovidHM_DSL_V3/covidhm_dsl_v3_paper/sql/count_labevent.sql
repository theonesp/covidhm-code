SELECT avg(labevent.count_labevent) as avg_count_labevent
FROM(
	SELECT patient_id, COUNT(id_laboratory) as count_labevent
		FROM covidhm_dsl_v3.laboratory
		GROUP BY patient_id)
as labevent; 