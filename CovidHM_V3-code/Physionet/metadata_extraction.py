import os
import pydicom
import pandas as pd
from tqdm import tqdm
from multiprocessing import Pool, cpu_count
from glob import glob
import settings as settings

df = pd.DataFrame(columns=['Patient ID', 'SOP Instance UID', 'Code Value', 'Code Meaning', 'Series Description', 'Study Description', 'Body Part Examined', 'Study Date'])
# Function to read and process a single DICOM file
def process_dicom_file(filepath):
    try:
        # Read the DICOM file
        ds = pydicom.dcmread(filepath)
        data = {
            'Patient ID': ds.get('PatientID', 'Unknown'),
            'Segment': os.path.basename(os.path.dirname(filepath)),
            'SOP Instance UID': ds.get('SOPInstanceUID', 'Unknown'),
            'Study Date': ds.get('StudyDate', 'Unknown'),
            'Study Time': ds.get('StudyTime', 'Unknown'),
            'Modality':  ds.get('Modality', 'Unknown'),
            'Body Part Examined': ds.get('BodyPartExamined', 'Unknown'),
            'View Position':  ds.get('ViewPosition', 'Unknown'),
            'Patient Position': ds.get('PatientPosition', 'Unknown'),
            'Study Description': ds.get('StudyDescription', 'Unknown'),
            'Spatial Resolution': ds.get('SpatialResolution', 'Unknown')
        }
        if 'ProcedureCodeSequence' in ds:
            pcs = ds['ProcedureCodeSequence'][0] if ds['ProcedureCodeSequence'] else {'CodeValue': 'Unknown', 'CodeMeaning': 'Unknown'}
            data['Code Value'] = pcs.get('CodeValue', 'Unknown')
            data['Code Meaning'] = pcs.get('CodeMeaning', 'Unknown')
        return data

    except Exception as e:
        print(f"Error processing file {filepath}: {str(e)}")
        return None

def collect_file_paths(dicom_path):
    return glob(os.path.join(dicom_path, '**', '*.DC3'), recursive=True)

def init_worker():
    # Ignore the SIGINT to allow the pool to handle KeyboardInterrupt correctly
    import signal
    signal.signal(signal.SIGINT, signal.SIG_IGN)

def process_files_in_pool(filepaths):
    pool_size = cpu_count()
    with Pool(pool_size, initializer=init_worker) as pool:
        results = list(tqdm(pool.imap(process_dicom_file, filepaths), total=len(filepaths), desc="Processing DICOM files"))
    return [result for result in results if result is not None]  # Filter out None results

if __name__ == "__main__":
    dicom_path = settings.dicom_path
    filepaths = collect_file_paths(dicom_path)
    results = process_files_in_pool(filepaths)

    # Split results into data and errors
    dicom_data = [result for result in results if 'error' not in result]
    processing_errors = [result for result in results if 'error' in result]

    # Create DataFrame and save to CSV
    df = pd.DataFrame(dicom_data)
    df.to_csv(os.path.join(dicom_path, 'dicom_data.csv'), index=False)
    pd.DataFrame(processing_errors).to_csv(os.path.join(dicom_path, 'processing_errors.csv'), index=False)

    # Print summary
    print(f"Total files processed: {len(dicom_data) + len(processing_errors)}")
    print(f"Successful reads: {len(dicom_data)}")
    print(f"Failed reads: {len(processing_errors)}")