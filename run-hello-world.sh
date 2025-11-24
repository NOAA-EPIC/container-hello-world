#!/bin/bash

 . /opt/intel/oneapi/setvars.sh --force >& /dev/null

 export FI_PROVIDER_PATH=/opt/cray/libfabric/1.15.2.0
 export I_MPI_OFI_LIBRARY=/opt/cray/libfabric/1.15.2.0/lib64/libfabric.so.1
 export I_MPI_PMI_LIBRARY=/opt/cray/pe/lib64/libpmi.so

 cd /gpfs/csfs1/work/huangwei/src/container-hello-world

 ./hello-world.x
