-- -------------------------------------------------------------------------------
--
-- Load data into the covidhm schema
--
-- -------------------------------------------------------------------------------

--------------------------------------------------------
--  File created - 4/29/2020
--------------------------------------------------------

-- Change to the directory containing the data files
\cd :covidhm_data_dir

-- If running scripts individually, you can set the schema where all tables are created as follows:
-- SET search_path TO covidhm_24_04_2020;

--------------------------------------------------------
--  Load Data for Table patient
--------------------------------------------------------

\copy patient FROM '01.csv' DELIMITER ';' CSV HEADER 

--------------------------------------------------------
--  Load Data for Table medication
--------------------------------------------------------

\copy medication FROM '02.csv' DELIMITER ';' CSV HEADER 


--------------------------------------------------------
--  Load Data for Table vital_sign
--------------------------------------------------------

\copy vital_sign FROM '03.csv' DELIMITER ';' CSV HEADER 

--------------------------------------------------------
--  Load Data for Table laboratory
--------------------------------------------------------

\copy laboratory FROM '04.csv' DELIMITER ';' CSV HEADER 

--------------------------------------------------------
--  Load Data for Table diagnosis_er_adm
--------------------------------------------------------

\copy diagnosis_er_adm FROM '05.csv' DELIMITER ';' CSV HEADER 

--------------------------------------------------------
--  Load Data for Table diagnosis_hosp_adm
--------------------------------------------------------

\copy diagnosis_hosp_adm FROM '06.csv' DELIMITER ';' CSV HEADER 