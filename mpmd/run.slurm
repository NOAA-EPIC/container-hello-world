#!/bin/bash
#SBATCH --job-name=hw
#SBATCH --account=epic
#SBATCH --qos=batch
#SBATCH --partition=u1-compute
#SBATCH -t 00:01:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=192
#SBATCH --cpus-per-task=1
#SBATCH -o log.mpmd
#SBATCH -e err.mpmd

singularity exec \
    --cleanenv \
    -B /scratch3 -B /scratch4 -B /scratch5 \
    /scratch4/NAGAPE/epic/Wei.Huang/src/container/ubuntu22.04-intel-ufs-env-v1.9.2.img \
    /scratch4/NAGAPE/epic/Wei.Huang/src/container-hello-world/mpmd/run_mpmd.sh

