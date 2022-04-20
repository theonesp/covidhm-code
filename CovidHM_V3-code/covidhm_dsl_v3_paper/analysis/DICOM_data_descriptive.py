import pydicom
import pandas as pd
import numpy as np
import os
import glob
import pickle 
import time
from datetime import datetime as dt

###########################################################################################################
###################################### DICOM DATA recovery from CSV #######################################
################################### BodyPartExamined re-categorization ####################################
###########################################################################################################
# Step 1: Get a list of all csv files in target directory
dicom_dir = 'E:/DICOM/COVID19_DICOM_STUDIES_19_04_2021/'
my_dir = "C:/Users/Jesus/Desktop/Master/TFM/Descriptivos/final/"
filelist = []
filesList = []
os.chdir( my_dir )

# Step 2: Build up list of files:
for files in glob.glob("*.txt"):
    fileName, fileExtension = os.path.splitext(files)
    filelist.append(fileName) #filename without extension
    filesList.append(files) #filename with extension

# Step 3: Build up DataFrame reading data from csv files contained in list:
df = pd.DataFrame(columns=['PatientID','Segment','SOPInstanceUID', 'StudyDate','StudyTime','Modality','BodyPartExamined','ViewPosition', 'PatientPosition', 'SpatialResolution', 'StudyDescription'])
for ijk in range(0,len(filelist)):
    frame = pd.read_csv(filesList[ijk], header=None, names=['PatientID','Segment','SOPInstanceUID', 'StudyDate','StudyTime','Modality','BodyPartExamined','ViewPosition', 'PatientPosition', 'SpatialResolution', 'StudyDescription'], sep=",")#delimiter='\s+')#sep = '\s+')
    df = df.append(frame)

# Step 4: Set up DataFrame dtypes:
df['PatientID'] = df['PatientID'].astype(int)
df2 = df.set_index('BodyPartExamined', inplace=False, drop=False)

# Step 5: 'BodyPartExamined' re-categorization
### Step 5.1: Filtering 'BodyPartExamined' belonging to two categories proposed by Radiologist team
Filter_df = df[(df['BodyPartExamined']=='TC TAP CRANEO') | (df['BodyPartExamined']=='TC TEP Y ABD') 
    | (df['BodyPartExamined']=='TEP ABD') | (df['BodyPartExamined']=='TEP ABDOMEN') | (df['BodyPartExamined']=='TEP CUELLO')
    | (df['BodyPartExamined']=='CRANEO TEP') | (df['BodyPartExamined']=='TAP CUELLO')]

### Step 5.2: Modify 'StudyDescription' values with categories proposed by Radiologist team
StudyDescription_dict = {
    'RX TORAX AP':'RADIOGRAPHY TORAX','RX TORAX AP Y LATERAL':'RADIOGRAPHY TORAX',
    'TC ARTERIAS PULMONARES':'PULMONARY ARTERIES',
    'TC TORACO-ABDOMINO-PELVICO CON CONTRASTE':'BODY','TC TORACO-ABOMINO-PELVICO SIN CONTRASTE':'BODY','TC TORAX BAJA DOSIS':'BODY',
    'TC TORAX CON CONTRASTE':'BODY','TC TORAX DE ALTA DEFINICION':'BODY','TC TORAX SIN CONTRASTE':'BODY'}
df['StudyDescription'] = df['StudyDescription'].apply(lambda x: StudyDescription_dict.get(x, x))

### Step 5.3: Fill 'BodyPartExamined' = Missing with 'StudyDescription' value
df["BodyPartExamined"] = df["BodyPartExamined"].fillna(df["StudyDescription"])

