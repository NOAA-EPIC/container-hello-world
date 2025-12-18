#!/bin/bash

which mpirun

source /usr/lmod/lmod/init/bash
module purge
module use /scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/sorc/gfs_utils.fd/modulefiles
module load gfsutils_container.intel
module load python

echo "I_MPI_TMPDIR: $I_MPI_TMPDIR"
env | grep I_IMPI

python --version
which mpirun
python $@

