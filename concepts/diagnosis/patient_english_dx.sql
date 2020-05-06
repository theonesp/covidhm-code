--DROP VIEW IF EXISTS patient_english_dx;
CREATE VIEW patient_english_dx AS
SELECT
  patient_id,
  edad_age,
  sexo_sex,
  diag_ing_inpat,
  f_ingreso_admission_d_ing_inpat,
  f_entrada_uc_icu_date_in,
  f_salida_uci_icu_date_out,
  uci_dias_icu_days,
  f_alta_discharge_date_ing,
  motivo_alta_destiny_discharge_ing,
  f_ingreso_admission_date_urg_emerg,
  hora_time_admision_admission_urg_emerg,
  especialidad_department_urg_emerg,
  CASE
 WHEN diag_urg_emerg ILIKE '%ALTERACI�N DEL NIVEL DE CONCIENCIA%' THEN 'ALTERATION OF THE LEVEL OF CONSCIOUSNESS'
 WHEN diag_urg_emerg ILIKE '%ANSIEDAD%' THEN 'ANXIETY'
 WHEN diag_urg_emerg ILIKE '%ASTENIA%' THEN 'ASTHENIA'
 WHEN diag_urg_emerg ILIKE '%CEFALEA%' THEN 'HEADACHE'
 WHEN diag_urg_emerg ILIKE '%COMPLICACI�N HERIDA QUIR�RGICA%' THEN 'SURGICAL WOUND COMPLICATION'
 WHEN diag_urg_emerg ILIKE '%COMPLICACI�N POSTQUIR�RGICA%' THEN 'POST-SURGICAL COMPLICATION'
 WHEN diag_urg_emerg ILIKE '%CUADRO CATARRAL%' THEN 'CATARRAL TABLE'
 WHEN diag_urg_emerg ILIKE '%DESORIENTACI�N%' THEN 'DISORIENTATION'
 WHEN diag_urg_emerg ILIKE '%DETERIORO PACIENTE ONCOL�GICO%' THEN 'ONCOLOGICAL PATIENT DETERIORATION'
 WHEN diag_urg_emerg ILIKE '%DIARREA%' THEN 'DIARRHEA'
 WHEN diag_urg_emerg ILIKE '%DIFICULTAD EN DIURESIS%' THEN 'DIFFICULTY IN DIURESIS'
 WHEN diag_urg_emerg ILIKE '%DIFICULTAD PARA HABLAR%' THEN 'DIFFICULTY TO SPEAK'
 WHEN diag_urg_emerg ILIKE '%DIFICULTAD RESPIRATORIA%' THEN 'RESPIRATORY DIFFICULTY'
 WHEN diag_urg_emerg ILIKE '%DISURIA%' THEN 'DYSURIA'
 WHEN diag_urg_emerg ILIKE '%DOLOR (SIN ESPECIFICAR)%' THEN 'PAIN (NOT SPECIFIED)'
 WHEN diag_urg_emerg ILIKE '%DOLOR ABDOMINAL%' THEN 'ABDOMINAL PAIN'
 WHEN diag_urg_emerg ILIKE '%DOLOR AL TRAGAR%' THEN 'PAIN WHEN SWALLOWING'
 WHEN diag_urg_emerg ILIKE '%DOLOR COSTAL%' THEN 'COSTAL PAIN'
 WHEN diag_urg_emerg ILIKE '%DOLOR EN EL PECHO%' THEN 'CHEST PAIN'
 WHEN diag_urg_emerg ILIKE '%DOLOR LUMBAR%' THEN 'LUMBAR PAIN'
 WHEN diag_urg_emerg ILIKE '%DOLOR MMII%' THEN 'MMII PAIN'
 WHEN diag_urg_emerg ILIKE '%DOLOR TOR�CICO%' THEN 'THORACIC PAIN'
 WHEN diag_urg_emerg ILIKE '%EPISTAXIS%' THEN 'EPISTAXIS'
 WHEN diag_urg_emerg ILIKE '%ESTRE�IMIENTO%' THEN 'CONSTIPATION'
 WHEN diag_urg_emerg ILIKE '%FIEBRE%' THEN 'FEVER'
 WHEN diag_urg_emerg ILIKE '%HEMORRAGIA DIGESTIVA%' THEN 'DIGESTIVE HEMORRHAGE'
 WHEN diag_urg_emerg ILIKE '%HERIDA CABEZA/CARA%' THEN 'HEAD / FACE WOUND'
 WHEN diag_urg_emerg ILIKE '%HINCHAZ�N MMII%' THEN 'MMII SWELL'
 WHEN diag_urg_emerg ILIKE '%HIPERGLUCEMIA%' THEN 'Hyperglycaemia'
 WHEN diag_urg_emerg ILIKE '%HIPERTENSI�N ARTERIAL%' THEN 'ARTERIAL HYPERTENSION'
 WHEN diag_urg_emerg ILIKE '%INTOXICACI�N MEDICAMENTOSA%' THEN 'MEDICATION POISONING'
 WHEN diag_urg_emerg ILIKE '%MALESTAR%' THEN 'DISCOMFORT'
 WHEN diag_urg_emerg ILIKE '%MALESTAR GENERAL%' THEN 'GENERAL DISCOMFORT'
 WHEN diag_urg_emerg ILIKE '%MAREO%' THEN 'DIZZINESS'
 WHEN diag_urg_emerg ILIKE '%MELENAS%' THEN 'MELENAS'
 WHEN diag_urg_emerg ILIKE '%METRORRAGIA 3� TRIMESTRE%' THEN 'THIRD QUARTER METRORRAGY'
 WHEN diag_urg_emerg ILIKE '%N�USEAS/V�MITOS%' THEN 'NAUSE / VOMITING'
 WHEN diag_urg_emerg ILIKE '%PALPITACIONES (ARRITMIA)%' THEN 'PALPITATIONS (ARRHYTHMIA)'
 WHEN diag_urg_emerg ILIKE '%PARESIA MMSS%' THEN 'PARESIA MMSS'
 WHEN diag_urg_emerg ILIKE '%PARESTESIAS%' THEN 'PARESTHESIA'
 WHEN diag_urg_emerg ILIKE '%P�RDIDA DE CONOCIMIENTO%' THEN 'LOSS OF KNOWLEDGE'
 WHEN diag_urg_emerg ILIKE '%REACCI�N AL�RGICA%' THEN 'ALLERGIC REACTION'
 WHEN diag_urg_emerg ILIKE '%RECTORRAGIA%' THEN 'RECTORRAGY'
 WHEN diag_urg_emerg ILIKE '%SOSPECHA C�LICO NEFRITICO%' THEN 'SYNCOPE'
 WHEN diag_urg_emerg ILIKE '%SOSPECHA RPM%' THEN 'NEPHRITIC CYCLIC SUSPECT'
 WHEN diag_urg_emerg ILIKE '%S�NCOPE%' THEN 'SUSPECT RPM'
 WHEN diag_urg_emerg ILIKE '%TAQUICARDIA%' THEN 'TACHYCARDIA'
 WHEN diag_urg_emerg ILIKE '%TOS%' THEN 'COUGH'
 WHEN diag_urg_emerg ILIKE '%TRAUMATISMO COSTAL%' THEN 'COSTAL TRAUMA'
 WHEN diag_urg_emerg ILIKE '%TRAUMATISMO CRANEAL%' THEN 'CRANIAL INJURY'
 WHEN diag_urg_emerg ILIKE '%TRAUMATISMO FACIAL%' THEN 'FACIAL INJURY'
 WHEN diag_urg_emerg ILIKE '%TRAUMATISMO MMII%' THEN 'MMII TRAUMA'
 WHEN diag_urg_emerg ILIKE '%TUMORACI�N (SIN ESPECIFICAR)%' THEN 'TUMORATION (NOT SPECIFIED)'
 END
  AS er_adm_dx,
  destino_destiny_urg_emerg,
  hora_time_constant_primera_first_urg_emerg,
  temp_primera_first_urg_emerg,
  fc_hr_primera_first_urg_emerg,
  glu_primera_first_urg_emerg,
  sat_02_primera_first_urg_emerg,
  ta_max_primera_first_emerg_urg,
  ta_min_primera_first_urg_emerg,
  hora_time_constant_ultima_last_urg_emerg,
  fc_hr_ultima_last_urg_emerg,
  temp_ultima_last_urg_emerg,
  glu_ultima_last_urg_emerg,
  sat_02_ultima_last_urg_emerg,
  ta_max_ultima_last_urgemerg,
  ta_min_ultima_last_urg_emerg
FROM
  covidhm_24_04_2020.patient
;