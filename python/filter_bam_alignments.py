import sys
import pysam

fn = sys.argv[1]
read_len_cut = int(sys.argv[2])

samfile = pysam.AlignmentFile(fn, "rb")

counter = 0
for read in samfile.fetch():
    if read.query_alignment_length > read_len_cut:
        counter += 1

print counter


