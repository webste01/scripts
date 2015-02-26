source /sc/orga/projects/pacbio/modules/smrtanalysis/2.2.0/install/smrtanalysis_2.3.0.140936/etc/setup.sh

smrtpipe.py  --params /sc/orga/scratch/webste01/re-sequencing/simple_mot_mod.xml xml:/sc/orga/scratch/webste01/all_strains/bash5.xml -D TMP=/sc/orga/scratch/webste01/re-sequencing/temp -D SHARED_DIR=/sc/orga/scratch/webste01/re-sequencing/shared  --distribute --debug --nobascheck --output=/sc/orga/scratch/webste01/re-sequencing/all_strains_again

