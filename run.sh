#!/bin/bash

rm -f err.aws-in-container log.aws-in-container
sbatch aws-in-container.slurm

