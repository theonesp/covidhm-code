-- -------------------------------------------------------------------------------
--
-- Load data into the covidhm_dsl_v3 schema from psql client
--
-- -------------------------------------------------------------------------------

--------------------------------------------------------
--  File created - 05/04/2021
--------------------------------------------------------

-- Change to the directory containing the data files
--\cd :covidhm_data_dir

--------------------------------------------------------
--  Load Data for Table patient
--------------------------------------------------------
\encoding latin1
\copy covidhm_dsl_v3.patient(age, sex, patient_id, admission_d_inpat, discharge_date, destin_discharge, diag_inpat, admission_date_emerg, 
			  time_admission_emerg, diag_emerg, department_emerg, time_constant_first_emerg, bp_max_first_emerg, bp_min_first_emerg, 
			  temp_first_emerg, hr_first_emerg, sat_02_first_emerg, glu_first_emerg, diuresis_first_emerg, time_constant_last_emerg,
			  bp_max_last_emerg, bp_min_last_emerg, temp_last_emerg, hr_last_emerg, sat_02_last_emerg, glu_last_emerg, destin_emerg, 
			  idcdsl, ant_admission_date_in, ant_diag_inpat, mechvent, icu_date_in, icu_date_out, icu_days, icu_n_ing) FROM 'C:/Users/Jesus/Desktop/Master/TFM/Datos/19_04_2021/COVID_DSL_01.CSV' DELIMITER '|' CSV HEADER 

--\copy covidhm_dsl_v3.patient(age, sex, patient_id, admission_d_inpat, discharge_date, destin_discharge, diag_inpat, admission_date_emerg, 
			  -- time_admission_emerg, diag_emerg, department_emerg, time_constant_first_emerg, bp_max_first_emerg, bp_min_first_emerg, 
			  -- temp_first_emerg, hr_first_emerg, sat_02_first_emerg, glu_first_emerg, diuresis_first_emerg, time_constant_last_emerg,
			  -- bp_max_last_emerg, bp_min_last_emerg, temp_last_emerg, hr_last_emerg, sat_02_last_emerg, glu_last_emerg, destin_emerg, 
			  -- idcdsl, ant_admission_date_in, ant_diag_inpat, mechvent, icu_date_in, icu_date_out, icu_days, icu_n_ing) FROM 'C:/Users/Jesus/Desktop/Master/TFM/Datos/20_07_2020/CDSL_01_PRUEBA.csv' DELIMITER '|' CSV HEADER 		  

--------------------------------------------------------
--  Load Data for Table medication
--------------------------------------------------------
\encoding latin1
\copy covidhm_dsl_v3.medication(patient_id, drug_comercial_name, id_atc5, atc5_name, id_atc7, atc7_name, daily_avrg_dose,
				drug_start_date, drug_end_date) FROM 'C:/Users/Jesus/Desktop/Master/TFM/Datos/19_04_2021/COVID_DSL_04.csv' DELIMITER '|' CSV HEADER

--\copy covidhm_dsl_v3.medication(patient_id, drug_comercial_name, id_atc5, atc5_name, id_atc7, atc7_name, daily_avrg_dose,
				-- drug_start_date, drug_end_date) FROM 'C:/Users/Jesus/Desktop/Master/TFM/Datos/20_07_2020/CDSL_02.csv' DELIMITER '|' CSV HEADER
				
--------------------------------------------------------
--  Load Data for Table vital_sign
--------------------------------------------------------
\encoding latin1
\copy covidhm_dsl_v3.vital_signs(patient_id, constants_ing_date, constants_ing_time, bp_max_ing, bp_min_ing, temp_ing,
				 hr_ing, sat_02_ing, sat_02_ing_obs, glu_ing) FROM 'C:/Users/Jesus/Desktop/Master/TFM/Datos/19_04_2021/COVID_DSL_02.csv' DELIMITER '|' CSV HEADER
--\copy covidhm_dsl_v3.vital_signs(patient_id, constants_ing_date, constants_ing_time, bp_max_ing, bp_min_ing, temp_ing,
				-- hr_ing, sat_02_ing, sat_02_ing_obs, glu_ing) FROM 'C:/Users/Jesus/Desktop/Master/TFM/Datos/20_07_2020/CDSL_03_prueba.csv' DELIMITER '|' CSV HEADER

