SELECT id_vital_sign, patient_id, constants_ing_date, constants_ing_time, bp_max_ing, bp_min_ing, temp_ing, hr_ing, sat_02_ing, sat_02_ing_obs, glu_ing
	FROM covidhm_dsl_v3.vital_signs
	WHERE
	patient_id = 495
	ORDER BY
	constants_ing_date,
	constants_ing_time ;