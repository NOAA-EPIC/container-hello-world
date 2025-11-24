/* Program hello_mpi.c  */
#include <stdio.h>
#include <string.h>
#include <mpi.h>

int main(int argc, char **argv)
{
  char message[20];
  int  i, rank, size, tag = 99;
  MPI_Status status;

  // Get the name of the processor
  char processor_name[MPI_MAX_PROCESSOR_NAME];
  int name_len;

  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Get_processor_name(processor_name, &name_len);

  if (rank == 0)
  {
      strcpy(message, "Hello, world");
      for (i = 1; i < size; i++)
      {
        MPI_Send(message, 13, MPI_CHAR, i, tag, MPI_COMM_WORLD);

        // Print off a hello world message
        printf("%s sent to %d from processor %s, rank %d out of %d processors\n",
                message, i, processor_name, rank, size);
      }

      if ( 1 == size )
      {
        // Print off a hello world message
        printf("%s on rank %d at processor %s, rank %d out of %d processors\n",
                message, rank, processor_name, rank, size);
      }
  }
  else
  {
      MPI_Recv(message, 20, MPI_CHAR, 0, tag, MPI_COMM_WORLD, &status);

      // printf( "Message from process %d : %.13s\n", rank, message);

      // Print off a hello world message
      printf("%s received at processor %s, rank %d out of %d processors\n",
              message, processor_name, rank, size);
  }

  MPI_Finalize();
}

