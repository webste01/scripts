#!/usr/bin/env python

import pysam
import HTSeq as ht
import math
import os, sys, getopt
from itertools import groupby, count
from operator import itemgetter
import numpy as np
import pandas as pd
import scipy as sp
from scipy import stats

# init main
def main(argv):
    hairs_file = ''
    hapcut_file = ''
    bam_file = ''
    out_file = ''
    help = 'fake_hairs.py -r <chrom:start-end> -i <input.bam> -v <methyl.vcf> -o <output.hairs>'
    try:
        opts, args = getopt.getopt(argv,"r:i:v:o:",["region=", "input=", 'variant=', "output="])
    except getopt.GetoptError:
        print help
        sys.exit(2)
    for opt, arg in opts:
        if opt == '--help':
            print help
            sys.exit()
        elif opt in ("-r", "--region"):
		region = arg
		chrom = arg.split(':')[0]
		istart = int(arg.split(':')[1].split('-')[0])
		iend   = int(arg.split(':')[1].split('-')[1])
        elif opt in ("-i", "--input"):
            bam_file = arg
        elif opt in ("-o", "--output"):
            out_file = arg
	elif opt in ("-v", "--variant"):
            var_file = arg
        else:
            assert False, "unhandled option"
            
    out_fp = open(out_file, 'w')
    bam_fp = pysam.AlignmentFile(bam_file, "rb")
    mergedvcf = pd.read_csv(var_file, header=None, sep='\t')

    #with open (var_file) as f:
    #    for l in f:
    #        mergedvcf 
    sys.stderr.write("Sucessful init: fake_hairs.py, starting...\n")
    sys.stderr.flush()
    fakeHairs(bam_fp, mergedvcf, out_fp, chrom, istart, iend)
    out_fp.close()
    bam_fp.close()

def convertRlistToHairLine (qname, rlist):
    currgtlist = [str(rlist[0][1])]
    quals = [chr(int(rlist[0][2])+33)]
    currblock = rlist[0][0]
    lastvarid = rlist[0][0]
    hairblocks = []
    for i in range (1, len(rlist)):
        varid, gt, qual = rlist[i]
        if varid != lastvarid+1:
            hairblocks.append("%s %s" %(str(currblock), "".join(currgtlist)))
            currgtlist = []
            currblock = varid
        lastvarid = varid
        currgtlist.append(str(gt))
        quals.append(chr(int(qual)+33))
    hairblocks.append("%s %s" %(str(currblock), "".join(currgtlist)))
    return "%i %s %s %s" %(len(hairblocks), qname, " ".join(hairblocks), "".join(map(str, quals)))
        
        

def fakeHairs(bam_fp, mergedvcf, out_new_hair, chrom, istart, iend):
    read_val_dict = {}
    for read in bam_fp.fetch(chrom, istart, iend):
        start, end = read.reference_start, read.reference_end
        read_variants = mergedvcf[(mergedvcf[1] >= start) & (mergedvcf[1] <= end) & (mergedvcf[0] == chrom)]
        if len(read_variants) < 2:
            continue
        #print read.query_name
        posDict = {}
        for varidraw, varline in read_variants.iterrows():
            varid = varidraw + 1 # gets correct line numbers
            pos = int(varline[1])-1
            ref = varline[3]
            alt = varline[4]
            #print pos, ref, alt
            posDict[pos] = (varid, ref, alt)
        rlist = []
        for ap in read.get_aligned_pairs():
            if ap[0] == None or ap[1] == None:
                pass
            elif ap[1] in posDict:
                varid, ref, alt = posDict[ap[1]]
                qbase = read.query_sequence[ap[0]]
                qqual = read.query_qualities[ap[0]]
                #print varid, qbase, qqual
                if qbase == ref:
                    rlist.append((varid, 0, qqual))
                elif qbase == alt:
                    rlist.append((varid, 1, qqual))
        if len(rlist) > 1:
            rlist.sort(lambda x,y: cmp(x[0], y[0]))
            #print read.query_name, rlist
            print convertRlistToHairLine (read.query_name, rlist)
                
        '''
        for pileupcolumn in bam_fp.pileup(chrom, pos, pos+1):
            for pileupread in pileupcolumn.pileups:
                if not pileupread.is_del and not pileupread.is_refskip:
                    # query position is None if is_del or is_refskip is set.
                    qname = pileupread.alignment.query_name,
                    qbase = pileupread.alignment.query_sequence[pileupread.query_position]
                    qqual = pileupread.alignment.query_qualities[pileupread.query_position]

                    if qbase == ref:
                        read_val_dict.setdefault(qname, []).append((varid, 0, qqual))
                    elif qbase == alt:
                        read_val_dict.setdefault(qname, []).append((varid, 1, qqual))
        '''
    #print read_val_dict
# run the program if called from the command line
if __name__ == "__main__":
   main(sys.argv[1:])


