import os 
import sys
from pbcore.io.FastaIO import FastaReader
import numpy

motifs = sys.argv[1].split(",")
modpositions = map(int, sys.argv[2].split(","))
genome = sys.argv[3]
median_position_fn = sys.argv[4]

posDict = {}
offsetDict = {}
count = 0
offset = 0
offsetlist = []
offsetcontig = []
#posToContig = {}
motifDict = {}
posToMotif = {}
for entry in FastaReader(genome):
    if count != 0:
        offset += 10
    seq = entry.sequence
    for i in range(len(motifs)):
        motif = motifs[i]
        modposition = modpositions[i]
        m  = len(motif)
        motifstr = motif+str(modposition)
        for i in range(len(seq)-len(motif)):
            if seq[i:i+m] == motif:
            #print entry.name, i+(modposition-1), motif
                pos = i+(modposition-1)
            #posDict.setdefault(entry.name, {})[pos]
                posDict[offset+pos] = 1
                posToContig = motifDict.setdefault(motifstr, {})
                posToContig[offset+pos] = entry.name
                posToMotif[offset+pos] = motifstr
    offsetDict[entry.name] = offset
    offset += len(entry.sequence)
    offsetlist.append(offset)
    offsetcontig.append(entry.name)
    count += 1


# open median position and extract ipds
#contigIpds = {}
motifIpds = {}
with open (median_position_fn) as f:
    for l in f:
        ll = l.strip().split()
        if len(ll) < 3:
            break
        pos, ipd, strand = ll
        if strand == "0": # quick hack we're ignoring reverse strand
            continue
        pos = int(pos)
        ipd = float(ipd)
        if pos in posDict:
            motif = posToMotif[pos]
            contigIpds = motifIpds.setdefault(motif, {})
            posToContig = motifDict[motif]
            contigIpds.setdefault(posToContig[pos], []).append(ipd)

# print mean 

# TBD print out full dataset in a table
motifkeys = motifIpds.keys()
motifkeys.sort()
for motif in motifkeys:
    contigIpds = motifIpds[motif]
    for contig, values in contigIpds.items():
        print >>sys.stderr, motif, contig, numpy.median(values), numpy.mean(values)
        for val in values:
            print contig, val