### Step 5.4: Modify 'BodyPartExamined' values with categories proposed by Radiologist team
BodyPartExamined_dict = {'TC TAP CRANEO':'BODY', 'TAP CUELLO':'BODY', 'TAP':'BODY',	
    'TC TAP':'BODY', 'TORAX-ABD-PELVIS':'BODY','TORAX-ABDOMEN':'BODY','TORAXABDPELV':'BODY',
    'TC TEP Y ABD':'PULMONARY ARTERIES', 'TEP ABD':'PULMONARY ARTERIES', 'TEP ABDOMEN':'PULMONARY ARTERIES', 'TEP CUELLO':'PULMONARY ARTERIES',	
    'CRANEO TEP':'CRANEAL',	'CABEZA':'CRANEAL',	'CEREBRAL':'CRANEAL', 'CRANEO':'CRANEAL',
    'TC ABD':'ABDOMINAL', 'TC ABD BIFASICO':'ABDOMINAL',	
    'ANKLE':'RADIOGRAPHY NO TORAX/ABDOMEN',	'ARM':'RADIOGRAPHY NO TORAX/ABDOMEN',	
    'ELBOW':'RADIOGRAPHY NO TORAX/ABDOMEN',	'HAND':'RADIOGRAPHY NO TORAX/ABDOMEN',	
    'LSPINE':'RADIOGRAPHY NO TORAX/ABDOMEN', 'NASAL':'RADIOGRAPHY NO TORAX/ABDOMEN',	
    'PELVIS':'RADIOGRAPHY NO TORAX/ABDOMEN', 'SHOULDER':'RADIOGRAPHY NO TORAX/ABDOMEN', 'SKULL':'RADIOGRAPHY NO TORAX/ABDOMEN',	
    'TORAX':'TORAX/ABDOMEN/CHEST', 
    'LUNG':'TORAX/ABDOMEN/CHEST', 'PECHO':'TORAX/ABDOMEN/CHEST', 'TACAR':'TORAX/ABDOMEN/CHEST', 'TC TACAR':'TORAX/ABDOMEN/CHEST', 'TC TORAX':'TORAX/ABDOMEN/CHEST',
    'TC TORAX AR':'TORAX/ABDOMEN/CHEST', 'TC TORAX BD':'TORAX/ABDOMEN/CHEST', 'TC TX':'TORAX/ABDOMEN/CHEST', 'TC TX BD':'TORAX/ABDOMEN/CHEST',
    'TORAX  BD':'TORAX/ABDOMEN/CHEST', 'TORAX AR':'TORAX/ABDOMEN/CHEST', 'TORAX BD':'TORAX/ABDOMEN/CHEST', 'TX':'TORAX/ABDOMEN/CHEST',	
    'TX BD':'TORAX/ABDOMEN/CHEST', 'TX SC':'TORAX/ABDOMEN/CHEST', 
    'ANGIO TORACICO':'PULMONARY ARTERIES', 'CR Y TEP SUSTR':'PULMONARY ARTERIES', 'TC  TEP':'PULMONARY ARTERIES',	
    'TC  TEP SUSTR':'PULMONARY ARTERIES', 'TC SIN Y TEP':'PULMONARY ARTERIES',	
    'TC T EP SUSTR':'PULMONARY ARTERIES', 'TC TEP':'PULMONARY ARTERIES',	
    'TC TEP SUST':'PULMONARY ARTERIES',	'TC TEP SUSTR':'PULMONARY ARTERIES',	
    'TC TEPN':'PULMONARY ARTERIES',	'TEP':'PULMONARY ARTERIES',	'TEP SUSTR':'PULMONARY ARTERIES',	
    'ABDOMEN':'TORAX/ABDOMEN/CHEST', 'CHEST':'TORAX/ABDOMEN/CHEST',		
    'CUELLO':'CERVICAL',	
    'TSA':'ANGIOTSA'}
df['BodyPartExamined'] = df['BodyPartExamined'].apply(lambda x: BodyPartExamined_dict.get(x, x))

