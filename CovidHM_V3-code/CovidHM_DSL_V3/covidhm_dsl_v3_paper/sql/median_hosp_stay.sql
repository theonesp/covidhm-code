SELECT avg(hosp_stay.duration) as avg_hosp_stay_duration
FROM(
	SELECT date_part('day', discharge_date - admission_d_inpat) as duration
	FROM covidhm_dsl_v3.patient)
as hosp_stay;
