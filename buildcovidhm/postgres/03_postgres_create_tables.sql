-- -------------------------------------------------------------------------------
--
-- Create covidhm tables
--
-- -------------------------------------------------------------------------------

--------------------------------------------------------
--  File created - 04/29/2020
--------------------------------------------------------

-- If running scripts individually, you can set the schema where all tables are created as follows:
-- SET search_path TO covidhm_24_04_2020; -- or your schema name

--------------------------------------------------------
--  DDL for Table patient
--------------------------------------------------------


-- Drop table

-- DROP TABLE patient;

CREATE TABLE patient (
	patient_id varchar NULL,
	edad_age varchar NULL,
	sexo_sex varchar NULL,
	diag_ing_inpat varchar NULL,
	f_ingreso_admission_d_ing_inpat varchar NULL,
	f_entrada_uc_icu_date_in varchar NULL,
	f_salida_uci_icu_date_out varchar NULL,
	uci_dias_icu_days varchar NULL,
	f_alta_discharge_date_ing varchar NULL,
	motivo_alta_destiny_discharge_ing varchar NULL,
	f_ingreso_admission_date_urg_emerg varchar NULL,
	hora_time_admision_admission_urg_emerg varchar NULL,
	especialidad_department_urg_emerg varchar NULL,
	diag_urg_emerg varchar NULL,
	destino_destiny_urg_emerg varchar NULL,
	hora_time_constant_primera_first_urg_emerg varchar NULL,
	temp_primera_first_urg_emerg varchar NULL,
	fc_hr_primera_first_urg_emerg varchar NULL,
	glu_primera_first_urg_emerg varchar NULL,
	sat_02_primera_first_urg_emerg varchar NULL,
	ta_max_primera_first_emerg_urg varchar NULL,
	ta_min_primera_first_urg_emerg varchar NULL,
	hora_time_constant_ultima_last_urg_emerg varchar NULL,
	fc_hr_ultima_last_urg_emerg varchar NULL,
	temp_ultima_last_urg_emerg varchar NULL,
	glu_ultima_last_urg_emerg varchar NULL,
	sat_02_ultima_last_urg_emerg varchar NULL,
	ta_max_ultima_last_urgemerg varchar NULL,
	ta_min_ultima_last_urg_emerg varchar NULL
);

--------------------------------------------------------
--  DDL for Table medication
--------------------------------------------------------


-- Drop table

-- DROP TABLE medication;

CREATE TABLE medication (
	patient_id varchar NULL,
	farmaco_drug_nombre_comercial_comercial_name varchar NULL,
	dosis_media_diaria_daily_avrg_dose varchar NULL,
	inicio_trat_drug_start_date varchar NULL,
	fin_trat_drug_end_date varchar NULL,
	atc5_nombre_name varchar NULL,
	id_atc5 varchar NULL,
	atc7_nombre_name varchar NULL,
	id_atc7 varchar NULL
);

--------------------------------------------------------
--  DDL for Table vital_sign
--------------------------------------------------------


-- Drop table

-- DROP TABLE vital_sign;

CREATE TABLE vital_sign (
	patient_id varchar NULL,
	constants_ing_inpat_fecha_date varchar NULL,
	constants_ing_inpat_hora_time varchar NULL,
	fc_hr_ing_inpat varchar NULL,
	glu_gly_ing_inpat varchar NULL,
	sat_02_ing_inpat varchar NULL,
	ta_max_ing_inpat varchar NULL,
	ta_min_ing_inpat varchar NULL,
	temp_ing_inpat varchar NULL
);


--------------------------------------------------------
--  DDL for Table laboratory
--------------------------------------------------------


-- Drop table

-- DROP TABLE laboratory;

CREATE TABLE laboratory (
	patient_id varchar NULL,
	peticion_laboratorio_lab_number varchar NULL,
	fecha_peticion_lab_date varchar NULL,
	hora_peticion_time_lab varchar NULL,
	determinacion_item_lab varchar NULL,
	resultado_val_result varchar NULL,
	unidades_ud_result varchar NULL,
	valores_referencia_ref_values varchar NULL
);


--------------------------------------------------------
--  DDL for Table diagnosis_er_adm
--------------------------------------------------------


-- Drop table

-- DROP TABLE diagnosis_er_adm;

CREATE TABLE diagnosis_er_adm (
	patient_id varchar NULL,
	dia_ppal varchar NULL,
	dia_02 varchar NULL,
	dia_03 varchar NULL,
	dia_04 varchar NULL,
	dia_05 varchar NULL,
	dia_06 varchar NULL,
	dia_07 varchar NULL,
	dia_08 varchar NULL,
	dia_09 varchar NULL,
	dia_10 varchar NULL,
	dia_11 varchar NULL,
	dia_12 varchar NULL,
	proc_01 varchar NULL,
	proc_02 varchar NULL,
	proc_03 varchar NULL,
	proc_04 varchar NULL,
	proc_05 varchar NULL
);


--------------------------------------------------------
--  DDL for Table diagnosis_hosp_adm
--------------------------------------------------------


-- Drop table

-- DROP TABLE diagnosis_hosp_adm;

CREATE TABLE diagnosis_hosp_adm (
	patient_id varchar NULL,
	dia_ppal varchar NULL,
	dia_02 varchar NULL,
	dia_03 varchar NULL,
	dia_04 varchar NULL,
	dia_05 varchar NULL,
	dia_06 varchar NULL,
	dia_08 varchar NULL,
	dia_07 varchar NULL,
	dia_09 varchar NULL,
	dia_10 varchar NULL,
	dia_11 varchar NULL,
	dia_12 varchar NULL,
	dia_13 varchar NULL,
	dia_14 varchar NULL,
	dia_15 varchar NULL,
	dia_16 varchar NULL,
	dia_17 varchar NULL,
	dia_18 varchar NULL,
	dia_19 varchar NULL,
	neo_01 varchar NULL,
	neo_02 varchar NULL,
	neo_03 varchar NULL,
	neo_04 varchar NULL,
	neo_05 varchar NULL,
	neo_06 varchar NULL,
	poad_02 varchar NULL,
	poad_03 varchar NULL,
	poad_04 varchar NULL,
	poad_05 varchar NULL,
	poad_06 varchar NULL,
	poad_07 varchar NULL,
	poad_08 varchar NULL,
	poad_09 varchar NULL,
	poad_10 varchar NULL,
	poad_11 varchar NULL,
	poad_12 varchar NULL,
	poad_13 varchar NULL,
	poad_14 varchar NULL,
	poad_15 varchar NULL,
	poad_16 varchar NULL,
	poad_17 varchar NULL,
	poad_18 varchar NULL,
	poad_19 varchar NULL,
	poad_ppal varchar NULL,
	proc_01 varchar NULL,
	proc_02 varchar NULL,
	proc_03 varchar NULL,
	proc_04 varchar NULL,
	proc_05 varchar NULL,
	proc_06 varchar NULL,
	proc_07 varchar NULL,
	proc_08 varchar NULL,
	proc_09 varchar NULL,
	proc_10 varchar NULL,
	proc_11 varchar NULL,
	proc_12 varchar NULL,
	proc_13 varchar NULL,
	proc_14 varchar NULL,
	proc_15 varchar NULL,
	proc_16 varchar NULL,
	proc_17 varchar NULL,
	proc_18 varchar NULL,
	proc_19 varchar NULL,
	proc_20 varchar NULL
);
