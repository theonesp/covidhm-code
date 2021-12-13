import pandas as pd
import datetime as dt

from pathlib import Path

######################################### WRANGLING MEDICATION TABLE DATA #########################################
V3_data_folder = Path("C:/Users/Jesus/Desktop/Master/TFM/Datos/19_04_2021/")
V2_data_folder = Path("C:/Users/Jesus/Desktop/Master/TFM/Datos/20_07_2020/")

V3_medication = V3_data_folder / "COVID_DSL_04.csv"
V2_medication = V2_data_folder / "CDSL_02.csv"

###### V3 COVID_DSL_04
# Load csv data into dataframe
df_V3 = pd.read_csv(V3_medication, delimiter="|", encoding="ANSI")
# Get columns name
df_V3_columns = df_V3.columns.tolist()

###### V2 CDSL_02
# Load csv data into dataframe
df_V2 = pd.read_csv(V2_medication, delimiter=";", encoding="ANSI", decimal = ",")
# Get columns name
df_V2_columns = df_V2.columns.tolist()

###### V2 CDSL_02.csv Data wrangling
### Dictionary containing V2 CDSL_02 <--> V3 COVID_DSL_04 column names equivalence (Ordered as in V3 COVID_DSL_04)
"""col_names_eq_dict = {'IDINGRESO':'IDINGRESO',
                     'DRUG_COMERCIAL_NAME':'DRUG_COMERCIAL_NAME',
                     'ID_ATC5':'ID_ATC5',
                     'ATC5_NAME':'ATC5_NAME',
                     'ID_ATC7':'ID_ATC7',
                     'ATC7_NAME':'ATC7_NAME',
                     'DAILY_AVRG_DOSE':'DAILY_AVRG_DOSE',
                     'DRUG_START_DATE':'DRUG_START_DATE',
                     'DRUG_END_DATE':'DRUG_END_DATE'}"""

                     ## F_UCI_OUT --> 2020-12-21 15:49:29.157000000

# Date/Time formatting
col_aux = ['DRUG_START_DATE', 'F_ALDRUG_END_DATETA_ING']
for col in col_aux:
  df_V2[col] = pd.to_datetime(df_V2[col]).dt.strftime('%d-%m-%Y')

## Dataframe to CSV
df_V2.to_csv(V2_medication, index = False, encoding="ANSI", sep = "|")