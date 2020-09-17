#!/home/chloe/anaconda3/envs/env_csv_generator
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 16 12:15:12 2020

@author: chloe
"""
import os


def addHeader (csvfile):
    csvfile.write('filepath,random_seed,alpha,c1,H,Latitude_Sampling,Longitude_Sampling,type\n')
    
def CSVFiller (filename, csvfile,directory):
    csvfile.write(directory +'/'+filename)#filepath
    csvfile.write(',' )    
    csvfile.write(filename.split('_')[0])
    csvfile.write(',') 
    A=float((filename.split('_')[1]).split('A')[1])/10.    
    csvfile.write(str(A)) #alpha
    csvfile.write(',')
    C=float((filename.split('_')[2]).split('C')[1])/100.
    csvfile.write(str(C)) #C1 
    csvfile.write(',')
    H=float((filename.split('_')[3]).split('H')[1])/10.
    csvfile.write(str(H)) #H
    csvfile.write(',')
    csvfile.write((filename.split('_')[4]).split('LAT')[1])
    csvfile.write(',')
    csvfile.write(((filename.split('_')[5]).split('LON')[1])[0:5])
    csvfile.write(',')
    if (filename[(len(filename)-9) : len(filename)-5] =='TOPO'):
         csvfile.write('TOPO')
    elif (filename[(len(filename)-9) : len(filename)-5] =='FLAT'):
         csvfile.write('COLOFLAT')
    elif (filename[(len(filename)-9) : len(filename)-5] =='SHAD'):
         csvfile.write('GRAYSHAD')
    else :
        print('erreur')
    
    csvfile.write('\n')
    
       
#for fichiers in dossier

csvfile=open('./../Ressource_descriptor/data/schema_donnees.csv','w')
addHeader(csvfile)

for dir in os.listdir('./datas'):
    directory="./datas/{0}".format(dir)    
    if os.path.isdir(directory):
        for file in os.listdir(directory) :  
            CSVFiller (file,csvfile,directory)
