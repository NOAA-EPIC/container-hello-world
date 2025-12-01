#!/bin/bash

set -x

#source /glade/u/apps/derecho/24.12/spack/opt/spack/lmod/8.7.37/gcc/12.4.0/nr3e/lmod/lmod/init/bash
module --force purge
module load ncarenv/24.12
module load apptainer

sif=ubuntu22.04-intel-ufs-env-v1.9.2.img
img=/glade/u/home/huangwei/containers/${sif}
bindings="-B /glade -B /gpfs -B /lustre"

apptainer shell --cleanenv ${bindings} "${img}"

