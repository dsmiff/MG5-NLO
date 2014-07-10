#################################################
#### Script to create config file used for MadGraph madevent to create scan
#### Author : Dominic Smith, University of Bristol
###  Date  : 23/01/14
#################################################

# Define generation 
# In this case, we create a config for a T1t1t scan with a gluino mass of 1 TeV and lsp mass of 100 GeV. 
# The config scans different stop masses and if Delphes is initiated will produce a root ttree
# Initial parameters can be changed in param_card.dat or include below.

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
MstopMin=250
MstopMax=300
StepSize=25

printf '# First generation' > me5.cmd     # Not neccessary 

# Can define other parameters here eg. set ebeam1 4000


# Turn Delphes on, Pythia hadronisation/showering is on by default

for i in $(seq $MstopMin $StepSize $MstopMax);
 do
printf "\ngenerate_events \n   3 \n   set MSU3 $i\n   set MNEU1 $MlspMin" >> me5.cmd

done

echo "Your config file is ready"



fi
