SELECT (cast(in_hospital_mort.mortality_events as decimal) / in_hospital_mort.unique_patient)*100 as avg_mortality
FROM(
	SELECT COUNT(patient_id) FILTER (WHERE destin_discharge = 'Fallecimiento') as mortality_events,
			COUNT(DISTINCT patient_id) as unique_patient
			FROM covidhm_dsl_v3.patient)
as in_hospital_mort;