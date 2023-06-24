#!/bin/bash
#PBS -l nodes=2:ppn=2
echo "
Preparing for a distributed job.
Mother superior is `hostname`.
Machine file is $PBS_NODEFILE
Contents of the machine file:
`cat $PBS_NODEFILE`
`cat $PBS_O_WORKDIR`
"
cd $PBS_O_WORKDIR


echo mpirun -machinefile $PBS_NODEFILE ./tsp-mpi ../run/input.dat 0.75 100 10000 0.1 10
mpirun -machinefile $PBS_NODEFILE ./tsp-mpi ../run/input.dat 0.75 100 10000 0.1 10

echo mpirun -np 2 -machinefile $PBS_NODEFILE ./tsp-mpi ../run/input.dat 0.75 100 10000 0.1 10
#mpirun -np 2 -machinefile $PBS_NODEFILE ./tsp-mpi ../run/input.dat 0.75 100 10000 0.1 10

echo mpirun -np 16 -machinefile $PBS_NODEFILE ./tsp-mpi ../run/input.dat 0.75 100 10000 0.1 10
#mpirun -np 16 -machinefile $PBS_NODEFILE ./tsp-mpi ../run/input.dat 0.75 100 10000 0.1 10

