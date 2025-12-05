#!/bin/bash

set -x

sif=ubuntu22.04-intel-ufs-env-v1.9.2.img
img=/scratch3/NCEPDEV/nems/role.epic/containers/${sif}
bindings="-B /scratch3 -B /scratch4 -B /scratch5"

singularity shell -e ${bindings} ${img} "$@"

