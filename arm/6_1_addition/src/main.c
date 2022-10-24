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

  int a = atoi(argv[1]);
  int b = atoi(argv[2]);

  printf(
    "The sum of %d and %d is %d\n",
    a,
    b,
    sum(a, b) 
  );

  return 0;
}
