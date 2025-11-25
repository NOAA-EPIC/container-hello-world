#!/bin/bash

#. /opt/intel/oneapi/setvars.sh --force >& /dev/null

#export FI_PROVIDER_PATH=/opt/cray/libfabric/1.15.2.0
#export I_MPI_OFI_LIBRARY=/opt/cray/libfabric/1.15.2.0/lib64/libfabric.so.1

#export UCX_TLS=ud,sm,self

#export FI_PROVIDER=sockets
#export FI_PROVIDER=tcp
#export FI_PROVIDER=mlx/tcp/psm3
#export FI_PROVIDER=psm
#export I_MPI_OFI_PROVIDER=psm

#export LD_LIBRARY_PATH=$CRAY_LD_LIBRARY_PATH:$LD_LIBRARY_PATH
#export LIBRARY_PATH=$CRAY_LIBRARY_PATH:$LIBRARY_PATH

#export FI_CXI_DEFAULT_VNI=$(od -vAn -N4 -tu < /dev/urandom)

 cd /gpfs/csfs1/work/huangwei/src/container-hello-world

 ./hello-world.x
