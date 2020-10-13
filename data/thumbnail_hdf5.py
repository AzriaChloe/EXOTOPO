#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 30 13:43:30 2020

@author: chloe
"""
import numpy as np
import h5py
import matplotlib.pyplot as plt
import os
from matplotlib import cm

direct='./S01'
filename=direct+'/'+'S01_A20_C00_H10_LAT5000_LON10000GRAYFLAT.hdf5'
   
# for file in os.listdir('./S01') : #relative altitude values
#     if (file[(len(file)-9) : len(file)-5] == 'TOPO') :
#         print(file)
#     else : #(RGB) values
#         ...


hf= h5py.File(filename, "r")
data=hf.get('data').value

lat_deg=hf.get('lat').value
long_deg=hf.get('long').value

lat_rad=np.radians(lat_deg[:,0])#5000 values -pi/2 -> +pi/2
long_rad=np.radians(long_deg[:,0])#10000 values pi ->2*pi && 0 -> 2*pi -deltalong
#deltalong=long_rad[0]-long_rad[9999]
#print(deltalong)


u=lat_rad
v=long_rad

R=5
#normalise
maxi=np.ndarray.max(data)
mini=np.ndarray.min(data)
topo=(data-mini)/(maxi-mini)

x = (R+ topo) * np.outer(np.cos(u), np.sin(v))
y = (R+ topo) * np.outer(np.sin(u), np.sin(v))
z = (R+ topo) * np.outer(np.ones(np.size(u)), np.cos(v))

#Plot the surface      
fig1 = plt.figure()
ax = fig1.add_subplot(111, projection='3d')
ax.plot_surface(x, y, z, color='b')
fig1.set_size_inches(15, 15)
plt.savefig('essai1.png')##
plt.show()









    
