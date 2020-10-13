#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct  6 09:40:15 2020

@author: chloe
"""
import os
import h5py
import matplotlib.pyplot as plt
from PIL import Image
import numpy as np

direct='./S06'
i=0
for file in os.listdir(direct) : 
    if (file[(len(file)-9) : len(file)-5] != 'TOPO') :
        if (file[-5:]=='.hdf5'):
            print(file)
            #os.remove(direct+'/'+file)
            i+=1
            
j=0

for file in os.listdir(direct) : 
    if (file[(len(file)-9) : len(file)-5] != 'TOPO') :
        if (file[-5:]=='.hdf5'):
            hf=h5py.File(direct+'/'+file,"r")
            data=hf.get('data').value
            imgpil = Image.fromarray(data) # Transformation du tableau en image PIL
            imgpil.save(direct+'/'+file[:-5]+'.png')
            j+=1
            print(j,'/' , i ,'  '+ file)    
            os.remove(direct+'/'+file)
print('conversion terminée')

# =========Verifier que l'on peut récuperer la même matrice depuis le png======
# filename_surf='./S01/S01_A20_C00_H04_LAT5000_LON10000COLOSHAD.hdf5'
# hf=h5py.File(filename_surf,"r")
# data_surf=hf.get('data').value
# imgpil = Image.open("./S01/S01_A20_C00_H04_LAT5000_LON10000COLOSHAD.png")
# img = np.array(imgpil)
# print (np.array_equal(img,data_surf))
# =============================================================================