--------------------------------------------------------
--  Load Data for Table laboratory
--------------------------------------------------------
-- Removed all lines exceeding fields number
\encoding latin1--\encoding utf-8
\copy covidhm_dsl_v3.laboratory(patient_id, lab_number, lab_date, time_lab, item_lab, val_result, ud_result, ref_values) 
				FROM 'C:/Users/Jesus/Desktop/Master/TFM/Datos/19_04_2021/COVID_DSL_06_v2.CSV' DELIMITER ';' CSV HEADER
--\copy covidhm_dsl_v3.laboratory(patient_id, lab_number, lab_date, time_lab, item_lab, val_result, ud_result, ref_values) 
				--FROM 'C:/Users/Jesus/Desktop/Master/TFM/Datos/20_07_2020/CDSL_04.csv' DELIMITER ',' CSV HEADER	
				
--------------------------------------------------------
--  Load Data for Table diagnosis_er_adm
--------------------------------------------------------
\encoding utf-8
\copy covidhm_dsl_v3.diagnosis_er_adm(patient_id, dia_ppal, dia_02, dia_03, dia_04, dia_05, dia_06, dia_07, dia_08, dia_09, dia_10, dia_11,
					   dia_12, proc_01, proc_02, proc_03, proc_04, proc_05) FROM 'C:\Users\Jesus\Desktop\Master\TFM\Datos\19_04_2021\COVID_DSL_03.csv' DELIMITER '|' CSV HEADER

--\copy covidhm_dsl_v3.diagnosis_er_adm(patient_id, dia_ppal, dia_02, dia_03, dia_04, dia_05, dia_06, dia_07, dia_08, dia_09, dia_10, dia_11,
					   --dia_12, proc_01, proc_02, proc_03, proc_04, proc_05) FROM 'C:\Users\Jesus\Desktop\Master\TFM\Datos\20_07_2020\CDSL_05.csv' DELIMITER '|' CSV HEADER

--------------------------------------------------------
--  Load Data for Table diagnosis_hosp_adm
--------------------------------------------------------
\encoding utf-8
\copy covidhm_dsl_v3.diagnosis_hosp_adm(dia_ppal, poad_ppal, dia_02, poad_02, dia_03, poad_03, dia_04, poad_04, dia_05, poad_05,
						 dia_06, poad_06, dia_07, poad_07, dia_08, poad_08, dia_09, poad_09, dia_10, poad_10, 
						 dia_11, poad_11, dia_12, poad_12, dia_13, poad_13, dia_14, poad_14, dia_15, poad_15,
						 dia_16, poad_16, dia_17, poad_17, dia_18, poad_18, dia_19, poad_19, proc_01, proc_02,
						 proc_03, proc_04, proc_05, proc_06, proc_07, proc_08, proc_09, proc_10, proc_11, proc_12,
						 proc_13, proc_14, proc_15, proc_16, proc_17, proc_18, proc_19, proc_20, neo_01, neo_02, 
						 neo_03, neo_04, neo_05, neo_06,	patient_id) FROM 'C:\Users\Jesus\Desktop\Master\TFM\Datos\19_04_2021\COVID_DSL_05.csv' DELIMITER '|' CSV HEADER
--\copy covidhm_dsl_v3.diagnosis_hosp_adm(dia_ppal, poad_ppal, dia_02, poad_02, dia_03, poad_03, dia_04, poad_04, dia_05, poad_05,
						 --dia_06, poad_06, dia_07, poad_07, dia_08, poad_08, dia_09, poad_09, dia_10, poad_10, 
						 --dia_11, poad_11, dia_12, poad_12, dia_13, poad_13, dia_14, poad_14, dia_15, poad_15,
						 --dia_16, poad_16, dia_17, poad_17, dia_18, poad_18, dia_19, poad_19, proc_01, proc_02,
						 --proc_03, proc_04, proc_05, proc_06, proc_07, proc_08, proc_09, proc_10, proc_11, proc_12,
						 --proc_13, proc_14, proc_15, proc_16, proc_17, proc_18, proc_19, proc_20, neo_01, neo_02, 
						 --neo_03, neo_04, neo_05, neo_06,	patient_id) FROM 'C:\Users\Jesus\Desktop\Master\TFM\Datos\20_07_2020\CDSL_06.csv' DELIMITER '|' CSV HEADER

--------------------------------------------------------
--  Load Data for Table icd10_codes_dict
--------------------------------------------------------
\encoding latin1					 
\copy covidhm_dsl_v3.icd10_codes_dict(order_number, full_code, codeheader, abbrev_desc, full_desc) from 'C:\Users\Jesus\Desktop\Master\TFM\Datos\icd10cm_order_2021.txt' DELIMITER '|' CSV HEADER