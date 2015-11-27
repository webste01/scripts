#!/usr/bin/env python
""" Mixes two (or more) strains as if they were a mixed sample and gives genotypes appropriatelt"""

import sys, os
import logging
import argparse
import vcf


#Input: vcf1 vcf2 outfile
vcf1=sys.argv[1]
vcf2=sys.argv[2]
outfile=sys.argv[3]
strains=int(2)

variant_dictionary={}
vcf_fns=[]
vcf_fns.append(vcf1)
vcf_fns.append(vcf2)

def convert_variants_to_vlist (variants):
	alt_allele_set=set()
	for var in variants:
		alt_al=var.ALT[0]
		alt_allele_set.add(alt_al)
	return alt_allele_set
#return set(map(lambda x: x.ALT[0]))

def get_reference_allele(variants):
	return set(map(lambda x: x.REF[0]))

variant_dictionary={}
for vcf_fn in vcf_fns:
        vcf_reader = vcf.Reader(open(vcf_fn, 'r'))
        for record in vcf_reader:
                reference_pos = (record.CHROM, record.POS)
                variant_dictionary.setdefault(reference_pos, []).append(record)

def printMergedLines ( variant_dictionary ):
	#Prints out lines that are merged in vcf format
	#:param variant_dictionary: dictionary of format (refid, pos) -> list of variants across samp
	#:type variant_dictionarys: dict
	ref_positions = variant_dictionary.keys()
	ref_positions.sort()
	for ref_pos in ref_positions:
		refid, pos = ref_pos
		for variants in variant_dictionary[ref_pos]:
			if len (variant_dictionary[ref_pos]) >1:
				vlist = convert_variants_to_vlist(variant_dictionary[ref_pos])
				if len (vlist) == 1:
					print vlist
					gt = "1/1"
					alt_allele=str(vlist)
					ref_allele="temp"
				else:
					gt = "1/2"
                                	alt_allele=str(vlist)
					#alt_allele=str(vlist[0],vlist[1])
                                	#ref_allele=str(reflist[0],reflist[1])
					ref_allele="Temp"
					#reflist = get_reference_allele(variants)
			else:
				gt = "0/1"
				alt_allele=variants.ALT[0]
				ref_allele=variants.REF[0]
			f.write("%s %s %s %s %s %s %s\n" % (refid, pos, ".", ref_allele, alt_allele,"GT",gt))

f= open(outfile,"w")
printMergedLines(variant_dictionary)

