SELECT avg(medicationevent.count_medicationevent) as medicationevent
FROM(
	SELECT patient_id, COUNT(id_medication) as count_medicationevent
		FROM covidhm_dsl_v3.medication
		GROUP BY patient_id)
as medicationevent; 