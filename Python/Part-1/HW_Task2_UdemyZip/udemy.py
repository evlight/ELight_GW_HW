import os
import csv

web_starter = os.path.join("web_starter.csv")

title = []
price = []
subscribers = []
reviews = []
length = []

with open(web_starter.csv) as csvfile:
    csvreader = csv.reader(csvfile, delimiter=",")
    
    # loop through
    for row in csvreader:
        
        title.append(row[1])
        price.append(row[4])
        subscribers.append(row[5])
        reviews.append(row[6])
        length.append(row[9])


zipped_data = zip(title,price, subscribers, reviews, length) 

output_file = os.path.join("eLight_final_output.csv")

with open(output_file, "w", newline='') as datafile:
        writer = csv.writer(datafile)
        
        writer.writerow(["Title","Price","Subscribers","Reviews","Length"])
        writer.writerows(zipped_data)
