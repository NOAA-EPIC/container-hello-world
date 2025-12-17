#!/bin/bash

source /usr/lmod/lmod/init/bash
module purge
module use /scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/sorc/gfs_utils.fd/modulefiles
module load gfsutils_container.intel
module load python

cd /scratch4/NAGAPE/epic/Wei.Huang/src/container-hello-world/mpmd
python --version
python ./run_mpmd.py

