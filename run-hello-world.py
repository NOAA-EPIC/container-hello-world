#!/usr/bin/env python
# calcanl_gfs.py
# cory.r.martin@noaa.gov
# 2019-10-11
# script to run executables to produce netCDF analysis
# on GFS gaussian grid for downstream users
import os
import grp
import sys
import stat
import shutil
import subprocess
import datetime
import socket


def get_slurm_hostname():
    """
    Retrieves the compute node hostname from within a container running via Slurm.
    """
    # 1. Best Method: The specific node where *this* process is currently running
    # Slurm sets this on every node in the allocation.
    slurm_node_name = os.environ.get('SLURMD_NODENAME')
    if slurm_node_name:
        return slurm_node_name

    # 2. Fallback: The list of all nodes allocated to the job
    # Use this only if the execution is strictly single-node, otherwise
    # this might return a list (e.g., "node[01-02]")
    slurm_nodelist = os.environ.get('SLURM_NODELIST')
    if slurm_nodelist:
        # If the list doesn't contain brackets (implies single node), use it.
        if '[' not in slurm_nodelist:
            return slurm_nodelist

    # 3. Last Resort: Python's native socket library
    # This works for Singularity/Apptainer (which usually shares the host network)
    # but fails for Docker (which isolates the hostname by default).
    return socket.gethostname()

def check_execution_environment():
    """
    Returns a tuple: (is_container (bool), detected_type (str))
    """
    # 1. Check for Apptainer / Singularity (Most common in HPC)
    # These runtimes automatically inject specific environment variables.
    if os.environ.get('SINGULARITY_NAME') or os.environ.get('SINGULARITY_CONTAINER'):
        return True, "Singularity"
    
    if os.environ.get('APPTAINER_NAME') or os.environ.get('APPTAINER_CONTAINER'):
        return True, "Apptainer"

    # 2. Check for Docker
    # The presence of this file is the standard indicator for Docker.
    if os.path.exists('/.dockerenv'):
        return True, "Docker"

    # 3. Check Control Groups (Cgroups)
    # This detects Docker, Kubernetes, Podman, and LXC by looking at the init process.
    # Note: This might fail if you don't have read permissions on /proc (rare).
    try:
        with open('/proc/1/cgroup', 'rt') as f:
            cgroup_content = f.read()
            if 'docker' in cgroup_content:
                return True, "Docker (via cgroup)"
            if 'kubepods' in cgroup_content:
                return True, "Kubernetes"
            if 'libpod' in cgroup_content:
                return True, "Podman"
            if 'lxc' in cgroup_content:
                return True, "LXC"
    except (IOError, FileNotFoundError):
        pass

    # 4. Check for Kubernetes Service Host
    if os.environ.get('KUBERNETES_SERVICE_HOST'):
        return True, "Kubernetes"

    # If none of the above matches, we assume we are on the bare metal host.
    return False, "Host"

# function to calculate analysis from a given increment file and background
def runHelloWorld(workdir, helloworldcmd):
    hosts = []
    in_container, env_type = check_execution_environment()
    if in_container:
        nodes = get_slurm_hostname()
        hosts.append(nodes)
        nhosts = len(hosts)
        print(f'nodes: {nodes}')

    # run the executable
    hw_job = subprocess.Popen('mpirun -n 24 ' + workdir + helloworldcmd, shell=True, cwd=workdir)

    sys.stdout.flush()
    # check on analysis steps
    exit_hw = hw_job.wait()
    if exit_hw != 0:
        print('Error with hello-world.x for ensemble resolution, exit code=' + str(exit_hw))
        sys.exit(exit_hw)

    print('runHelloWorld successfully completed at: ', datetime.datetime.utcnow())


# run the function if this script is called from the command line
if __name__ == '__main__':
    workdir = '/contrib/Wei.Huang/src/container-hello-world/'
    helloworldcmd = 'hello-world.x'

    runHelloWorld(workdir, helloworldcmd)
