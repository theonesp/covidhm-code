import os
import pickle 

##############################################################################################################
##################################### DC3 Files Paths dictionary EXTRACT #####################################
##############################################################################################################
contador_DC3 = 0
dc3files_fullpath = [] #list

dicom_dir = 'D:/DICOM/COVID19_DICOM_STUDIES_19_04_2021/'

for filename in os.listdir(dicom_dir):
    
    relative_folder = filename
    folder = os.path.join(dicom_dir, relative_folder)+'/'

    aux_dict = {}
    for (root, dirs, files) in os.walk(folder):
        for name in files:
            aux_dict.setdefault(relative_folder, [])
            if name.endswith(".DC3"):
                             aux_dict[relative_folder].append(name)
    dc3files_fullpath.append(aux_dict)

# Write DC3 Files Paths dictionary into "geeky_file" to recover it when needed
try: 
    files_list_file = open(dicom_dir+'files_list.txt', 'wb')
    pickle.dump(dc3files_fullpath, files_list_file) 
    files_list_file.close() 
  
except: 
    print("Something went wrong writing DC3 Files Paths dictionary into file")