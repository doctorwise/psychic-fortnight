#include <ref_fib.h>
#include <recursive_fib.h>
#include <iterative_fib.h>

#include <stdio.h>

int main() {

  {
    printf(
      "\n\n======================================================================\n"
    );
    printf(
      "       TESTING ARM IMPLEMENTATION OF \"int recursive_fib(int n);\"\n"
    );
    printf(
      "======================================================================\n\n"
    );

    int numberOfTestsCompleted = 0;
    int numberOfPassingTests = 0;

    for (int n = -10; n <= 16; ++n) {
      int reference = ref_recursive_fib(n);
      int computed = recursive_fib(n);
      if (reference != computed) {
        printf(
          "  comparison test \033[1;31mFAILED\033[0m for n = %3d ",
          n
        );
      }
      else {
        printf(
          "  comparison test \033[1;32mPASSED\033[0m for n = %3d ",
          n
        );
        numberOfPassingTests++;
      }
      printf("(reference %3d vs. computed %3d)\n", reference, computed);
      numberOfTestsCompleted++;
    }

    printf(
      "\n======================================================================\n"
    );
    printf(
      "               Summary: %3d PASSED out of %3d COMPLETED\n",
      numberOfPassingTests,
      numberOfTestsCompleted
    );
    printf(
      "======================================================================\n\n"
    );
  }
  {
    printf(
      "\n\n======================================================================\n"
    );
    printf(
      "       TESTING ARM IMPLEMENTATION OF \"int iterative_fib(int n);\"\n"
    );
    printf(
      "======================================================================\n\n"
    );

    int numberOfTestsCompleted = 0;
    int numberOfPassingTests = 0;

    for (int n = -10; n <= 16; ++n) {
      int reference = ref_iterative_fib(n);
      int computed = iterative_fib(n);
      if (reference != computed) {
        printf(
          "  comparison test \033[1;31mFAILED\033[0m for n = %3d ",
          n
        );
      }
      else {
        printf(
          "  comparison test \033[1;32mPASSED\033[0m for n = %3d ",
          n
        );
        numberOfPassingTests++;
      }
      printf("(reference %3d vs. computed %3d)\n", reference, computed);
      numberOfTestsCompleted++;
    }

    printf(
      "\n======================================================================\n"
    );
    printf(
      "               Summary: %3d PASSED out of %3d COMPLETED\n",
      numberOfPassingTests,
      numberOfTestsCompleted
    );
    printf(
      "======================================================================\n\n"
    );
  }

  return 0;

}
