#!/bin/bash
# minimal-test.sh

source /glade/u/apps/derecho/24.12/spack/opt/spack/lmod/8.7.37/gcc/12.4.0/nr3e/lmod/lmod/init/bash
module --force purge
module load ncarenv/24.12 intel-oneapi/2024.2.1 cray-mpich/8.1.29

module load libfabric/1.15.2.0
module load apptainer

# Test 1: Can we run simple non-MPI programs?
echo "Test 1"
apptainer exec \
    -B /glade -B /gpfs -B /lustre \
    /glade/u/home/huangwei/containers/ubuntu22.04-intel-ufs-env-v1.9.2.img \
    /bin/echo "Hello from container"

# Test 2: Can we run hostname inside container with mpiexec?
echo "Test 2"
mpiexec -n 1 apptainer exec \
    -B /glade -B /gpfs -B /lustre -B /opt/cray \
    /glade/u/home/huangwei/containers/ubuntu22.04-intel-ufs-env-v1.9.2.img \
    /bin/hostname
