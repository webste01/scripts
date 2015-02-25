#Run on all samples
cd pathogendb-pipeline
source scripts/env.sh
bundle install --deployment
rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/all_strains STRAIN_NAME=metagenomic_stuff

#Run on no mersa
rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/no_mersa STRAIN_NAME=metagenomic_stuff_no_mersa

#Run on no duplicates
rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/no_duplicates STRAIN_NAME=metagenomic_stuff_no_dups

#Run on each strain individually

rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/mrsa_020180 STRAIN_NAME=mrsa_020180
rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/mrsa_020042 STRAIN_NAME=mrsa_020042
rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/mrsa_only STRAIN_NAME=mrsa_only
rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/steno_020677 STRAIN_NAME=steno_020677
rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/steno_020676 STRAIN_NAME=steno_020676
rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/steno_only STRAIN_NAME=steno_only
rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/bkhd_020668 STRAIN_NAME=bkhd_020668
rake assemble_raw_reads OUT=/sc/orga/scratch/webste01/lb_020666 STRAIN_NAME=lb_020666