### Step 5.5: Modify 'BodyPartExamined' values (belonging to two categories proposed by Radiologist team) with categories proposed by Radiologist team
BodyPartExamined_dict = {'TC TAP CRANEO':'CRANEAL',
    'TC TEP Y ABD':'ABDOMINAL','TEP ABD':'ABDOMINAL','TEP ABDOMEN':'ABDOMINAL',
    'TEP CUELLO':'CERVICAL', 'TAP CUELLO':'CERVICAL', 
    'CRANEO TEP':'PULMONARY ARTERIES'}
Filter_df['BodyPartExamined'] = Filter_df['BodyPartExamined'].apply(lambda x: BodyPartExamined_dict.get(x, x))
# Rename Segment ('_copy') to not filter them when counting "nnunique" Segment
Filter_df['Segment'] = Filter_df['Segment'].apply(lambda x: x+'_copy')

### Step 5.6: Appending 'BodyPartExamined' values belonging to two categories proposed by Radiologist team to initial dataframe in order to add both categories to count
appended = df.append(Filter_df)

# Step 6: Showing final dataframe shape
print(df.shape)
print(appended.shape)

# Step 7: Split dataframe into Modality 'CT' (Scaner) & 'CR'/'DX' (Radiography) dataframes
df_Scaner = appended[(appended['Modality']=='CT')] 
df_Radiography = appended[(appended['Modality']=='DX') | (appended['Modality']=='CR')]

# Step 8: Date filed formatting
df_Scaner['StudyDate'] = pd.to_datetime(df_Scaner['StudyDate'], format='%Y%m%d')
df_Radiography['StudyDate'] = pd.to_datetime(df_Radiography['StudyDate'], format='%Y%m%d')

###########################################################################################################
######################################### DICOM DATA descriptive ##########################################
###########################################################################################################
("---------------------------------------------------")
("---------------------------------------------------")
("---------------------------------------------------")
print("----------------DICOM CT Descriptive------------------------")
print("Test samples from {} to {}".format(df_Scaner['StudyDate'].min().date(), df_Scaner['StudyDate'].max().date()))
delta =  df_Scaner['StudyDate'].max().date() -  df_Scaner['StudyDate'].min().date()
print("Study duration (days): ", delta.days)
print("---------------------------------------------------")
df_Scaner_aggregated_byPatientID = df_Scaner.groupby('PatientID')['Segment']
print("Max. Nr of test per patient: ", df_Scaner_aggregated_byPatientID.nunique().max())
print("Min. Nr of test per patient: ", df_Scaner_aggregated_byPatientID.nunique().min())
print("Average Nr of test per patient: ", df_Scaner_aggregated_byPatientID.nunique().mean())
print("---------------------------------------------------")
df_Scaner_aggregated_byStudyDate = df_Scaner.groupby(['StudyDate'])['Segment']
print("Max. Nr of test per day: ", df_Scaner_aggregated_byStudyDate.nunique().max()) 
print("Min. Nr of test per day: ", df_Scaner_aggregated_byStudyDate.nunique().min()) 
print("Average Nr of test per day: ", df_Scaner_aggregated_byStudyDate.nunique().mean()) 
print("Average Nr of test per day (considering total study duration): ", df_Scaner_aggregated_byStudyDate.nunique().sum()/delta.days)
print("---------------------------------------------------")
df_Scaner_aggregated_byStudyDate_PatientID = df_Scaner.groupby(['StudyDate','PatientID'])['Segment']
print("Max. Nr of test per patient/day: ", df_Scaner_aggregated_byStudyDate_PatientID.nunique().max()) 
print("Min. Nr of test per patient/day: ", df_Scaner_aggregated_byStudyDate_PatientID.nunique().min()) 
print("Average Nr of test per patient/day: ", df_Scaner_aggregated_byStudyDate_PatientID.nunique().mean()) 
print("---------------------------------------------------")
df_Scaner_aggregations_StudyDate = df_Scaner.groupby("PatientID")["StudyDate"].agg(StudyDate_inicial = 'min', StudyDate_final ='max', Diff_date = lambda x: ((max(x) - min(x)).days))
print("Max. patient stay (days): ", df_Scaner_aggregations_StudyDate['Diff_date'].max())
print("Min. patient stay (days): ", df_Scaner_aggregations_StudyDate['Diff_date'].min())
print("Average patient stay (days): ", df_Scaner_aggregations_StudyDate['Diff_date'].mean())
print("---------------------------------------------------")
df_Scaner_aggregated_bySegment_BodyPart = df_Scaner.groupby(['Segment','BodyPartExamined'])['Segment'].agg('sum')
print("----------'BodyPartExamined' count-----------------")
df_Scaner_aggregated_byBodyPart = df_Scaner.groupby(['BodyPartExamined'])['Segment'].nunique()
print(df_Scaner_aggregated_byBodyPart)

