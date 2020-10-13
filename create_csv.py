#!/home/chloe/anaconda3/envs/env_csv_generator
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 16 12:15:12 2020

@author: chloe
"""
import os


def addHeader (csvfile):
    csvfile.write('filename,filepath,random_seed,alpha,c1,H,Latitude_Sampling,Longitude_Sampling,type\n')
    
def CSVFiller (filename, csvfile,directory):
    S=filename.split('_')[0]
    A=str(float((filename.split('_')[1]).split('A')[1])/10.)
    C=str(float((filename.split('_')[2]).split('C')[1])/100.)
    H=str(float((filename.split('_')[3]).split('H')[1])/10.)
    if (filename[(len(filename)-9) : len(filename)-5] =='TOPO'):
         T=filename[(len(filename)-9) : len(filename)-5]
    else :
         T=filename[(len(filename)-12) : len(filename)-4]
        
    csvfile.write(filename)
    csvfile.write(',' )        
    csvfile.write(directory[1:] +'/')#filepath
    csvfile.write(',' )    
    csvfile.write(S)
    csvfile.write(',')    
    csvfile.write(A) #alpha
    csvfile.write(',')
    csvfile.write(C) #C1 
    csvfile.write(',')
    csvfile.write(H) #H
    csvfile.write(',')
    csvfile.write((filename.split('_')[4]).split('LAT')[1])
    csvfile.write(',')
    csvfile.write(((filename.split('_')[5]).split('LON')[1])[0:5])
    csvfile.write(',')
    csvfile.write(T)
    csvfile.write('\n')
    
       


csvfile=open('./data/metadata.csv','w')
addHeader(csvfile)

for dir in os.listdir('./data'):
    #directory="./data/{0}".format(dir) 
    directory="./data/{0}".format(dir) 
    if os.path.isdir(directory):
        for file in os.listdir(directory) :  
            CSVFiller (file,csvfile,directory)
