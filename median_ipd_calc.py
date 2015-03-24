#Get the mean IPD value
import os
import sys
from collections import defaultdict
import re
import numpy as np
nat=open(sys.argv[1],'r')
name=sys.argv[1]
fs=defaultdict(list)
ns=defaultdict(list)
for line in nat:
	line=line.split()
	pos=line[0]
	ipd=float(line[1])
	strand=line[2]
	if strand == "1":
		fs[pos].append(float(ipd))
	else:
		ns[pos].append(float(ipd))
fn="%s.reduced" % name
f= open(fn,"w")
median_fs=defaultdict(list)
median_ns=defaultdict(list)
for pos in fs.keys():
	tmp = [ float(ipd) for ipd in fs[pos] ]	
	median_tmp=np.median(tmp)
	median_fs[pos]=median_tmp
	strand=1
	f.write("%s %.5f %s\n" % (pos, median_tmp, strand))
for pos in ns.keys():
	tmp = [ float(ipd) for ipd in ns[pos] ]
	median_tmp=np.median(tmp)
	median_ns[pos]=median_tmp
        strand=0
        f.write("%s %.5f %s\n" % (pos, median_tmp, strand))
f.close()
