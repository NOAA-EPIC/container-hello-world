#!/bin/bash

source /usr/lmod/lmod/init/bash
module use "/scratch4/NAGAPE/epic/Wei.Huang/src/container/global-workflow-cloud/sorc/ufs_model.fd/modulefiles"
module load ufs_container.intel

if [[ $# -gt 0 ]]; then
    "$@"
fi

