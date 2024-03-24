import os
import time
import subprocess

cnt = 0

def error_message(folder):
    global cnt
    message = {}
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
                    #print(version)
                    #print(e.stderr)
                    #print('=====')
                    if version not in message:
                        message[version] = [e.stderr.decode('utf-8')]
                    else:
                        message[version].append(e.stderr.decode('utf-8'))
    return message
        

def traverse_sol_files(folder):
    sol_files = []
    for root, dirs, files in os.walk(folder):
        for file in files:
            if file == 'solc-static-linux':
                sol_files.append(os.path.join(root, file))
    return sol_files

# Specify the path of the benchmark
folder_path = "bugs"

err_message = error_message(folder_path)
try:
    errm = subprocess.run(['bugs/0.4.20/solc-static-linux', 'queue/id:007543,src:000002,op:havoc,rep:32,+cov'], check=True, capture_output=True)
except subprocess.CalledProcessError as e:
    x = [e.stderr.decode('utf-8')]
    for m in err_message['0.4.20']:
        print(m)
        print(m == x[0])
#time.sleep(10)
print(f'There are {cnt} error messages')
# Traverse the folder and get all Solidity files
solidity_files = traverse_sol_files(folder_path)

# Print the paths of all Solidity files
#for file_path in solidity_files:
#    print(file_path)

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
f = open('bugs2.txt', 'w')
def run_program(solpath, program_path):
    try:
        subprocess.run([solpath, program_path], check=True, capture_output=True, timeout = 3)
    except subprocess.TimeoutExpired:
        f.write(solpath + " " + program_path + " > hang\n")
    except subprocess.CalledProcessError as e:
        try:
            error = e.stderr.decode('utf-8')
            version = solpath.split('/')[1]
            cnt = 0
            for m in err_message[version]:
                text = [e.stderr.decode('utf-8')]
                name = version + str(cnt)
                if name not in s and  m == text[0]:
                    f.write(solpath + " " + program_path + " " + str(cnt) + '\n')
                    s.add(name)
                cnt = cnt + 1
        except:
            pass

for sol in solidity_files:
    for code in all_files:
        #print(sol, code)
        run_program(sol, code)
f.close()
