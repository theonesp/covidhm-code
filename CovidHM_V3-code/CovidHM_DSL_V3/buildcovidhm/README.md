# Building the covidhm database
This directory contains:

--> data_wrangling folder:
    -- Scripts to adapt V2 csv format to V3 tables
    -- Scripts to adapt V3 csv format to V3 tables
    
--> postgres folder: Scripts that can be used to create:
    -- a new instance of the Covid Database
    -- a new instance of the V3 schema
    -- tables of schema
    -- load data from csv into schema tables *

* Please perform data wrangling over HM dataset V3 task prior to load data into V3 tables.
* icd10cm_order_2021 shall be obtained from https://www.cms.gov/files/zip/2021-code-descriptions-tabular-order-updated-12162020.zip - Data wrangling script overwrites input file
* Please carefully review the warnings inside the '03_postgres_create_tables.sql' file when importing the data.*
