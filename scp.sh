#!/bin/bash

#scp '-P 2222' -r empty_data/* data/metadata.csv azria@localhost:/home/azria/Documents/EXOTOPO/data/
#scp '-P 2222' q.rd azria@localhost:/home/azria/Documents/EXOTOPO

#scp '-P 2222' -r  data/metadata.csv azria@localhost:/var/gavo/inputs/EXOTOPO/data/
scp '-P 2222' q.rd azria@localhost:/var/gavo/inputs/EXOTOPO
