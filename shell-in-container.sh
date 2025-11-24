#!/bin/bash

set -x

module load apptainer

sif=ubuntu22.04-intel-ufs-env-v1.9.2.img
img=/glade/u/home/huangwei/containers/${sif}
bindings="-B /glade -B /gpfs -B /lustre"

singularity shell -e ${bindings} "${img}"

