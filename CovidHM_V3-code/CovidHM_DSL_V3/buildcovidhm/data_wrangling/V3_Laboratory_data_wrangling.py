import pandas as pd
import datetime as dt

from pathlib import Path

import os
  
######################################### WRANGLING LABORATORY TABLE DATA #########################################
V3_data_folder = Path("C:/Users/Jesus/Desktop/Master/TFM/Datos/19_04_2021/")

V3_laboratory = V3_data_folder / "COVID_DSL_06.csv"

### V3 COVID_DSL_06 - Data wrangling: removing lines exceeding fields number (7) NOT NEEDED!!!!!!
data = []

try: # open file in read mode
    fp = open(V3_laboratory, "r", newline="\r\n", encoding = "utf-16")

    for line in fp:
        data.append(line)

finally:
    fp.close()


try: # open file in writing mode
    f = open(V3_laboratory, "w", newline="\n", encoding = "utf-8")
    for line in data :
        commas_num = line.count(',')

        if commas_num <= 7:  # Removing lines with more than 7 fields # Condition for data to be deleted
            f.write(line)
finally:
    f.close()