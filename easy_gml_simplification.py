import os 
import sys
import networkx as nx
import matplotlib.pyplot as plt
from collections import Counter
gmlfn = sys.argv[1]
strain=gmlfn.split('.')[0]
print strain

G = nx.read_gml(gmlfn) # original graph

nodes = G.nodes()

smallG = G.copy()
utgDict = Counter()
utgG = nx.DiGraph() # unitig graph
for node in nodes:
    utgDict[G.node[node]["unitig"]] += 1
    p = G.predecessors(node)
    s = G.successors(node)
    '''
    if len(p) == 1 and len(s) == 1:
        if (len(G.successors(p[0])) == 1 and len(G.predecessors(s[0])) == 1):            
            p = smallG.predecessors(node)
            s = smallG.successors(node)
            smallG.add_edge(p[0], s[0])
            smallG.remove_node(node)
        else:
            print G.successors(p[0]), G.predecessors(s[0])
    '''
    n_utg = G.node[node]["unitig"]
    if len(s) >= 1: 
        s_tigs = set()
        for succ in s:
            s_utg = G.node[succ]["unitig"] 
            s_tigs.add(s_utg)
            if s_utg != n_utg:
                #print s_utg, n_utg
                utgG.add_edge(n_utg, s_utg)
        if len(s_tigs) > 1 and len(p) == 1: # check for branches internal to unitig
            pass
    if len(p) >= 1: 
        p_tigs = set()
        for pred in p:
            p_tigs.add(pred)
            p_utg = G.node[pred]["unitig"] 
            if p_utg != n_utg:
                #print p_utg, n_utg
                utgG.add_edge(p_utg, n_utg)
    if len(s) == 0 and len(p) == 0:
        utgG.add_node(n_utg, color="#FF0000") #red (singleton)
 
for utg in utgDict:
    if utg in utgG.nodes():
        if not "color" in utgG.node[utg]:
            utgG.node[utg]["color"] = "#FFFF00" #yellow (branching)
    else:
        utgG.add_node(utg, color="#0000FF")  # blue (likely circular or line)

nx.draw_graphviz(utgG, with_labels=True, node_color=map(lambda x: x[1]['color'], utgG.nodes(data=True)))
plt.savefig("%s.png" % strain)
nx.write_gml(utgG, "%s.gml" % strain)
print utgDict
