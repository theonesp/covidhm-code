--DROP VIEW IF EXISTS patient_fixed_dx;
CREATE VIEW patient_fixed_dx AS
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
    WHEN diag_urg_emerg ILIKE '%ALTERACI�N DEL NIVEL DE CONCIENCIA%' THEN 'ALTERACIÓN DEL NIVEL DE CONCIENCIA'
    WHEN diag_urg_emerg ILIKE '%ANSIEDAD%' THEN 'ANSIEDAD'
    WHEN diag_urg_emerg ILIKE '%ASTENIA%' THEN 'ASTENIA'
    WHEN diag_urg_emerg ILIKE '%CEFALEA%' THEN 'CEFALEA'
    WHEN diag_urg_emerg ILIKE '%COMPLICACI�N HERIDA QUIR�RGICA%' THEN 'COMPLICACIÓN HERIDA QUIRÚRGICA'
    WHEN diag_urg_emerg ILIKE '%COMPLICACI�N POSTQUIR�RGICA%' THEN 'COMPLICACIÓN POSTQUIRÚRGICA'
    WHEN diag_urg_emerg ILIKE '%CUADRO CATARRAL%' THEN 'CUADRO CATARRAL'
    WHEN diag_urg_emerg ILIKE '%DESORIENTACI�N%' THEN 'DESORIENTACIÓN'
    WHEN diag_urg_emerg ILIKE '%DETERIORO PACIENTE ONCOL�GICO%' THEN 'DETERIORO PACIENTE ONCOLÓGICO'
    WHEN diag_urg_emerg ILIKE '%DIARREA%' THEN 'DIARREA'
    WHEN diag_urg_emerg ILIKE '%DIFICULTAD EN DIURESIS%' THEN 'DIFICULTAD EN DIURESIS'
    WHEN diag_urg_emerg ILIKE '%DIFICULTAD PARA HABLAR%' THEN 'DIFICULTAD PARA HABLAR'
    WHEN diag_urg_emerg ILIKE '%DIFICULTAD RESPIRATORIA%' THEN 'DIFICULTAD RESPIRATORIA'
    WHEN diag_urg_emerg ILIKE '%DISURIA%' THEN 'DISURIA'
    WHEN diag_urg_emerg ILIKE '%DOLOR (SIN ESPECIFICAR)%' THEN 'DOLOR (SIN ESPECIFICAR)'
    WHEN diag_urg_emerg ILIKE '%DOLOR ABDOMINAL%' THEN 'DOLOR ABDOMINAL'
    WHEN diag_urg_emerg ILIKE '%DOLOR AL TRAGAR%' THEN 'DOLOR AL TRAGAR'
    WHEN diag_urg_emerg ILIKE '%DOLOR COSTAL%' THEN 'DOLOR COSTAL'
    WHEN diag_urg_emerg ILIKE '%DOLOR EN EL PECHO%' THEN 'DOLOR EN EL PECHO'
    WHEN diag_urg_emerg ILIKE '%DOLOR LUMBAR%' THEN 'DOLOR LUMBAR'
    WHEN diag_urg_emerg ILIKE '%DOLOR MMII%' THEN 'DOLOR MMII'
    WHEN diag_urg_emerg ILIKE '%DOLOR TOR�CICO%' THEN 'DOLOR TORÁCICO'
    WHEN diag_urg_emerg ILIKE '%EPISTAXIS%' THEN 'EPISTAXIS'
    WHEN diag_urg_emerg ILIKE '%ESTRE�IMIENTO%' THEN 'ESTREÑIMIENTO'
    WHEN diag_urg_emerg ILIKE '%FIEBRE%' THEN 'FIEBRE'
    WHEN diag_urg_emerg ILIKE '%HEMORRAGIA DIGESTIVA%' THEN 'HEMORRAGIA DIGESTIVA'
    WHEN diag_urg_emerg ILIKE '%HERIDA CABEZA/CARA%' THEN 'HERIDA CABEZA/CARA'
    WHEN diag_urg_emerg ILIKE '%HINCHAZ�N MMII%' THEN 'HINCHAZÓN MMII'
    WHEN diag_urg_emerg ILIKE '%HIPERGLUCEMIA%' THEN 'HIPERGLUCEMIA'
    WHEN diag_urg_emerg ILIKE '%HIPERTENSI�N ARTERIAL%' THEN 'HIPERTENSIÓN ARTERIAL'
    WHEN diag_urg_emerg ILIKE '%INTOXICACI�N MEDICAMENTOSA%' THEN 'INTOXICACIÓN MEDICAMENTOSA'
    WHEN diag_urg_emerg ILIKE '%MALESTAR%' THEN 'MALESTAR'
    WHEN diag_urg_emerg ILIKE '%MALESTAR GENERAL%' THEN 'MALESTAR GENERAL'
    WHEN diag_urg_emerg ILIKE '%MAREO%' THEN 'MAREO'
    WHEN diag_urg_emerg ILIKE '%MELENAS%' THEN 'MELENAS'
    WHEN diag_urg_emerg ILIKE '%METRORRAGIA 3� TRIMESTRE%' THEN 'METRORRAGIA TERCER TRIMESTRE'
    WHEN diag_urg_emerg ILIKE '%N�USEAS/V�MITOS%' THEN 'NÁUSEAS/VÓMITOS'
    WHEN diag_urg_emerg ILIKE '%PALPITACIONES (ARRITMIA)%' THEN 'PALPITACIONES (ARRITMIA)'
    WHEN diag_urg_emerg ILIKE '%PARESIA MMSS%' THEN 'PARESIA MMSS'
    WHEN diag_urg_emerg ILIKE '%PARESTESIAS%' THEN 'PARESTESIAS'
    WHEN diag_urg_emerg ILIKE '%P�RDIDA DE CONOCIMIENTO%' THEN 'PÉRDIDA DE CONOCIMIENTO'
    WHEN diag_urg_emerg ILIKE '%REACCI�N AL�RGICA%' THEN 'REACCIÓN ALÉRGICA'
    WHEN diag_urg_emerg ILIKE '%RECTORRAGIA%' THEN 'RECTORRAGIA'
    WHEN diag_urg_emerg ILIKE '%SOSPECHA C�LICO NEFRITICO%' THEN 'SÍNCOPE'
    WHEN diag_urg_emerg ILIKE '%SOSPECHA RPM%' THEN 'SOSPECHA CÍLICO NEFRITICO'
    WHEN diag_urg_emerg ILIKE '%S�NCOPE%' THEN 'SOSPECHA RPM'
    WHEN diag_urg_emerg ILIKE '%TAQUICARDIA%' THEN 'TAQUICARDIA'
    WHEN diag_urg_emerg ILIKE '%TOS%' THEN 'TOS'
    WHEN diag_urg_emerg ILIKE '%TRAUMATISMO COSTAL%' THEN 'TRAUMATISMO COSTAL'
    WHEN diag_urg_emerg ILIKE '%TRAUMATISMO CRANEAL%' THEN 'TRAUMATISMO CRANEAL'
    WHEN diag_urg_emerg ILIKE '%TRAUMATISMO FACIAL%' THEN 'TRAUMATISMO FACIAL'
    WHEN diag_urg_emerg ILIKE '%TRAUMATISMO MMII%' THEN 'TRAUMATISMO MMII'
    WHEN diag_urg_emerg ILIKE '%TUMORACI�N (SIN ESPECIFICAR)%' THEN 'TUMORACIÓN (SIN ESPECIFICAR)'
END
  AS diag_urg_emerg_fixed,
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