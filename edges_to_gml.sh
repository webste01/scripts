#python CA_best_edge_to_GML_ali.py data/celera-assembler.gkpStore data/celera-assembler.tigStore data/4-unitigger/best.edges output.gml 
#SCript to convert the best.edges files from the celera assembler into gml files using CA_best_edge_to_GML_ali.py
#Need to be on the login node
#Need to module load smrtpipe/2.2.0
bkhd_020668=/sc/orga/scratch/webste01/bkhd_020668/data
lb_020666=/sc/orga/scratch/webste01/lb_020666/data
mrsa_020042=/sc/orga/scratch/webste01/mrsa_020042/data
mrsa_020180=/sc/orga/scratch/webste01/mrsa_020180/data
steno_020676=/sc/orga/scratch/webste01/steno_020676/data
steno_020677=/sc/orga/scratch/webste01/steno_020677/data
all_strains=/sc/orga/scratch/webste01/all_strains/data
steno_only=/sc/orga/scratch/webste01/steno_only/data
mrsa_only=/sc/orga/scratch/webste01/mrsa_only/data
no_dups=/sc/orga/scratch/webste01/no_duplicates/data
no_mrsa=/sc/orga/scratch/webste01/no_mrsa/data

python CA_best_edge_to_GML_ali.py ${bkhd_020668}/celera-assembler.gkpStore ${bkhd_020668}/celera-assembler.tigStore ${bkhd_020668}/4-unitigger/best.edges bkhd_020668.gml
python CA_best_edge_to_GML_ali.py ${lb_020666}/celera-assembler.gkpStore ${lb_020666}/celera-assembler.tigStore ${lb_020666}/4-unitigger/best.edges lb_020666.gml
python CA_best_edge_to_GML_ali.py ${mrsa_020042}/celera-assembler.gkpStore ${mrsa_020042}/celera-assembler.tigStore ${mrsa_020042}/4-unitigger/best.edges mrsa_020042.gml
python CA_best_edge_to_GML_ali.py ${mrsa_020180}/celera-assembler.gkpStore ${mrsa_020180}/celera-assembler.tigStore ${mrsa_020180}/4-unitigger/best.edges mrsa_020180.gml
python CA_best_edge_to_GML_ali.py ${steno_020676}/celera-assembler.gkpStore ${steno_020676}/celera-assembler.tigStore ${steno_020676}/4-unitigger/best.edges steno_020676.gml
python CA_best_edge_to_GML_ali.py ${steno_020677}/celera-assembler.gkpStore ${steno_020677}/celera-assembler.tigStore ${steno_020677}/4-unitigger/best.edges steno_020677.gml
python CA_best_edge_to_GML_ali.py ${all_strains}/celera-assembler.gkpStore ${all_strains}/celera-assembler.tigStore ${all_strains}/4-unitigger/best.edges all_strains.gml
python CA_best_edge_to_GML_ali.py ${steno_only}/celera-assembler.gkpStore ${steno_only}/celera-assembler.tigStore ${steno_only}/4-unitigger/best.edges steno_only.gml
python CA_best_edge_to_GML_ali.py ${no_dups}/celera-assembler.gkpStore ${no_dups}/celera-assembler.tigStore ${no_dups}/4-unitigger/best.edges no_dups.gml
python CA_best_edge_to_GML_ali.py ${mrsa_only}/celera-assembler.gkpStore ${mrsa_only}/celera-assembler.tigStore ${mrsa_only}/4-unitigger/best.edges mrsa_only.gml
python CA_best_edge_to_GML_ali.py ${steno_only}/celera-assembler.gkpStore ${steno_only}/celera-assembler.tigStore ${steno_only}/4-unitigger/best.edges steno_only.gml
