#!/usr/bin/env python
# calcanl_gfs.py
# cory.r.martin@noaa.gov
# 2019-10-11
# script to run executables to produce netCDF analysis
# on GFS gaussian grid for downstream users
import os
import grp
import sys
import subprocess
import datetime


# function to calculate analysis from a given increment file and background
def runMPMD(workdir, mastercmd, workercmd):
    # run the executable
    hw_job = subprocess.Popen('mpirun -np 1 ' + workdir + mastercmd + ' : -np 20 '
                                              + workdir + workercmd, shell=True, cwd=workdir)

    sys.stdout.flush()
    # check on analysis steps
    exit_hw = hw_job.wait()
    if exit_hw != 0:
        print('Error with mpmd for ensemble resolution, exit code=' + str(exit_hw))
        sys.exit(exit_hw)

    print('runMPMD successfully completed at: ', datetime.datetime.utcnow())


# run the function if this script is called from the command line
if __name__ == '__main__':
    workdir = '/scratch4/NAGAPE/epic/Wei.Huang/src/container-hello-world/mpmd/'
    mastercmd = 'master.x'
    workercmd = 'worker.x'

    runMPMD(workdir, mastercmd, workercmd)
