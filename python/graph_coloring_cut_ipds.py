import networkx as nx
import matplotlib.pyplot as plt
import pbcore
from pbcore.io.FastaIO import FastaReader
import os 
import sys
import numpy as np
import scipy as sp
import scipy.stats as stats

gmlfn=sys.argv[1]
motif_ipd_fn = sys.argv[2]
out_tag = sys.argv[3]
fntag=".".join(sys.argv[1].split(".")[0:-1])

def buildContigMotifIpdDict (fn):
	contig2motif_ipds = {}
	with open (fn) as f:
		f.readline()
		for l in f:
			contig, ipd, motif = l.strip().split()
			contig = unicode("utg"+contig.split("_")[-1])
			ipd = float(ipd)
			contig2motif_ipds.setdefault(contig, {}).setdefault(motif, []).append(ipd)
	return contig2motif_ipds

# build matrix of p-values relating pairwise t-tests
def ttestMatrix (contigDict):
	motifDict = {}
	motifs = set()
	for contig in contigDict:
		for motif in contigDict[contig]:
			motifs.add(motif)
			motifDict.setdefault(motif, set()).add(contig)
	# the number of motifs we need correct by
	corr_factor  = len(motifs) 
	# build graph of probabilities
	probmatrix = np.ones((len(contigDict), len(contigDict)))
	contigs = contigDict.keys()
	for motif in motifDict:
		for i in range(len(contigs)):
			contigi = contigs[i]
			if not contigi in motifDict[motif]:
				continue
			contigi_ipds = contigDict[contigi][motif]
			for j in range(i+1,len(contigs)):
				contigj = contigs[j]
				if not contigj in motifDict[motif]:
					continue
				# do ttest
				contigj_ipds = contigDict[contigj][motif]
				tij, probij = sp.stats.ttest_ind(np.log(contigi_ipds), np.log(contigj_ipds), axis=0, equal_var=False)
				probij = probij/corr_factor
				probmatrix[i][j] *= probij
				probmatrix[j][i] *= probij
	return probmatrix, contigs
				
def minimalColoring (probMatrix, contigs, cutoff = 0.001):
	# create a graph based on the probMatrix
	probG = nx.Graph()
	for i in range (len(contigs)):
		contigi = contigs[i]
		probG.add_node(contigi)
		for j in range (i+1, len(contigs)):
			contigj = contigs[j]
			if probMatrix[i][j] > cutoff:
				probG.add_edge(contigi, contigj)
	components = nx.connected_components(probG)
	return components

def disallowedEdges (probMatrix, contigs, cutoff = 0.001):
	badGraph = nx.Graph()
	for i in range(len(contigs)):
		contigi = contigs[i]
		for j in range (i+1, len(contigs)):
			contigj = contigs[j]
			if probMatrix[i][j] <= cutoff:
				badGraph.add_edge(contigi, contigj)
	return badGraph
			
# get mapping of motifs to contigs with list of ipds			
contig2motif_ipds = buildContigMotifIpdDict (motif_ipd_fn)
		
# generate probability that two contigs are from th same distribution
probMatrix, contigs = ttestMatrix (contig2motif_ipds)
print contigs
print probMatrix

# create a dictionary of disallowed edges
badEdgeGraph = disallowedEdges (probMatrix, contigs)

# generate a minimal coloring based on our matrix
components = minimalColoring (probMatrix, contigs)
test_comp= [len(c) for c in sorted(components, key=len, reverse=True)]
print test_comp
print len(test_comp)

utgColorIndex = {}
for i in range(len(test_comp)):
	#for utg in components[i]:
		#utgColorIndex[utg] = i
	utgColorIndex[utg] = i
print utgColorIndex


# !!!change this!!!!
colors = ["#0000FF", "#FF0000", "#00FF00", "#0FF00"]

G= nx.read_gml(gmlfn)
pos=nx.spring_layout(G)
test_dict={}

for node_number in range(0,nx.number_of_nodes(G)):
	#create dictionary of nodeID and unitig
	test_dict[node_number]=G.node[node_number]['unitig'] #u'utg1'
#get all unique unitig IDs from the dictionary of nodeID:unitigs
unique_unitigs=[]
s=set(test_dict.values())
for x in s:
	unique_unitigs.append(x)
#create list of  nodes for each unique unitig
utglists = {}
for contig in contig2motif_ipds:
	utglists[contig] = []
###NEED TO PARSE u'utg3' to utg3

Gcol=nx.MultiDiGraph()
for nodeid,unitig in test_dict.items():
	print str(unitig)
	if unitig in utglists:
		utglist = utglists[unitig]
		utglist.append(nodeid)
		color = colors[utgColorIndex[unitig]]
		Gcol.add_node(nodeid, col=color, unitig=unitig)
	else:
		# otherwise its black
		Gcol.add_node(nodeid, col="#000000", unitig=unitig)

for node in Gcol.nodes():
	pcol=G.predecessors(node)
	scol=G.successors(node)
	for pred in pcol:
		color1=Gcol.node[pred]['col']
		color2=Gcol.node[node]['col']
		if color1==color2:
			Gcol.add_edge(pred,node,color=color2)
		else:
                        Gcol.add_edge(pred,node,color=color1)
	for successor in scol:
		color1=Gcol.node[successor]['col']
                color2=Gcol.node[node]['col']
		if color1==color2:
			Gcol.add_edge(node,successor,color=color2)
		else:
			Gcol.add_edge(node,successor,color=color1)
'''
Gc1=nx.subgraph(Gcol,list0)
Gc1=nx.subgraph(Gcol,list1)
Gc2=nx.subgraph(Gcol,list2)
Gc3=nx.subgraph(Gcol,list3)
Gc4=nx.subgraph(Gcol,list4)
'''



#plt.show()
plt.figure(1,figsize=(15,15))

#nx.draw_graphviz(Gc1,node_color="#FF0000",edge_color="#FF0000",node_size=10,font_size=4,linewidths=0.01)
nx.draw_graphviz(Gcol,node_color=map(lambda x: x[1]['col'],Gcol.nodes(data=True)),edge_color=map(lambda x: x[2]['color'],Gcol.edges(data=True)),node_size=10,font_size=0,linewidths=0.01, labels=None)
plt.savefig(out_tag + "_cut.png")
plt.clf()

# last gerate the graph one color at a time
for component in components:
	component_nodes = filter(lambda x: Gcol.node[x]['unitig'] in component , Gcol.nodes())
	print component_nodes
	plt.figure(1,figsize=(15,15))
	subGcol = Gcol.subgraph(component_nodes)
	nx.draw_graphviz(subGcol, node_color=map(lambda x: x[1]['col'],subGcol.nodes(data=True)),edge_color=map(lambda x: x[2]['color'],subGcol.edges(data=True)),node_size=10,font_size=0,linewidths=0.01, labels=None)
	#nx.draw_graphviz(subGcol)
	plt.savefig(out_tag + "_" + "_".join(map(str, component)) + "_cut.png")
	plt.clf()
	
	
