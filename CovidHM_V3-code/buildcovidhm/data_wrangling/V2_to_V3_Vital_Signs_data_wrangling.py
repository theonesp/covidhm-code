import pandas as pd
import datetime as dt

from pathlib import Path

######################################### WRANGLING VITAL SIGNS TABLE DATA #########################################
V3_data_folder = Path("C:/Users/Jesus/Desktop/Master/TFM/Datos/19_04_2021/")
V2_data_folder = Path("C:/Users/Jesus/Desktop/Master/TFM/Datos/20_07_2020/")

V3_vital_signs = V3_data_folder / "COVID_DSL_02.csv"
V2_vital_signs = V2_data_folder / "CDSL_03.csv"

### V3 COVID_DSL_02
# Load csv data into dataframe
#df_V3 = pd.read_csv(V3_vital_signs, delimiter="|", encoding="utf-8")

### V2 CDSL_03
# Load csv data into dataframe
df_V2 = pd.read_csv(V2_vital_signs, delimiter=";", encoding="latin1", decimal = ",")

###### V2 CDSL_02.csv Data wrangling
#df_V2["TEMP_ING"] = df_V2["TEMP_ING"].astype(str)
#df_V2["TEMP_ING"] = df_V2["TEMP_ING"].str.replace(".",",") 

## Dataframe to CSV
df_V2.to_csv(V2_vital_signs, index = False, encoding="latin1", sep = "|")