from pbtools.kineticsTools.ipdModel import IpdModel
from pbcore.io.FastaIO import FastaReader

ref      = "/hpc/users/beaulj01/projects/data_repo/refs/HP_J99_HGAP2.fasta"
for entry in FastaReader(ref):
ref_size = len(entry.sequence)
# Only takes the first contig!
break

def create_fastaRecord( fasta ):
"""
Generate a barebones reference entry that this kinetics code needs:
(1) contig.sequence
(2) contig.id
"""
class Contig:
def __init__( self, entry ):
self.id       = entry.name
self.sequence = entry.sequence

contigs = []
for entry in FastaReader(fasta):
contig = Contig(entry)
contigs.append(contig)
break
return contigs

"""
Use the surrounding sequence context of the reference positions to predict
IPD values to be used as the control.


# FIXME!!!!!!!!
******* This will initially only support single contig references. *******
"""
contigs         = create_fastaRecord( ref )
LUTh5 = "/home/beaulj01/ecoli_K12_validation_25oct13/nat_vs_wga/insilico_comparison/updating_LUT/kineticsTools/src/pbtools/kineticsTools/kineticLut.h5"
model           = IpdModel( fastaRecords=contigs, modelFile=LUTh5 )
################
# This is where it needs some updates/love. Specifically lines 395-410 in the pbtools.kineticsTools.ipdModel
# file.
################

ref_contig_id   = model.refDict.keys()[0]
meanIpdFunc     = model.predictIpdFunc( refId=ref_contig_id )
cognateBaseFunc = model.cognateBaseFunc(model.refDict.keys()[0])

fn            = "%s.pred_ipds" % ref
f             = open(fn, "w")
ref_pred_IPDs = {0:{}, 1:{}}
for strand in ref_pred_IPDs.keys():
for pos in range(ref_size):
ref_base = cognateBaseFunc(pos,strand)
ipd      = meanIpdFunc( pos, strand )
# Make sure we stay in the 0-based position space!
ref_pred_IPDs[strand][pos] = ipd
f.write("%s,%s,%.5f\n" % (strand, pos, ipd))
f.close()
