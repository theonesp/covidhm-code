import pandas as pd
import datetime as dt

from pathlib import Path

import os
  
######################################### WRANGLING DIAGNOSIS_ER_ADM TABLE DATA #########################################
V2_data_folder = Path("C:/Users/Jesus/Desktop/Master/TFM/Datos/20_07_2020/")

V2_diagnosis_er_adm = V2_data_folder / "CDSL_05.csv"

### V2 CDSL_05 - Data wrangling: change delimiter from ";"  to "|"
data = []

try: # open file in read mode
    fp = open(V2_diagnosis_er_adm, "r", newline="\r\n", encoding = "utf-8")

    for line in fp:
        line = line.replace(";", "|")
        data.append(line)

finally:
    fp.close()


try: # open file in writing mode
    f = open(V2_diagnosis_er_adm, "w", newline="\n", encoding = "utf-8")
    for line in data :
        commas_num = line.count('|')

        if commas_num <= 17:  # Removing lines with more than 7 fields # Condition for data to be deleted
            f.write(line)
finally:
    f.close()