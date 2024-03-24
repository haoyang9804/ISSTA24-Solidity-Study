import os
import time
import subprocess
import csv

cnt = 0

def error_message(folder):
    global cnt
    message = {}
    bugid = {}
    for version in os.listdir(folder):
        path = os.path.join(folder, version)
        solpath = os.path.join(path, 'solc-static-linux')
        for file in os.listdir(path):
            if file != 'solc-static-linux':
                program_path = os.path.join(path, file)
                try:
                    res = subprocess.run([solpath, program_path], check=True, capture_output=True)
                except subprocess.CalledProcessError as e:
                    cnt += 1
                    if version not in message:
                        message[version] = [e.stderr.decode('utf-8')]
                        bugid[version] = [file]
                    else:
                        message[version].append(e.stderr.decode('utf-8'))
                        bugid[version].append(file)
    return message, bugid
        

def traverse_sol_files(folder):
    sol_files = []
    for root, dirs, files in os.walk(folder):
        for file in files:
            if file == 'solc-static-linux':
                sol_files.append(os.path.join(root, file))
    return sol_files

# Specify the path of the benchmark
folder_path = "benchmark"

err_message, bugid = error_message(folder_path)

print(f'There are {cnt} error messages')

def analyze_csv():
    id2symptom_rootcause = {}
    with open('Solidity Compiler Bugs.csv', 'r') as file:
        # Create a CSV reader object
        reader = csv.reader(file)
    
        # Iterate over each row in the CSV file
        for row in reader:
            # Access the data in each column of the row
            id2symptom_rootcause[row[9]] = (row[2], row[3])
    return id2symptom_rootcause

id2symptom_rootcause = analyze_csv()

# Traverse the folder and get all Solidity files
solidity_files = traverse_sol_files(folder_path)

def traverse_files(folder):
    file_list = []
    for root, dirs, files in os.walk(folder):
        for file in files:
            file_path = os.path.join(root, file)
            file_list.append(file_path)
    return file_list

# Specify the folder path
folder_path = "queue"

# Traverse the folder and get all files
all_files = traverse_files(folder_path)

# Print the paths of all files
#for file_path in all_files:
#    print(file_path)
s = set()
f = open('bugs.txt', 'w')
def run_program(solpath, program_path):
    try:
        subprocess.run([solpath, program_path], check=True, capture_output=True, timeout = 3)
    except subprocess.TimeoutExpired:
        # f.write(solpath + " " + program_path + " > hang\n")
        pass
    except subprocess.CalledProcessError as e:
        try:
            error = e.stderr.decode('utf-8')
            version = solpath.split('/')[1]
            cnt = 0
            for m in err_message[version]:
                text = [e.stderr.decode('utf-8')]
                name = version + str(cnt)
                if name not in s and  m == text[0]:
                    f.write(solpath + " " + program_path + " " + bugid[version][cnt] + " " + str(id2symptom_rootcause[bugid[version][cnt][:-4]]) + '\n')
                    s.add(name)
                cnt = cnt + 1
        except Exception as e:
            print('>> error in writing in to bugs.txt for a crash: ', e)

for sol in solidity_files:
    for code in all_files:
        run_program(sol, code)
f.close()