("---------------------------------------------------")
("---------------------------------------------------")
("---------------------------------------------------")
print("----------------DICOM CR+DX Descriptive------------------------")
print("Test samples from {} to {}".format(df_Radiography['StudyDate'].min().date(), df_Radiography['StudyDate'].max().date()))
delta =  df_Radiography['StudyDate'].max().date() -  df_Radiography['StudyDate'].min().date()
print("Study duration (days): ", delta.days)
print("---------------------------------------------------")
df_Radiography_aggregated_byPatientID = df_Radiography.groupby(['PatientID'])['Segment']
print("Max. Nr of test per patient: ", df_Radiography_aggregated_byPatientID.nunique().max())
print("Min. Nr of test per patient: ", df_Radiography_aggregated_byPatientID.nunique().min())
print("Average Nr of test per patient: ", df_Radiography_aggregated_byPatientID.nunique().mean())
print("---------------------------------------------------")
df_Radiography_aggregated_byStudyDate = df_Radiography.groupby('StudyDate')['Segment']
print("Max. Nr of test per day: ", df_Radiography_aggregated_byStudyDate.nunique().max()) 
print("Min. Nr of test per day: ", df_Radiography_aggregated_byStudyDate.nunique().min()) 
print("Average Nr of test per day: ", df_Radiography_aggregated_byStudyDate.nunique().mean()) 
print("Average Nr of test per day (considering total study duration): ", df_Radiography_aggregated_byStudyDate.nunique().sum()/delta.days)
print("---------------------------------------------------")
df_Radiography_aggregated_byStudyDate_PatientID = df_Radiography.groupby(['StudyDate','PatientID'])['Segment']
print("Max. Nr of test per patient/day: ", df_Radiography_aggregated_byStudyDate_PatientID.nunique().max()) 
print("Min. Nr of test per patient/day: ", df_Radiography_aggregated_byStudyDate_PatientID.nunique().min()) 
print("Average Nr of test per patient/day: ", df_Radiography_aggregated_byStudyDate_PatientID.nunique().mean()) 
print("---------------------------------------------------")
df_Radiography_aggregations_StudyDate = df_Radiography.groupby("PatientID")["StudyDate"].agg(StudyDate_inicial = 'min', StudyDate_final ='max', Diff_date = lambda x: ((max(x) - min(x)).days))
print("Max. patient stay (days): ", df_Radiography_aggregations_StudyDate['Diff_date'].max())
print("Min. patient stay (days): ", df_Radiography_aggregations_StudyDate['Diff_date'].min())
print("Average patient stay (days): ", df_Radiography_aggregations_StudyDate['Diff_date'].mean())
print("---------------------------------------------------")
df_Radiography_aggregated_bySegment_BodyPart = df_Radiography.groupby(['Segment','BodyPartExamined'])['Segment'].agg('sum')
print("----------'BodyPartExamined' count-----------------")
df_Radiography_aggregated_byBodyPart = df_Radiography.groupby(['BodyPartExamined'])['Segment'].nunique()
print(df_Radiography_aggregated_byBodyPart)