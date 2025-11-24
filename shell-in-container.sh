#!/bin/bash

set -x

source /glade/u/apps/derecho/24.12/spack/opt/spack/lmod/8.7.37/gcc/12.4.0/nr3e/lmod/lmod/init/bash
module --force purge
module load ncarenv/24.12 intel-oneapi/2024.2.1 cray-mpich/8.1.29

module load libfabric/1.15.2.0
module load apptainer

sif=ubuntu22.04-intel-ufs-env-v1.9.2.img
img=/glade/u/home/huangwei/containers/${sif}
bindings="-B /glade -B /gpfs -B /lustre -B /opt/cray"

export FI_PROVIDER_PATH=/opt/cray/libfabric/1.15.2.0
export I_MPI_OFI_LIBRARY=/opt/cray/libfabric/1.15.2.0/lib64/libfabric.so.1

apptainer shell ${bindings} "${img}"

