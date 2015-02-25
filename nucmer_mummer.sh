export PATH=/sc/orga/work/bashia02/Thirdparty/MUMmer3.23/:$PATH
SCRATCH=/sc/orga/scratch/webste01

#return alignments including repetitive alignments that are not optimal
#../MUMmer3.23/nucmer --maxmatch --nosimplify all.fasta mrsa.fasta --prefix mrsa_vs_all

gunzip mrsa_020180/data/polished_assembly.fasta.gz
gunzip mrsa_020042/data/polished_assembly.fasta.gz
gunzip steno_020677/data/polished_assembly.fasta.gz
gunzip steno_020676/data/polished_assembly.fasta.gz
gunzip bkhd_020668/data/polished_assembly.fasta.gz
gunzip lb_020666/data/polished_assembly.fasta.gz

#Compute all maximal matches regardless of their uniqueness
../MUMmer3.23/nucmer --maxmatch --nosimplify all_strains/data/polished_assembly.fasta mrsa_020180/data/polished_assembly.fasta --prefix mrsa_020180_vs_all
../MUMmer3.23/nucmer --maxmatch --nosimplify all_strains/data/polished_assembly.fasta mrsa_020042/data/polished_assembly.fasta --prefix mrsa_020042_vs_all
../MUMmer3.23/nucmer --maxmatch --nosimplify all_strains/data/polished_assembly.fasta steno_020677/data/polished_assembly.fasta --prefix steno_020677_vs_all
../MUMmer3.23/nucmer --maxmatch --nosimplify all_strains/data/polished_assembly.fasta steno_020676/data/polished_assembly.fasta --prefix steno_020676_vs_all
../MUMmer3.23/nucmer --maxmatch --nosimplify all_strains/data/polished_assembly.fasta bkhd_020668/data/polished_assembly.fasta --prefix bkhd_020668_vs_all
../MUMmer3.23/nucmer --maxmatch --nosimplify all_strains/data/polished_assembly.fasta  lb_020666/data/polished_assembly.fasta --prefix lb_020666_vs_all

#Compute the mum candidates which are matches that are unique in the reference but not necessarily the query
../MUMmer3.23/nucmer --mumref -l 1  all_strains/data/polished_assembly.fasta mrsa_020180/data/polished_assembly.fasta --prefix mrsa_020180_vs_all_mumref
../MUMmer3.23/nucmer --mumref -l 1 all_strains/data/polished_assembly.fasta mrsa_020042/data/polished_assembly.fasta --prefix mrsa_020042_vs_all_mumref
../MUMmer3.23/nucmer --mumref -l 1 all_strains/data/polished_assembly.fasta steno_020677/data/polished_assembly.fasta --prefix steno_020677_vs_all_mumref
../MUMmer3.23/nucmer --mumref -l 1 all_strains/data/polished_assembly.fasta steno_020676/data/polished_assembly.fasta --prefix steno_020676_vs_all_mumref
../MUMmer3.23/nucmer --mumref -l 1 all_strains/data/polished_assembly.fasta bkhd_020668/data/polished_assembly.fasta --prefix bkhd_020668_vs_all_mumref
../MUMmer3.23/nucmer --mumref -l 1 all_strains/data/polished_assembly.fasta  lb_020666/data/polished_assembly.fasta --prefix lb_020666_vs_all_mumref

#Delta Filter 
MUMmer3.23/delta-filter -l 1 mrsa_020180_vs_all.delta > mrsa_020180_vs_all_filter.delta
MUMmer3.23/delta-filter -l 1 mrsa_020042_vs_all.delta > mrsa_020042_vs_all_filter.delta
MUMmer3.23/delta-filter -l 1 steno_020677_vs_all.delta > steno_020677_vs_all_filter.delta
MUMmer3.23/delta-filter -l 1 steno_020676_vs_all.delta > steno_020676_vs_all_filter.delta
MUMmer3.23/delta-filter -l 1 bkhd_020668_vs_all.delta > bkhd_020668_vs_all_filter.delta
MUMmer3.23/delta-filter -l 1 lb_020666_vs_all.delta > lb_020666_vs_all_filter.delta

