#Compare all of the cdiff.g genomes
#MIGHT HAVE TO CHANGE THE OUTGROUP TO GENOME.FASTA
rake mugsy IN_FOFN=/sc/orga/scratch/webste01/cdiff_phylogenetic/input.fofn OUT_PREFIX=all_cdiff OUTGROUP=a020334  OUT=/sc/orga/scratch/webste01/cdiff_phylogenetic

rake mugsy_plot OUT=/sc/orga/scratch/webste01/cdiff_phylogenetic OUT_PREFIX=all_cdiff

rake mauve IN_FOFN=/sc/orga/scratch/webste01/cdiff_phylogenetic/input.fofn  OUT_PREFIX=all_cdiff  SEED_WEIGHT=3.8 LCB_WEIGHT=3.8

rake sv_snv IN_FOFN=/sc/orga/scratch/webste01/cdiff_phylogenetic/input.fofn OUT=/sc/orga/scratch/webste01/cdiff_phylogenetic OUT_PREFIX=all_cdiff SEED_WEIGHT=3.8 LCB_WEIGHT=3.8

