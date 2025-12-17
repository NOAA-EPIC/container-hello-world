#!/bin/bash
#SBATCH --job-name=hw
#SBATCH --account=Wei.Huang
#SBATCH --partition=compute
#SBATCH -t 00:01:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=24
#SBATCH --cpus-per-task=1
#SBATCH -o log.aws-in-container
#SBATCH -e err.aws-in-container

singularity exec \
    --cleanenv \
    -B /contrib -B /lustre -B /bucket \
    /contrib/containers/ubuntu22.04-intel-ufs-env-v1.9.2.img \
    /contrib/Wei.Huang/src/container-hello-world/run-python-in-script.sh

