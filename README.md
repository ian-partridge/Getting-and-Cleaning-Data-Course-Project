---
title: "Getting and Cleaning Data Course Project"
author: "Author: Ian Partridge"
date: 'Date: 2022-06-24'
output: html_document
---

## Introduction

As part of the Coursera 'Getting and Cleaning Data Course' a project was 
required to be completed and then peer reviewed. This repo is the submission
requirements for the project. The 'Getting and Cleaning Data Course' was 
developed and maintained by John Hopkins University and project details can be
found at <https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project>
website.

## Project objectives

1. Create a tidy dataset from the relevant data in the UCI HAR Dataset.
2. Create a R script named 'run_analysis.R' which produces 'tidy_data.txt'.
3. Create a markdown README.md file (this file).
4. Create github repository with required files for submission

## Repository structure and files

```
This repository root
│   README.md (this file)
│   tidy_file.txt 
│   run_analysis.R    
│
└───UCI HAR Dataset
    │    acitivity_labels.txt    
    │    features.txt
    │    features_info.txt
    │    README.txt    
    │
    └───test
    │    │   subject_test.txt
    │    │   X_test.txt
    │    │   y_test.txt
    │    
    └───train
         │   subject_train.txt
         │   X_train.txt
         │   y_train.txt

```
## tidy_data.txt dataset

dataset of 180 observations of 68 variables

The tidy dataset was created from information in the UCI HAR Dataset. The collected 
data, within the UCI HAR Dataset, were accelerometers measurements from the 
Samsung Galaxy S smartphone. A full UCI HAR Dataset description is available at 
the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

The data for the project was held within text files in the linked zip file:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The files were extracted into the folder structure shown earlier for the UCI HAR Dataset.
The multiple text file data was then merged into one data set. For example the test and train
variables (columns) of the same name in the associated text files were combined 
Then the measurements 
on the mean and standard deviation for each of the measurement were extracted. The 
activity numerical identifier was replaced by a descriptive activity names. The columns (variables)
were given descriptive variable names, where descriptive works were separated by ".".
Then the tidy data set was created to give the average of each variable for each activity and each subject.

The file is a text file with a single space separated between columns. The columns
(variables) are defined in the following table. The combined test and training 
variables have been given decriptive names that equate to the UCI HAR Dataset
names. The naming followed the below rules:

* If the first character of name was a "t" this was replaced with "time."
* If the first character of name was a "f" this was replaced with "frequency."
* string "Acc" was replaced with ".accelerometer."
* string "Gyro" was replaced with ".gyroscope."
* All "-" replace with "."
* All "()"" removed

For example,

UCI HAR variable of "tBodyAcc-mean()-X"was given the name of time.body.accelerometer.mean.x


|Variable| Description| Type|
|:-----------|:--------------------------------------------------|:------|
|volunteer.id|integer ranging from 1 to 30 identifying the volunteer|int    |
|activity|type of activity conducted when measurements where taken. 6 different types WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING|char|
|time.body.accelerometer.mean.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|               
|time.body.accelerometer.mean.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|              
|time.body.accelerometer.mean.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|               
|time.body.accelerometer.std.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|               
|time.body.accelerometer.std.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|               
|time.body.accelerometer.std.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|               
|time.gravity.accelerometer.mean.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|           
|time.gravity.accelerometer.mean.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|           
|time.gravity.accelerometer.mean.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|           
|time.gravity.accelerometer.std.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|            
|time.gravity.accelerometer.std.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|            
|time.gravity.accelerometer.std.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|            
|time.body.accelerometer.jerk.mean.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|         
|time.body.accelerometer.jerk.mean.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|         
|time.body.accelerometer.jerk.mean.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|        
|time.body.accelerometer.jerk.std.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|          
|time.body.accelerometer.jerk.std.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|          
|time.body.accelerometer.jerk.std.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|          
|time.body.gyroscope.mean.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|                  
|time.body.gyroscope.mean.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|                  
|time.body.gyroscope.mean.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|                 
|time.body.gyroscope.std.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|                   
|time.body.gyroscope.std.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|                   
|time.body.gyroscope.std.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|                   
|time.body.gyroscope.jerk.mean.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|             
|time.body.gyroscope.jerk.mean.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|            
|time.body.gyroscope.jerk.mean.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|             
|time.body.gyroscope.jerk.std.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|              
|time.body.gyroscope.jerk.std.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|
|time.body.gyroscope.jerk.std.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|              
|time.body.accelerometer.mag.mean|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|             
|time.body.accelerometer.mag.std|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|             
|time.gravity.accelerometer.mag.mean|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|         
|time.gravity.accelerometer.mag.std|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|          
|time.body.accelerometer.jerkmag.mean|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|        
|time.body.accelerometer.jerkmag.std|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|         
|time.body.gyroscope.mag.mean|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|                
|time.body.gyroscope.mag.std|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|                 
|time.body.gyroscope.jerkmag.mean|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|            
|time.body.gyroscope.jerkmag.std|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|             
|frequency.body.accelerometer.mean.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|         
|frequency.body.accelerometer.mean.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|         
|frequency.body.accelerometer.mean.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|         
|frequency.body.accelerometer.std.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|         
|frequency.body.accelerometer.std.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|          
|frequency.body.accelerometer.std.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|         
|frequency.body.accelerometer.jerk.mean.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|    
|frequency.body.accelerometer.jerk.mean.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|    
|frequency.body.accelerometer.jerk.mean.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|    
|frequency.body.accelerometer.jerk.std.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|     
|frequency.body.accelerometer.jerk.std.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|     
|frequency.body.accelerometer.jerk.std.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|    
|frequency.body.gyroscope.mean.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|             
|frequency.body.gyroscope.mean.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|             
|frequency.body.gyroscope.mean.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|             
|frequency.body.gyroscope.std.x|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|              
|frequency.body.gyroscope.std.y|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|             
|frequency.body.gyroscope.std.z|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|              
|frequency.body.accelerometer.mag.mean|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|        
|frequency.body.accelerometer.mag.std|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|        
|frequency.bodybody.accelerometer.jerkmag.mean|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|
|frequency.bodybody.accelerometer.jerkmag.std|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|
|frequency.bodybody.gyroscope.mag.mean|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|       
|frequency.bodybody.gyroscope.mag.std|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|        
|frequency.bodybody.gyroscope.jerkmag.mean|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|   
|frequency.bodybody.gyroscope.jerkmag.std|mean for the volunteer.id and activity for the combined in the UCI HAR Dataset| numeric|
