--------------------------------------------------------
--  File created - 04/24/2021
--------------------------------------------------------

-- -------------------------------------------------------------------------------
--
-- Set covidhm_dsd_v3 schema
--
-- -------------------------------------------------------------------------------
SET search_path TO covidhm_dsl_v3, public;

-- -------------------------------------------------------------------------------
--
-- Create covidhm tables
--
-- -------------------------------------------------------------------------------

-- If running scripts individually, you can set the schema where all tables are created as follows:
--SET search_path TO covidhm_dsl_v3; -- or your schema name

--------------------------------------------------------
--  DDL for Table patient
--------------------------------------------------------
-- WARNING: When importing this file use:
-- utf8 encoding.
-- replace ',' with '.' in temperature

-- New columns in CDSL v3:
--> diuresis_first_emerg - Do not contain values
--> idcdsl - Same values than IDINGRESO
--> ant_admision_date_in
--> ant_diag_inpat
--> icu_n_ing 

-- Drop table

-- DROP TABLE patient;

CREATE TABLE patient (
	patient_id int4 NOT NULL,
	age int4 NULL,
	sex varchar NULL,
	diag_inpat varchar NULL,
	admission_d_inpat timestamp without time zone NULL,--timestamp NULL,
	icu_date_in timestamp without time zone NULL,--timestamp NULL,
	icu_date_out timestamp without time zone NULL,--timestamp NULL,
	icu_days int4 NULL,
	mechvent varchar NULL,
	discharge_date timestamp without time zone NULL,--timestamp NULL,
	destin_discharge varchar NULL,
	admission_date_emerg timestamp without time zone NULL,--timestamp NULL,
	time_admission_emerg time NULL,--timestamp NULL,
	department_emerg varchar NULL,
	diag_emerg varchar NULL,
	destin_emerg varchar NULL,
	time_constant_first_emerg varchar NULL,
	temp_first_emerg float8 NULL,--numeric NULL,
	hr_first_emerg int4 NULL,
	glu_first_emerg int4 NULL,--numeric NULL,
	sat_02_first_emerg int4 NULL,--numeric NULL,
	bp_max_first_emerg int4 NULL,--numeric NULL,

	bp_min_first_emerg int4 NULL,--numeric NULL,
	time_constant_last_emerg time NULL,--timestamp NULL,
	hr_last_emerg int4 NULL,--numeric NULL,
	temp_last_emerg float8 NULL,--numeric NULL,
	glu_last_emerg int4 NULL,--numeric NULL,
	sat_02_last_emerg int4 NULL,--numeric NULL,
	bp_max_last_emerg int4 NULL,--numeric NULL,
	bp_min_last_emerg int4 NULL,--numeric NULL,
	diuresis_first_emerg int4 NULL,--numeric NULL,
    idcdsl int4 NULL, 
	ant_admission_date_in timestamp without time zone NULL,--timestamp NULL,
	ant_diag_inpat varchar NULL,
    icu_n_ing int4 NULL,
	PRIMARY KEY(patient_id)
);

--------------------------------------------------------
--  DDL for Table vital_signs
--------------------------------------------------------

-- Drop table

-- DROP TABLE vital_signs;
-- WARNING: In order to properly ingest the decimal data into postgres
-- replace ',' with '.' in temp_ing column.

CREATE TABLE vital_signs (
	id_vital_sign SERIAL,
	patient_id int4 NOT NULL,
	constants_ing_date timestamp without time zone NULL,--date NULL,
	constants_ing_time time NULL,
	bp_max_ing int4 NULL,--numeric NULL,
	bp_min_ing int4 NULL,--numeric NULL,
	temp_ing float8 NULL,
	hr_ing int4 NULL,--numeric NULL,
	sat_02_ing int4 NULL,--numeric NULL,
	sat_02_ing_obs varchar NULL,--numeric NULL,
	glu_ing int4 NULL,--numeric NULL,
	PRIMARY KEY(id_vital_sign),
	CONSTRAINT patient_id_constraint
		FOREIGN KEY(patient_id)
			REFERENCES patient(patient_id)
);

--------------------------------------------------------
--  DDL for Table medication
--------------------------------------------------------
-- WARNING: When importing this file use:
-- LATIN1 encoding, utf8 introduces problems when addressing the accents.

-- Drop table

-- DROP TABLE medication;

