#!/bin/bash

sif=ubuntu22.04-intel-ufs-env-v1.9.2.img
img=/scratch3/NCEPDEV/nems/role.epic/containers/${sif}
bindings="-B /apps/slurm/default/lib/libpmi2.so -B /scratch3 -B /scratch4 -B /scratch5"

export I_MPI_PMI_LIBRARY=/apps/slurm/default/lib/libpmi2.so
export I_MPI_FABRICS=shm:ofi
export I_MPI_OFI_PROVIDER=tcp
export FI_PROVIDER=tcp
export FI_TCP_IFACE=eth0

apptainer exec ${bindings} ${img} "$@"

