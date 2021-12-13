-- this query extracts comorbidities information for all patients
SELECT
	patient_id
	,MAX(CASE WHEN dia_ppal ILIKE ANY(ARRAY['E09&','E10%','E11%']) 
			  OR dia_02 ILIKE ANY(ARRAY['E09&','E10%','E11%'])
			  OR dia_03 ILIKE ANY(ARRAY['E09&','E10%','E11%']) 
			  OR dia_04 ILIKE ANY(ARRAY['E09&','E10%','E11%']) 
			  OR dia_05 ILIKE ANY(ARRAY['E09&','E10%','E11%']) 
			  OR dia_06 ILIKE ANY(ARRAY['E09&','E10%','E11%']) 
			  OR dia_07 ILIKE ANY(ARRAY['E09&','E10%','E11%']) 
			  OR dia_08 ILIKE ANY(ARRAY['E09&','E10%','E11%']) 
			  OR dia_09 ILIKE ANY(ARRAY['E09&','E10%','E11%']) 
			  OR dia_10 ILIKE ANY(ARRAY['E09&','E10%','E11%']) 	
	THEN 1 ELSE 0
	END) AS pmhx_diabetes
	,MAX(CASE WHEN dia_ppal ILIKE ANY(ARRAY['E78%']) 
			  OR dia_02 ILIKE ANY(ARRAY['E78%']) 
			  OR dia_03 ILIKE ANY(ARRAY['E78%'])  
			  OR dia_04 ILIKE ANY(ARRAY['E78%'])  
			  OR dia_05 ILIKE ANY(ARRAY['E78%'])  
			  OR dia_06 ILIKE ANY(ARRAY['E78%'])  
			  OR dia_07 ILIKE ANY(ARRAY['E78%'])  
			  OR dia_08 ILIKE ANY(ARRAY['E78%'])  
			  OR dia_09 ILIKE ANY(ARRAY['E78%'])  
			  OR dia_10 ILIKE ANY(ARRAY['E78%'])  	
	THEN 1 ELSE 0
	END) AS pmhx_hld
	,MAX(CASE WHEN dia_ppal ILIKE ANY(ARRAY['I11%','I13%','I50%']) 
			  OR dia_02 ILIKE ANY(ARRAY['I11%','I13%','I50%'])
			  OR dia_03 ILIKE ANY(ARRAY['I11%','I13%','I50%']) 
			  OR dia_04 ILIKE ANY(ARRAY['I11%','I13%','I50%']) 
			  OR dia_05 ILIKE ANY(ARRAY['I11%','I13%','I50%']) 
			  OR dia_06 ILIKE ANY(ARRAY['I11%','I13%','I50%']) 
			  OR dia_07 ILIKE ANY(ARRAY['I11%','I13%','I50%']) 
			  OR dia_08 ILIKE ANY(ARRAY['I11%','I13%','I50%']) 
			  OR dia_09 ILIKE ANY(ARRAY['I11%','I13%','I50%']) 
			  OR dia_10 ILIKE ANY(ARRAY['I11%','I13%','I50%']) 	
	THEN 1 ELSE 0
	END) AS pmhx_htn
	,MAX(CASE WHEN dia_ppal ILIKE ANY(ARRAY['I25%','Z95.1%']) 
			  OR dia_02 ILIKE ANY(ARRAY['I25%','Z95.1%'])
			  OR dia_03 ILIKE ANY(ARRAY['I25%','Z95.1%']) 
			  OR dia_04 ILIKE ANY(ARRAY['I25%','Z95.1%']) 
			  OR dia_05 ILIKE ANY(ARRAY['I25%','Z95.1%']) 
			  OR dia_06 ILIKE ANY(ARRAY['I25%','Z95.1%']) 
			  OR dia_07 ILIKE ANY(ARRAY['I25%','Z95.1%']) 
			  OR dia_08 ILIKE ANY(ARRAY['I25%','Z95.1%']) 
			  OR dia_09 ILIKE ANY(ARRAY['I25%','Z95.1%']) 
			  OR dia_10 ILIKE ANY(ARRAY['I25%','Z95.1%']) 	
	THEN 1 ELSE 0
	END) AS pmhx_ihd
	,MAX(CASE WHEN dia_ppal ILIKE ANY(ARRAY['N18%','I12%','I13%','D63%']) 
			  OR dia_02 ILIKE ANY(ARRAY['N18%','I12%','I13%','D63%'])
			  OR dia_03 ILIKE ANY(ARRAY['N18%','I12%','I13%','D63%']) 
			  OR dia_04 ILIKE ANY(ARRAY['N18%','I12%','I13%','D63%']) 
			  OR dia_05 ILIKE ANY(ARRAY['N18%','I12%','I13%','D63%']) 
			  OR dia_06 ILIKE ANY(ARRAY['N18%','I12%','I13%','D63%']) 
			  OR dia_07 ILIKE ANY(ARRAY['N18%','I12%','I13%','D63%']) 
			  OR dia_08 ILIKE ANY(ARRAY['N18%','I12%','I13%','D63%']) 
			  OR dia_09 ILIKE ANY(ARRAY['N18%','I12%','I13%','D63%']) 
			  OR dia_10 ILIKE ANY(ARRAY['N18%','I12%','I13%','D63%']) 	
	THEN 1 ELSE 0
	END) AS pmhx_ckd
	,MAX(CASE WHEN dia_ppal ILIKE ANY(ARRAY['J44%']) 
			  OR dia_02 ILIKE ANY(ARRAY['J44%'])
			  OR dia_03 ILIKE ANY(ARRAY['J44%']) 
			  OR dia_04 ILIKE ANY(ARRAY['J44%']) 
			  OR dia_05 ILIKE ANY(ARRAY['J44%']) 
			  OR dia_06 ILIKE ANY(ARRAY['J44%']) 
			  OR dia_07 ILIKE ANY(ARRAY['J44%']) 
			  OR dia_08 ILIKE ANY(ARRAY['J44%']) 
			  OR dia_09 ILIKE ANY(ARRAY['J44%']) 
			  OR dia_10 ILIKE ANY(ARRAY['J44%']) 	
	THEN 1 ELSE 0
	END) AS pmhx_copd		
	,MAX(CASE WHEN dia_ppal ILIKE ANY(ARRAY['J45%']) 
			  OR dia_02 ILIKE ANY(ARRAY['J45%'])
			  OR dia_03 ILIKE ANY(ARRAY['J45%']) 
			  OR dia_04 ILIKE ANY(ARRAY['J45%']) 
			  OR dia_05 ILIKE ANY(ARRAY['J45%']) 
			  OR dia_06 ILIKE ANY(ARRAY['J45%']) 
			  OR dia_07 ILIKE ANY(ARRAY['J45%']) 
			  OR dia_08 ILIKE ANY(ARRAY['J45%']) 
			  OR dia_09 ILIKE ANY(ARRAY['J45%']) 
			  OR dia_10 ILIKE ANY(ARRAY['J45%']) 	
	THEN 1 ELSE 0
	END) AS pmhx_asthma				
	,MAX(CASE WHEN dia_ppal ILIKE ANY(ARRAY['C%']) 
			  OR dia_02 ILIKE ANY(ARRAY['C%'])
			  OR dia_03 ILIKE ANY(ARRAY['C%']) 
			  OR dia_04 ILIKE ANY(ARRAY['C%']) 
			  OR dia_05 ILIKE ANY(ARRAY['C%']) 
			  OR dia_06 ILIKE ANY(ARRAY['C%']) 
			  OR dia_07 ILIKE ANY(ARRAY['C%']) 
			  OR dia_08 ILIKE ANY(ARRAY['C%']) 
			  OR dia_09 ILIKE ANY(ARRAY['C%']) 
			  OR dia_10 ILIKE ANY(ARRAY['C%']) 	
	THEN 1 ELSE 0
	END) AS pmhx_activecancer
	,MAX(CASE WHEN dia_ppal ILIKE ANY(ARRAY['K72%','K76.6%','K75.4%','K74.6%','K71.10%','K74.3%','K74.5%','K70.30%']) 
			  OR dia_02 ILIKE ANY(ARRAY['K72%','K76.6%','K75.4%','K74.6%','K71.10%','K74.3%','K74.5%','K70.30%'])
			  OR dia_03 ILIKE ANY(ARRAY['K72%','K76.6%','K75.4%','K74.6%','K71.10%','K74.3%','K74.5%','K70.30%']) 
			  OR dia_04 ILIKE ANY(ARRAY['K72%','K76.6%','K75.4%','K74.6%','K71.10%','K74.3%','K74.5%','K70.30%']) 
			  OR dia_05 ILIKE ANY(ARRAY['K72%','K76.6%','K75.4%','K74.6%','K71.10%','K74.3%','K74.5%','K70.30%']) 
			  OR dia_06 ILIKE ANY(ARRAY['K72%','K76.6%','K75.4%','K74.6%','K71.10%','K74.3%','K74.5%','K70.30%']) 
			  OR dia_07 ILIKE ANY(ARRAY['K72%','K76.6%','K75.4%','K74.6%','K71.10%','K74.3%','K74.5%','K70.30%']) 
			  OR dia_08 ILIKE ANY(ARRAY['K72%','K76.6%','K75.4%','K74.6%','K71.10%','K74.3%','K74.5%','K70.30%']) 
			  OR dia_09 ILIKE ANY(ARRAY['K72%','K76.6%','K75.4%','K74.6%','K71.10%','K74.3%','K74.5%','K70.30%']) 
			  OR dia_10 ILIKE ANY(ARRAY['K72%','K76.6%','K75.4%','K74.6%','K71.10%','K74.3%','K74.5%','K70.30%']) 	
	THEN 1 ELSE 0
	END) AS pmhx_chronicliver		
	,MAX(CASE WHEN dia_ppal ILIKE ANY(ARRAY['I6%']) 
			  OR dia_02 ILIKE ANY(ARRAY['I6%'])
			  OR dia_03 ILIKE ANY(ARRAY['I6%']) 
			  OR dia_04 ILIKE ANY(ARRAY['I6%']) 
			  OR dia_05 ILIKE ANY(ARRAY['I6%']) 
			  OR dia_06 ILIKE ANY(ARRAY['I6%']) 
			  OR dia_07 ILIKE ANY(ARRAY['I6%']) 
			  OR dia_08 ILIKE ANY(ARRAY['I6%']) 
			  OR dia_09 ILIKE ANY(ARRAY['I6%']) 
			  OR dia_10 ILIKE ANY(ARRAY['I6%']) 	
	THEN 1 ELSE 0
	END) AS pmhx_stroke	
FROM
	covidhm_dsl_v3.diagnosis_er_adm
GROUP BY
  patient_id