MUMmer3.23/delta-filter -l 1 mrsa_020180_vs_all_mumref.delta > mrsa_020180_vs_all_mumref_filter.delta
MUMmer3.23/delta-filter -l 1 mrsa_020042_vs_all_mumref.delta >  mrsa_020042_vs_all_mumref_filter.delta
MUMmer3.23/delta-filter -l 1 steno_020677_vs_all_mumref.delta > steno_020677_vs_all_mumref_filter.delta
MUMmer3.23/delta-filter -l 1 steno_020676_vs_all_mumref.delta > steno_020676_vs_all_mumref_filter.delta
MUMmer3.23/delta-filter -l 1 bkhd_020668_vs_all_mumref.delta > bkhd_020668_vs_all_mumref_filter.delta
MUMmer3.23/delta-filter -l 1 lb_020666_vs_all_mumref.delta > lb_020666_vs_all_mumref_filter.delta

#mummerplot *delta
cd /sc/orga/scratch/webste01/mummerplot
../MUMmer3.23/mummerplot -f -l --png  ../mrsa_020180_vs_all.delta -prefix mrsa_020180_vs_all.delta
../MUMmer3.23/mummerplot -f -l --png  ../mrsa_020042_vs_all.delta -prefix mrsa_020042_vs_all.delta
../MUMmer3.23/mummerplot -f -l --png  ../steno_020677_vs_all.delta -prefix steno_020677_vs_all.delta
../MUMmer3.23/mummerplot -f -l --png  ../steno_020676_vs_all.delta -prefix steno_020676_vs_all.delta
../MUMmer3.23/mummerplot -f -l --png  ../bkhd_020668_vs_all.delta -prefix bkhd_020668_vs_all.delta
../MUMmer3.23/mummerplot -f -l --png  ../lb_020666_vs_all.delta -prefix lb_020666_vs_all.delta
../MUMmer3.23/mummerplot -f -l --png  ../mrsa_020180_vs_all_mumref.delta -prefix mrsa_020180_vs_all_mumref.delta
../MUMmer3.23/mummerplot -f -l --png  ../mrsa_020042_vs_all_mumref.delta -prefix mrsa_020042_vs_all_mumref.delta
../MUMmer3.23/mummerplot -f -l --png  ../steno_020677_vs_all_mumref.delta -prefix steno_020677_vs_all_mumref.delta
../MUMmer3.23/mummerplot -f -l --png  ../steno_020676_vs_all_mumref.delta -prefix steno_020676_vs_all_mumref.delta
../MUMmer3.23/mummerplot -f -l --png  ../bkhd_020668_vs_all_mumref.delta -prefix bkhd_020668_vs_all_mumref.delta
../MUMmer3.23/mummerplot -f -l --png  ../lb_020666_vs_all_mumref.delta -prefix lb_020666_vs_all_mumref.delta

../MUMmer3.23/mummerplot -f -l --png  ../mrsa_020180_vs_all_filter.delta -prefix mrsa_020180_vs_all_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../mrsa_020042_vs_all_filter.delta -prefix mrsa_020042_vs_all_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../steno_020677_vs_all_filter.delta -prefix steno_020677_vs_all_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../steno_020676_vs_all_filter.delta -prefix steno_020676_vs_all_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../bkhd_020668_vs_all_filter.delta -prefix bkhd_020668_vs_all_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../lb_020666_vs_all_filter.delta -prefix lb_020666_vs_all_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../mrsa_020180_vs_all_mumref_filter.delta -prefix mrsa_020180_vs_all_mumref_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../mrsa_020042_vs_all_mumref_filter.delta -prefix mrsa_020042_vs_all_mumref_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../steno_020677_vs_all_mumref_filter.delta -prefix steno_020677_vs_all_mumref_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../steno_020676_vs_all_mumref_filter.delta -prefix steno_020676_vs_all_mumref_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../bkhd_020668_vs_all_mumref_filter.delta -prefix bkhd_020668_vs_all_mumref_filter.delta
../MUMmer3.23/mummerplot -f -l --png  ../lb_020666_vs_all_mumref_filter.delta -prefix lb_020666_vs_all_mumref_filter.delta




#show-coords (summary table)
MUMmer3.23/show-coords mrsa_020180_vs_all_mumref.delta > mrsa_020180_vs_all_mumref.coords
MUMmer3.23/show-coords mrsa_020042_vs_all_mumref.delta > mrsa_020042_vs_all_mumref.coords
MUMmer3.23/show-coords steno_020677_vs_all_mumref.delta > steno_020677_vs_all_mumref.coords
MUMmer3.23/show-coords steno_020676_vs_all_mumref.delta > steno_020676_vs_all_mumref.coords 
MUMmer3.23/show-coords bkhd_020668_vs_all_mumref.delta > bkhd_020668_vs_all_mumref.coords
MUMmer3.23/show-coords lb_020666_vs_all_mumref.delta > lb_020666_vs_all_mumref.coords


