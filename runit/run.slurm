#! /bin/sh
#SBATCH --job-name=test
#SBATCH --account=epic
#SBATCH --qos=batch
#SBATCH --partition=u1-compute
#SBATCH -t 00:05:00
#SBATCH --ntasks=192
#SBATCH -o log.test
#SBATCH --exclusive
#SBATCH --comment=22d48c18c7455f7a811acfcab7f80c3a

cd /scratch4/NAGAPE/epic/Wei.Huang/src/container/container-hello-world/runit
srun --mpi=pmi2 -l --export=ALL --hint=nomultithread --distribution=block:block -n 192 \
        ./start-container.sh ./container-env.sh ./hello-world.x

