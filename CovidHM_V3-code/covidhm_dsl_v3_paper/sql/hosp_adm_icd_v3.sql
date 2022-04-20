WITH sq AS (
SELECT
	patient_id,
	REPLACE(dia_ppal, '.', '') AS dia_ppal
FROM
	covidhm_dsl_v3.diagnosis_hosp_adm ),
destin_discharge AS	(
SELECT
	patient_id,
		-- We are translating discharge destinations
	CASE WHEN destin_discharge = 'Domicilio' 	THEN 'Home'
	    WHEN destin_discharge = 'Fallecimiento'	THEN 'Expired'
	    WHEN destin_discharge = 'Traslado al Hospital'	THEN 'Transfer to Hospital'
	    WHEN destin_discharge = 'Traslado a un Centro Sociosanitario' THEN 'Transfer to a Social Health Centre'
	    WHEN destin_discharge = 'Alta Voluntaria' THEN 'Voluntary discharge'
	ELSE NUll
	END AS destin_discharge,
	admission_date_emerg
FROM
	covidhm_dsl_v3.patient
)
SELECT
    patient_id
	, abbrev_desc
	, destin_discharge
FROM
	sq
JOIN 
  covidhm_dsl_v3.icd10_codes_dict 
ON
	dia_ppal = full_code
JOIN
  destin_discharge
USING
  (patient_id)