CREATE TABLE medication (
	id_medication SERIAL,
	patient_id int4 NOT NULL,
	drug_comercial_name varchar NULL,
	id_atc5 varchar NULL,
	atc5_name varchar NULL,
	id_atc7 varchar NULL,
	atc7_name varchar NULL,
	daily_avrg_dose int4 NULL,
	drug_start_date timestamp without time zone NULL, --date NULL,
	drug_end_date timestamp without time zone NULL, --date NULL,
	PRIMARY KEY(id_medication),
	CONSTRAINT patient_id_constraint
		FOREIGN KEY(patient_id)
			REFERENCES patient(patient_id)
);

--------------------------------------------------------
--  DDL for Table laboratory
--------------------------------------------------------
-- WARNING: When importing this file use:
-- LATIN1 encoding, utf8 introduces problems when addressing the accents.

-- Drop table

-- DROP TABLE laboratory;

CREATE TABLE laboratory (
	id_laboratory SERIAL,
	patient_id int4 NOT NULL,
	lab_number varchar NULL,
	lab_date timestamp,--date NULL,
	time_lab time NULL,
	item_lab varchar NULL,
	val_result varchar NULL,
	ud_result varchar NULL,
	ref_values varchar NULL,
	PRIMARY KEY(id_laboratory),
	CONSTRAINT patient_id_constraint
		FOREIGN KEY(patient_id)
			REFERENCES patient(patient_id)
);


--------------------------------------------------------
--  DDL for Table diagnosis_er_adm
--------------------------------------------------------

-- Drop table

-- DROP TABLE diagnosis_er_adm;

CREATE TABLE diagnosis_er_adm (
	id_diagnosis_er_adm SERIAL,
    patient_id int4 NOT NULL,
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
	proc_05 varchar NULL,
	PRIMARY KEY(id_diagnosis_er_adm),
	CONSTRAINT patient_id_constraint
		FOREIGN KEY(patient_id)
			REFERENCES patient(patient_id)
);


--------------------------------------------------------
--  DDL for Table diagnosis_hosp_adm
--------------------------------------------------------

-- Drop table

-- DROP TABLE diagnosis_hosp_adm;

CREATE TABLE diagnosis_hosp_adm (
	id_diagnosis_hosp_adm SERIAL,
	patient_id int4 NOT NULL,
	dia_ppal varchar NULL,
	poad_ppal varchar NULL,
	dia_02 varchar NULL,
	poad_02 varchar NULL,
	dia_03 varchar NULL,
	poad_03 varchar NULL,
	dia_04 varchar NULL,
	poad_04 varchar NULL,
	dia_05 varchar NULL,
	poad_05 varchar NULL,
	dia_06 varchar NULL,
	poad_06 varchar NULL,
	dia_07 varchar NULL,
	poad_07 varchar NULL,
	dia_08 varchar NULL,
	poad_08 varchar NULL,
	dia_09 varchar NULL,
	poad_09 varchar NULL,
	dia_10 varchar NULL,
	poad_10 varchar NULL,
	dia_11 varchar NULL,
	poad_11 varchar NULL,
	dia_12 varchar NULL,
	poad_12 varchar NULL,
	dia_13 varchar NULL,
	poad_13 varchar NULL,
	dia_14 varchar NULL,
	poad_14 varchar NULL,
	dia_15 varchar NULL,
	poad_15 varchar NULL,
	dia_16 varchar NULL,
	poad_16 varchar NULL,
	dia_17 varchar NULL,
	poad_17 varchar NULL,
	dia_18 varchar NULL,
	poad_18 varchar NULL,
	dia_19 varchar NULL,
	poad_19 varchar NULL,
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
	proc_20 varchar NULL,
	neo_01 varchar NULL,
	neo_02 varchar NULL,
	neo_03 varchar NULL,
	neo_04 varchar NULL,
	neo_05 varchar NULL,
	neo_06 varchar NULL,
	PRIMARY KEY(id_diagnosis_hosp_adm),
	CONSTRAINT patient_id_constraint
		FOREIGN KEY(patient_id)
			REFERENCES patient(patient_id)
);


--------------------------------------------------------
--  DDL for Table icd10_codes_dict
--------------------------------------------------------

-- Drop table

-- DROP TABLE icd10_codes_dict;
-- This table was obtained from https://www.cms.gov/files/zip/2021-code-descriptions-tabular-order-updated-12162020.zip

CREATE TABLE icd10_codes_dict(
	--cat_code VARCHAR,
	--dx_code  VARCHAR,--INTEGER,
	order_number VARCHAR,
	full_code     VARCHAR,
	abbrev_desc   VARCHAR,
	full_desc     VARCHAR,
	codeheader    VARCHAR
);