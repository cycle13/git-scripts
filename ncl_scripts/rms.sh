#!/bin/tcsh
if ( "$#argv" != 3) then
  echo "Wrong number of arguments specified:"
  echo "  -arg 1 file with data"
  echo "  -arg 2 variable name (e.g., PRECT, PS)"
  echo "  -arg 3 variable name (e.g., PRECT, PS)"
  exit
endif
set n = 1
set file = "$argv[$n]" 
set n = 2
set vname1 = "$argv[$n]" 
set n = 3
set vname2 = "$argv[$n]" 

if (`hostname` == "hobart.cgd.ucar.edu") then
  echo "You are on Hobart"
  set data_dir = "/scratch/cluster/$USER/"
  setenv ncl_dir  "/home/$USER/git-scripts/ncl_scripts"
  echo "NCL directory is"$ncl_dir
else if (`hostname` == "izumi.unified.ucar.edu") then
  echo "You are on Izumi"
  set data_dir = "/scratch/cluster/$USER/"
  setenv ncl_dir  "/home/$USER/git-scripts/ncl_scripts"
  echo "NCL directory is"$ncl_dir
else
  module load ncl
  set data_dir = "/glade/scratch/$USER/"
  setenv ncl_dir "/glade/u/home/$USER/git-scripts/ncl_scripts"
endif

ncl 'fname="'$file'"' 'vname1="'$vname1'"' 'vname2="'$vname2'"'  $ncl_dir/rms.ncl

