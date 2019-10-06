#!/usr/bin/env python
# coding: utf-8

# In[22]:


# -*- coding: UTF-8 -*-
"""PyBoss Homework Solution."""

# Import required packages
import csv
import os
from datetime import datetime


# In[26]:


# Files to load and output (Remember to change these)
employee_file_read = os.path.join("employee_data.csv")
employee_file_output = os.path.join("employee_data_reformatted.csv")


# In[27]:


# Dictionary of states with abbreviations
us_state_abbrev = {
    "Alabama": "AL",
    "Alaska": "AK",
    "Arizona": "AZ",
    "Arkansas": "AR",
    "California": "CA",
    "Colorado": "CO",
    "Connecticut": "CT",
    "Delaware": "DE",
    "Florida": "FL",
    "Georgia": "GA",
    "Hawaii": "HI",
    "Idaho": "ID",
    "Illinois": "IL",
    "Indiana": "IN",
    "Iowa": "IA",
    "Kansas": "KS",
    "Kentucky": "KY",
    "Louisiana": "LA",
    "Maine": "ME",
    "Maryland": "MD",
    "Massachusetts": "MA",
    "Michigan": "MI",
    "Minnesota": "MN",
    "Mississippi": "MS",
    "Missouri": "MO",
    "Montana": "MT",
    "Nebraska": "NE",
    "Nevada": "NV",
    "New Hampshire": "NH",
    "New Jersey": "NJ",
    "New Mexico": "NM",
    "New York": "NY",
    "North Carolina": "NC",
    "North Dakota": "ND",
    "Ohio": "OH",
    "Oklahoma": "OK",
    "Oregon": "OR",
    "Pennsylvania": "PA",
    "Rhode Island": "RI",
    "South Carolina": "SC",
    "South Dakota": "SD",
    "Tennessee": "TN",
    "Texas": "TX",
    "Utah": "UT",
    "Vermont": "VT",
    "Virginia": "VA",
    "Washington": "WA",
    "West Virginia": "WV",
    "Wisconsin": "WI",
    "Wyoming": "WY",
}


# In[36]:


# Placeholders for re-formatted contents
emp_ids = []
emp_first_names = []
emp_last_names = []
emp_dobs = []
emp_ssns = []
emp_states = []
# Read the csv and convert it into a list of dictionaries
with open(employee_file_read) as emp_data:
    reader = csv.reader(emp_data)

    header = next(reader)
    # Loop through each row, re-grab each field and store in a new list
    for row in reader:

        # Grab emp_ids and store it into a list
        emp_ids = emp_ids + [row[0]]

        # Grab names, split them, and store them in a temporary variable
        split_name = row[1].split(" ")

        # Then save first and last name in separate lists
        emp_first_names.append(split_name[0])
        emp_last_names.append(split_name[1])
        
        # Grab DOB and reformat it
        # Then store it into a list
        date=row[2]
        date=datetime.strptime(date,'%Y-%m-%d').date()
        emp_dobs.append(date.strftime('%m/%d/%Y'))
        

        # Grab SSN and reformat it
        ssn_split = row[3].split('-')
                
        # Then store it into a list
        emp_ssns.append(f"***-**-{ssn_split[2]}")

        # Grab the states and use the dictionary to find the replacement
        for key in us_state_abbrev: 
            if key == row [4]:
                emp_states.append(us_state_abbrev[key]) 

        # Then store the abbreviation into a list
        # YOUR CODE HERE

# Zip all of the new lists together
zipped_employee_data = zip(emp_ids , emp_first_names , emp_last_names , emp_dobs , emp_ssns , emp_states) 


# Write all of the election data to csv
with open(employee_file_output,"w",newline='') as datafile:
        writer = csv.writer(datafile)
        
        writer.writerow(["Emp Id","First Name","Lastname","DOB","SSN","State"])
        writer.writerows(zipped_employee_data)

