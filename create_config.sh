#################################################
#### Script to create config file used for MadGraph madevent to create scan
#### Author : Dominic Smith, University of Bristol
###  Date  : 23/01/14
#################################################

# Define generation 


echo "                     "
echo "**********************************"
echo "Creating config file for MC MadGraph@NLO LHE production"
echo "Sample is:" 
echo " T1t1t"
echo "                     "

if [ -s me5.cmd ]; then

printf '**************\n'
echo "Config file already exists"
printf '**************\n'

else

MlspMin=100
MlspMax=650
MstopMin=200
MstopMax=750
StepSize=25

printf '# First generation' > me5.cmd     # Not neccessary 


# Turn Delphes on, Pythia hadronisation/showering is on by default

for i in $(seq $MstopMin $StepSize $MstopMax);
 do
printf "\ngenerate_events \n   3 \n   set MSU3 $i\n   set MNEU1 $MlspMin" >> me5.cmd

done

echo "Your config file is ready"



fi