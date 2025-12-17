// master.c
#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int world_rank, world_size, iproc, tag = 0;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    // We expect the master to be Rank 0 in this example
    if (world_rank == 0) {
        printf("[Master] I am rank %d of %d (Executable: master)\n", world_rank, world_size);

        int data_to_send = 100;
        int worker_rank = 1; // We assume the worker is the next rank
        int result;

	for (worker_rank = 1; worker_rank < world_size; worker_rank++)
	{
            printf("[Master] Sending data %d to worker (rank %d)...\n", data_to_send, worker_rank);
            MPI_Send(&data_to_send, 1, MPI_INT, worker_rank, tag, MPI_COMM_WORLD);

            MPI_Recv(&result, 1, MPI_INT, worker_rank, tag, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            printf("[Master] Received result %d from worker %d.\n", result, worker_rank);
        }
    }

    MPI_Finalize();
    return 0;
}

