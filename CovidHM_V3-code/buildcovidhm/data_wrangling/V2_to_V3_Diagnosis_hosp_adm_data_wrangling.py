import pandas as pd
import datetime as dt

from pathlib import Path

import os
  
######################################### WRANGLING DIAGNOSIS_HOSP_ADM TABLE DATA #########################################
V3_data_folder = Path("C:/Users/Jesus/Desktop/Master/TFM/Datos/19_04_2021/")
V2_data_folder = Path("C:/Users/Jesus/Desktop/Master/TFM/Datos/20_07_2020/")

V3_diagnosis_hosp_adm = V3_data_folder / "COVID_DSL_05.csv"
V2_diagnosis_hosp_adm = V2_data_folder / "CDSL_06.csv"


### V2 CDSL_06 - Data wrangling: change delimiter from ";"  to "|" and remove lines with "IDINGRESO" field empty
data = []

try: # open file in read mode
    fp = open(V2_diagnosis_hosp_adm, "r", newline="\r\n", encoding = "utf-8")

    for line in fp:
        line = line.replace(";", "|")
        data.append(line)

finally:
    fp.close()


try: # open file in writing mode
    f = open(V2_diagnosis_hosp_adm, "w", newline="\n", encoding = "utf-8")
    for line in data :

        if line[1] != "|": #Removing lines with "IDINGRESO" field empty
            print(line)
            f.write(line)
        else:
            print(line)

finally:
    f.close()

### V2 CDSL_06 - Data wrangling: Reordering fields according to V3
#V3 COVID_DSL_05
# Load csv data into dataframe
df_V3 = pd.read_csv(V3_diagnosis_hosp_adm, delimiter="|", encoding="utf-8")
# Get columns name
df_V3_columns = df_V3.columns.tolist()

# V2 CDSL_06
# Load csv data into dataframe
df_V2 = pd.read_csv(V2_diagnosis_hosp_adm, delimiter="|", encoding="utf-8")

df_V2 = df_V2.reindex(columns=df_V3_columns) # V2 CDSL_01 dataframe columns re-ordered acc. to V3

# Change "Non-numeric" to "numeric" (int)
df_V2["IDINGRESO"] = pd.to_numeric(df_V2[""])
df_V2["IDINGRESO"] = df_V2["IDINGRESO"].fillna(0).astype(int)

# Remove rows with "IDINGRESO"==0
indexNames = df_V2[ df_V2["IDINGRESO"] == 0 ].index
df_V2.drop(indexNames , inplace=True)

## Dataframe to CSV
df_V2.to_csv(V2_diagnosis_hosp_adm, index = False, encoding="utf-8", sep = "|")