#!/usr/bin/env python
""" Mixes two (or more) strains as if they were a mixed sample and gives genotypes appropriatelt"""

import sys, os
import logging
import argparse
import pyvcf

class VCFMerger:
    def __init__( self ):
        self.__parseArgs( )
        self.__initLog( )

    def __parseArgs( self ):
    	"""Handle command line argument parsing"""
        parser = argparse.ArgumentParser(description='merges synthetic strain separated vcfs.')
        parser.add_argument('vcf_fns', nargs='+', type=str, help='vcf file name')
        parser.add_argument('outfile', nargs='?', type=argparse.FileType('w'), default=sys.stdout)
        parser.add_argument( "-l", "--logFile", help="Specify a file to log to. Defaults to stderr." )
        parser.add_argument( "-d", "--debug", action="store_true", help="Increases verbosity of logging" )
        parser.add_argument( "-i", "--info", action="store_true", help="Display informative log entries" )
        parser.add_argument( "-p", "--profile", action="store_true", help="Profile this script, dumping to <scriptname>.profile" )
        
        self.args = parser.parse_args()
        self.variant_dict = {}


    def __initLog( self ):
        """Sets up logging based on command line arguments. Allows for three levels of logging:
        logging.error( ): always emitted
        logging.info( ): emitted with --info or --debug
        logging.debug( ): only with --debug"""

        logLevel = logging.DEBUG if self.args.debug else logging.INFO if self.args.info else logging.ERROR
        logFormat = "%(asctime)s [%(levelname)s] %(message)s"
        if self.args.logFile != None:
            logging.basicConfig( filename=self.args.logFile, level=logLevel, format=logFormat )
        else:
            logging.basicConfig( stream=sys.stderr, level=logLevel, format=logFormat )

    def printMergedLines ( self, variant_dict ):
    	""" 
    	Prints out lines that are merged in vcf format
    	:param variant_dict: dictionary of format (refid, pos) -> list of variants across samples
	    :type variant_dicts: dict
    	"""
    	variant_dict = self.variant_dict
    	ref_positions = variant_dict.keys()
    	ref_positions.sort()
    	for ref_pos in ref_positions:
    		refid, pos = ref_pos
    		for variants in variant_dict[refpos]:
    			# if all have the same we'll give a 1/1
				vlist = convert_variants_to_vlist(variants) # set of variants
				if len (variants) == self.strains and len(vlist) == 1:
					gt = "1/1"
    			# if some have it and others do not 0/1
    			elif len(variants) < self.strains and len(vlist) == 1:
    				gt = "0/1"
    			# if they have different variants then 1/2
    			elif len(variants) == self.strains and len(vlist) == 2:
    				gt = "1/2"
    			else:
    				continue
    			# NOTE IF WE WANT TO DO GENERIC PLOIDY WE WILL HAVE TO EXPAND THIS
    			# write out the line

	def convert_variants_to_vlist (self, variants):
		return set(map(lambda x: x.ALT[0]))

    def vcfDictUpdate (self, vcf_fn):
    	vcf_reader = vcf.Reader(open(fn, 'r'))
    	for record in vcf_reader:
			reference_pos = (record.CHROM, record.POS)
    		self.variant_dict.setdefault(reference_pos, []).append(record)

   	'''
    def vcfToSyntheticMerge (self, vcf_fn):
    	vcf_reader = vcf.Reader(open(vcf_fn, 'r'))
    	for record in vcf_reader:
   	'''
                                                                 
    def run( self ):
        """Executes the body of the script."""
    
        logging.info("Log level set to INFO")
        logging.debug("Log Level set to DEBUG")
        for vcf_fn in self.args.vcf_fns:
	        vcfDictUpdate(vcf_fn)
        return 0

if __name__ == "__main__":
    app = VCFMerger()
    if app.args.profile:
        import cProfile
        cProfile.run( 'app.run()', '%s.profile' % sys.argv[0] )
    sys.exit( app.run() )
