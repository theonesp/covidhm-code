-- query extracting the data from the patients table

SELECT
	patient_id,
	age,
	sex,
	diag_inpat,
	admission_d_inpat,
	icu_date_in,
	icu_date_out,
	icu_days,
	CASE WHEN mechvent ='SI' THEN 1
	ELSE 0
	END AS mechvent,
	discharge_date,
		-- We are describing and translating Top 4 ER Diagnoses, the rest will be marked as 'Others' 
	CASE WHEN destin_discharge = 'Fallecimiento' THEN 1
	ELSE 0
	END AS destin_discharge,
	admission_date_emerg,
	time_admission_emerg,
	CASE WHEN department_emerg = 'Medicina de Urgencias' 	THEN 'Emergency Medicine'
	    WHEN department_emerg = 'Medicina Interna'	THEN 'Internal Medicine'
	    WHEN department_emerg = 'Medicina General'	THEN 'General Medicine'
	    WHEN department_emerg LIKE 'Traumatolog%' THEN 'Trauma'
	    WHEN department_emerg LIKE 'Pediatr%' THEN 'Pediatrics'
	    WHEN department_emerg = 'Medicina Intensiva' THEN 'Intensive Care Medicine'
	    WHEN department_emerg LIKE 'Ginecolog%' THEN 'Gynecology'
	    WHEN department_emerg LIKE 'Cardiolog%' THEN 'Cardiology'	    
	ELSE NULL
	END AS department_emerg,
	-- We are describing and translating Top 4 ER Diagnoses, the rest will be marked as 'Others' 
	--CASE WHEN diag_emerg = 'DIFICULTAD RESPIRATORIA' 	THEN 'Respiratory distress'
	--    WHEN diag_emerg = 'FIEBRE'	THEN 'Fever'
	--    WHEN diag_emerg = 'CUADRO CATARRAL'	THEN 'Catarrh symptoms'
	--    WHEN diag_emerg = 'TOS' THEN 'Cough'
	--ELSE 'Others'
	--END AS diag_emerg,
	diag_emerg,
	destin_emerg,
	time_constant_first_emerg,
	temp_first_emerg,
	hr_first_emerg,
	glu_first_emerg,
	sat_02_first_emerg,
	bp_max_first_emerg,
	bp_min_first_emerg,
	time_constant_last_emerg,
	hr_last_emerg,
	temp_last_emerg,
	glu_last_emerg,
	sat_02_last_emerg,
	bp_max_last_emerg,
	bp_min_last_emerg
FROM
	covidhm_dsl_v3.patient;
