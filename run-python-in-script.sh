#!/bin/bash

#source /usr/lmod/lmod/init/bash
#module purge
#module use /scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/sorc/gfs_utils.fd/modulefiles
#module load gfsutils_container.intel
#module load python
#module load py-netcdf4
#module load py-xarray
#module load py-f90nml
#module load py-numpy
#module load py-jinja2
#module load py-pyyaml

#module use /scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/sorc/gdas.cd/modulefiles
#module load GDAS/container.intel

#source /scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/exec/calcanl.env

#wxflowPATH=/scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/ush:/scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/ush/python:/scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/sorc/wxflow/src:/scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/sorc/gdas.cd/sorc/da-utils/ush:/scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/sorc/gdas.cd/install/lib/python3.11
#export PYTHONPATH=${PYTHONPATH:+${PYTHONPATH}:}${wxflowPATH}

#this will result to many 1 task jobs
python /scratch4/NAGAPE/epic/Wei.Huang/src/container-hello-world/run-hello-world.py

