#!/bin/bash
tmp=/sc/orga/scratch/webste01/tmp
shared=/sc/orga/scratch/webste01/shared_dir
ID=$1

mkdir /sc/orga/scratch/webste01/${ID}/motif_mod
sed "s|REFERENCE_DIRECTORY|/sc/orga/scratch/webste01/${ID}/reoriented_sequence/cdiff|g" /sc/orga/scratch/webste01/${ID}/motif_simple_example_params.xml > /sc/orga/scratch/webste01/${ID}/motif_simple_params.xml

samtools faidx /sc/orga/scratch/webste01/${ID}/reoriented_sequence/cdiff/sequence/cdiff.fasta 

smrtpipe.py  --params /sc/orga/scratch/webste01/${ID}/motif_simple_params.xml  xml:/sc/orga/scratch/webste01/${ID}/bash5.xml -D TMP=${tmp}  -D SHARED_DIR=${shared} --debug --nobascheck --output=/sc/orga/scratch/webste01/${ID}/motif_mod

