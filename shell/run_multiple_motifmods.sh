tmp=/sc/orga/scratch/webste01/tmp
shared=/sc/orga/scratch/webste01/shared_dir

mkdir /sc/orga/scratch/webste01/020914/motif_mod
sed 's:REFERENCE_DIRECTORY:/sc/orga/scratch/webste01/020914/reoriented_sequence/cdiff:g' /sc/orga/scratch/webste01/020914/motif_simple_example_params.xml > /sc/orga/scratch/webste01/020914/motif_simple_params.xml
smrtpipe.py  --params /sc/orga/scratch/webste01/020914/motif_simple_params.xml  xml:/sc/orga/scratch/webste01/020914/bash5.xml -D TMP=${tmp}  -D SHARED_DIR=${shared} --debug --nobascheck --output=/sc/orga/scratch/webste01/020914/motif_mod


OUT=/sc/orga/scratch/webste01/020914  SMRT_JOB_ID=020914  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020912
OUT=/sc/orga/scratch/webste01/020912  SMRT_JOB_ID=020912  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020909
OUT=/sc/orga/scratch/webste01/020909  SMRT_JOB_ID=020909  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020706
OUT=/sc/orga/scratch/webste01/020706  SMRT_JOB_ID=020706  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020332
OUT=/sc/orga/scratch/webste01/020332  SMRT_JOB_ID=020332  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020330
OUT=/sc/orga/scratch/webste01/020330  SMRT_JOB_ID=020330  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020711
OUT=/sc/orga/scratch/webste01/020711  SMRT_JOB_ID=020711  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/021018
OUT=/sc/orga/scratch/webste01/021018  SMRT_JOB_ID=021018  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020708
OUT=/sc/orga/scratch/webste01/020708  SMRT_JOB_ID=020708  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020695
OUT=/sc/orga/scratch/webste01/020695  SMRT_JOB_ID=020695  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/021014
OUT=/sc/orga/scratch/webste01/021014  SMRT_JOB_ID=021014  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020702
OUT=/sc/orga/scratch/webste01/020702  SMRT_JOB_ID=020702  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020486
OUT=/sc/orga/scratch/webste01/020486  SMRT_JOB_ID=020486  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020037
OUT=/sc/orga/scratch/webste01/020037  SMRT_JOB_ID=020037  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020707
OUT=/sc/orga/scratch/webste01/020707  SMRT_JOB_ID=020707  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020689
OUT=/sc/orga/scratch/webste01/020689  SMRT_JOB_ID=020689  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020079
OUT=/sc/orga/scratch/webste01/020079  SMRT_JOB_ID=020079  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020481
OUT=/sc/orga/scratch/webste01/020481  SMRT_JOB_ID=020481  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020688
OUT=/sc/orga/scratch/webste01/020688  SMRT_JOB_ID=020688  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020480
OUT=/sc/orga/scratch/webste01/020480  SMRT_JOB_ID=020480  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020479
OUT=/sc/orga/scratch/webste01/020479  SMRT_JOB_ID=020479  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/021022
OUT=/sc/orga/scratch/webste01/021022  SMRT_JOB_ID=021022  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020484
OUT=/sc/orga/scratch/webste01/020484  SMRT_JOB_ID=020484  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020918
OUT=/sc/orga/scratch/webste01/020918  SMRT_JOB_ID=020918  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020483
OUT=/sc/orga/scratch/webste01/020483  SMRT_JOB_ID=020483  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020482
OUT=/sc/orga/scratch/webste01/020482  SMRT_JOB_ID=020482  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020917
OUT=/sc/orga/scratch/webste01/020917  SMRT_JOB_ID=020917  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020478
OUT=/sc/orga/scratch/webste01/020478  SMRT_JOB_ID=020478  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020485
OUT=/sc/orga/scratch/webste01/020485  SMRT_JOB_ID=020485  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020916
OUT=/sc/orga/scratch/webste01/020916  SMRT_JOB_ID=020916  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020359
OUT=/sc/orga/scratch/webste01/020359  SMRT_JOB_ID=020359  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020477
OUT=/sc/orga/scratch/webste01/020477  SMRT_JOB_ID=020477  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020923
OUT=/sc/orga/scratch/webste01/020923  SMRT_JOB_ID=020923  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020705
OUT=/sc/orga/scratch/webste01/020705  SMRT_JOB_ID=020705  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020266
OUT=/sc/orga/scratch/webste01/020266  SMRT_JOB_ID=020266  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020913
OUT=/sc/orga/scratch/webste01/020913  SMRT_JOB_ID=020913  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020360
OUT=/sc/orga/scratch/webste01/020360  SMRT_JOB_ID=020360  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020911
OUT=/sc/orga/scratch/webste01/020911  SMRT_JOB_ID=020911  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020361
OUT=/sc/orga/scratch/webste01/020361  SMRT_JOB_ID=020361  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020700
OUT=/sc/orga/scratch/webste01/020700  SMRT_JOB_ID=020700  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020265
OUT=/sc/orga/scratch/webste01/020265  SMRT_JOB_ID=020265  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/021024
OUT=/sc/orga/scratch/webste01/021024  SMRT_JOB_ID=021024  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020698
OUT=/sc/orga/scratch/webste01/020698  SMRT_JOB_ID=020698  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020697
OUT=/sc/orga/scratch/webste01/020697  SMRT_JOB_ID=020697  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020475
OUT=/sc/orga/scratch/webste01/020475  SMRT_JOB_ID=020475  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020474
OUT=/sc/orga/scratch/webste01/020474  SMRT_JOB_ID=020474  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/021017
OUT=/sc/orga/scratch/webste01/021017  SMRT_JOB_ID=021017  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/021012
OUT=/sc/orga/scratch/webste01/021012  SMRT_JOB_ID=021012  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/021023
OUT=/sc/orga/scratch/webste01/021023  SMRT_JOB_ID=021023  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/021011
OUT=/sc/orga/scratch/webste01/021011  SMRT_JOB_ID=021011  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020922
OUT=/sc/orga/scratch/webste01/020922  SMRT_JOB_ID=020922  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020438
OUT=/sc/orga/scratch/webste01/020438  SMRT_JOB_ID=020438  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020425
OUT=/sc/orga/scratch/webste01/020425  SMRT_JOB_ID=020425  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020424
OUT=/sc/orga/scratch/webste01/020424  SMRT_JOB_ID=020424  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020334
OUT=/sc/orga/scratch/webste01/020334  SMRT_JOB_ID=020334  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020382
OUT=/sc/orga/scratch/webste01/020382  SMRT_JOB_ID=020382  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020381
OUT=/sc/orga/scratch/webste01/020381  SMRT_JOB_ID=020381  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020327
OUT=/sc/orga/scratch/webste01/020327  SMRT_JOB_ID=020327  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020326
OUT=/sc/orga/scratch/webste01/020326  SMRT_JOB_ID=020326  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020710
OUT=/sc/orga/scratch/webste01/020710  SMRT_JOB_ID=020710  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020691
OUT=/sc/orga/scratch/webste01/020691  SMRT_JOB_ID=020691  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020709
OUT=/sc/orga/scratch/webste01/020709  SMRT_JOB_ID=020709  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020690
OUT=/sc/orga/scratch/webste01/020690  SMRT_JOB_ID=020690  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020696
OUT=/sc/orga/scratch/webste01/020696  SMRT_JOB_ID=020696  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020487
OUT=/sc/orga/scratch/webste01/020487  SMRT_JOB_ID=020487  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020476
OUT=/sc/orga/scratch/webste01/020476  SMRT_JOB_ID=020476  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020304
OUT=/sc/orga/scratch/webste01/020304  SMRT_JOB_ID=020304  STRAIN_NAME=cdiff rake motif_and_mods

mkdir /sc/orga/scratch/webste01/020302
OUT=/sc/orga/scratch/webste01/020302  SMRT_JOB_ID=020302  STRAIN_NAME=cdiff rake motif_and_mods

