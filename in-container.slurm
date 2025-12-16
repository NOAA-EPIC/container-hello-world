#!/bin/bash
#SBATCH --job-name=hw
#SBATCH --account=epic
#SBATCH --qos=batch
#SBATCH --partition=u1-compute
#SBATCH -t 00:01:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=192
#SBATCH --cpus-per-task=1
#SBATCH -o log.in-container
#SBATCH -e err.in-container

singularity exec \
    --cleanenv \
    -B /scratch3 -B /scratch4 -B /scratch5 \
    /scratch4/NAGAPE/epic/Wei.Huang/src/container/ubuntu22.04-intel-ufs-env-v1.9.2.img \
    /scratch4/NAGAPE/epic/Wei.Huang/src/container-hello-world/run-python-in-script.sh

exit 0

singularity exec \
    --cleanenv \
    -B /scratch3 -B /scratch4 -B /scratch5 \
    /scratch4/NAGAPE/epic/Wei.Huang/src/container/ubuntu22.04-intel-ufs-env-v1.9.2.img \
    /scratch4/NAGAPE/epic/Wei.Huang/src/gsi-container/global-workflow-cloud/exec/python-env.sh \
    /scratch4/NAGAPE/epic/Wei.Huang/src/container-hello-world/run-hello-world.py

exit 0

singularity exec \
    --cleanenv \
    -B /scratch3 -B /scratch4 -B /scratch5 \
    /scratch4/NAGAPE/epic/Wei.Huang/src/container/ubuntu22.04-intel-ufs-env-v1.9.2.img \
    /scratch4/NAGAPE/epic/Wei.Huang/src/container-hello-world/run-python-in-script.sh

exit 0

singularity exec \
    --cleanenv \
    -B /scratch3 -B /scratch4 -B /scratch5 \
    /scratch4/NAGAPE/epic/Wei.Huang/src/container/ubuntu22.04-intel-ufs-env-v1.9.2.img \
    python /scratch4/NAGAPE/epic/Wei.Huang/src/container-hello-world/run-hello-world.py

exit 0

singularity exec \
    --cleanenv \
    -B /scratch3 -B /scratch4 -B /scratch5 \
    /scratch4/NAGAPE/epic/Wei.Huang/src/container/ubuntu22.04-intel-ufs-env-v1.9.2.img \
    mpirun -n 192 /scratch4/NAGAPE/epic/Wei.Huang/src/container-hello-world/hello-world.x

