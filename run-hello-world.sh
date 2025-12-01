#!/bin/bash

export LD_LIBRARY_PATH=$NCAR_LIBFABRIC_ROOT/lib64:${CRAY_MPICH_DIR}/lib-abi-mpich:/opt/cray/pe/lib64:$LD_LIBRARY_PATH:/host/usr/lib64

/gpfs/csfs1/work/huangwei/src/container-hello-world/hello-world.x "$@"
