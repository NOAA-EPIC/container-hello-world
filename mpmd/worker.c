// worker.c
#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int world_rank, world_size, tag = 0;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    // In this configuration, the worker will be Rank 1
    printf("[Worker %d] I am rank %d of %d (Executable: worker)\n", world_rank, world_rank, world_size);

    int received_data;
    // Receive from Master (Rank 0)
    MPI_Recv(&received_data, 1, MPI_INT, 0, tag, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
    
    printf("[Worker %d] Received %d. Processing...\n", world_rank, received_data);
    received_data = received_data * world_rank;

    // Send back to Master
    MPI_Send(&received_data, 1, MPI_INT, 0, tag, MPI_COMM_WORLD);

    MPI_Finalize();
    return 0;
}

