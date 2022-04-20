import pydicom
import pandas as pd
import pickle 
from datetime import datetime

dicom_dir = 'D:/DICOM/COVID19_DICOM_STUDIES_19_04_2021/'

###########################################################################################################
##################################### DC3 Files Paths dictionary LOAD #####################################
###########################################################################################################
file_to_read = open(dicom_dir+'/files_list.txt', "rb")
loaded_dictionary = pickle.load(file_to_read)

###########################################################################################################
########################################## DICOM DATA extraction ##########################################
###########################################################################################################
dicom_interest = pd.DataFrame(columns=['PatientID','Segment','SOPInstanceUID', 'StudyDate','StudyTime','Modality','BodyPartExamined','ViewPosition', 'PatientPosition', 'SpatialResolution', 'StudyDescription'])

total_counter = 0

for i in range(0, len(loaded_dictionary)):

    for k, v in loaded_dictionary[i].items():

            for j in range(0, len(v)):

                path_full = dicom_dir + k + '/' + v[j]
                total_counter = total_counter+1
                
                try:
                    ds = pydicom.read_file(path_full)
                    
                    # To check for the existence of a particular tag before using it, use the in keyword: ---> "PatientsName" in ds 
                    aux_dict = {'PatientID':ds.PatientID,'Segment':k,'SOPInstanceUID':ds.SOPInstanceUID,'StudyDate':ds.StudyDate,'StudyTime':ds.StudyTime,'Modality':ds.Modality}
                    if "BodyPartExamined" in ds:
                        aux_dict['BodyPartExamined'] = ds.BodyPartExamined
                    if "ViewPosition" in ds:
                        aux_dict['ViewPosition'] = ds.ViewPosition
                    if "PatientPosition" in ds:
                        aux_dict['PatientPosition'] = ds.PatientPosition
                    if "SpatialResolution" in ds:
                        aux_dict['SpatialResolution'] = ds.SpatialResolution 
                    if "StudyDescription" in ds:
                        aux_dict['StudyDescription'] = ds.StudyDescription 
                
                    dicom_interest = dicom_interest.append(aux_dict,ignore_index=True)

                    if total_counter % 100000 == 0: # Clear dataframe every 100000 samples and save content into CSV file
                        now = datetime.now()
                        date_time = now.strftime("%m-%d-%Y_%H-%M-%S")
                        file_aux = 'C:/Users/IDJVF2/Desktop/DICOM/final/data_'+date_time+'.txt'

                        with open(file_aux, 'a') as f:
                            dicom_interest.to_csv(f, header=None, index=None, sep=",", na_rep="", mode='a', line_terminator='\n')
                            f.close()

                        dicom_interest = dicom_interest.iloc[0:0]

                    else: # Last batch of data to save into CSV file
                        now = datetime.now()
                        date_time = now.strftime("%m-%d-%Y_%H-%M-%S")
                        file_aux = 'C:/Users/IDJVF2/Desktop/DICOM/final/last_data_'+date_time+'.txt'

                        with open(file_aux, 'a') as f:
                            dicom_interest.to_csv(f, header=None, index=None, sep=",", na_rep="", mode='a', line_terminator='\n')
                            f.close()

                except Exception as e:
                    print(path_full)
                    print("Error:" + str(e))
                    pass

######################################################################################################
################################ DICOM data preliminar descriptive ###################################
######################################################################################################
print(dicom_interest.groupby('Modality').PatientID.nunique())
print(dicom_interest.shape)