#include <sum.h>

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char ** argv) {

  if (argc != 3) {
    fprintf(
        stderr, 
        "USAGE: %s <a> <b>\n",
        argv[0]
    ); 
    exit(EXIT_FAILURE);
  }

  int arrayToBeSummed[2];
  arrayToBeSummed[0] = atoi(argv[1]);
  arrayToBeSummed[1] = atoi(argv[2]);

  printf(
    "The sum of %d and %d is %d\n",
    arrayToBeSummed[0],
    arrayToBeSummed[1],
    sum(arrayToBeSummed) 
  );

  return 0;
}
