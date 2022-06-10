## To run this file, installation of "requests" and python3 is required
## The format in which the command line arguments are is URL1, URL 2, Filename
## Ex,      filepath\.. py example.py http:URL1 http:URL2 example(csvfile) 

import requests	
import time
import sys
import csv

#CONSTANTS
DELAY = 1
FEILD_NAME = 'value'
HEAD_1 = "timestamp"
HEAD_2 = "Power"
HEAD_3 = "Current"

#Argument validation and assigning URL
if (sys.argv[1]).startswith('http'):
    URL = (sys.argv[1])
else:
    print("Please add URL for argument 1")

if (sys.argv[2]).startswith('http'):
    URL2 = (sys.argv[2])
else:
    print("Please add URL for argument 2")

#Get request 
sess = requests.session()

#Writing and saving data into a csv
if len(sys.argv) == 3:
    f = open('default.csv','w ')   
else:
    f = open(sys.argv[3] + ".csv",'a')
 
writer = csv.DictWriter(f, fieldnames=[HEAD_1, HEAD_2, HEAD_3])
writer.writeheader()

#Loop to get data from URL and print into terminal and csv 
while True:

    req = sess.get(URL)
    json_data = requests.get(URL).json()
    result = json_data[FEILD_NAME]
    
    req = sess.get(URL2)
    json_data = requests.get(URL2).json()
    result2 = json_data[FEILD_NAME]
    
    now = int( time.time() )
    print(now,".....", result, result2)

    time.sleep(DELAY)
    
    f.writelines(str(now) +"," + str(result) + "," + str(result2)) 
    f.write('\n')

