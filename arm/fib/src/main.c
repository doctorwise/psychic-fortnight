#include <ref_fib.h>
#include <ref_fibonacci_array.h>
#include <recursive_fib.h>
#include <iterative_fib.h>
#include <fibonacci_array.h>

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
  {
    printf(
      "\n\n======================================================================\n"
    );
    printf(
      "     TESTING ARM IMPLEMENTATION OF \"void fibonacci_array(int n);\"\n"
    );
    printf(
      "======================================================================\n\n"
    );
    
    int numberOfTestsCompleted = 0;
    int numberOfPassingTests = 0;

    int computed_out[27]; 
    int reference_out[27];

    fibonacci_array(computed_out, 27, -10); 
    ref_fibonacci_array(reference_out, 27, -10); 

    for (int n = 0; n < 27; ++n) {
      int reference = reference_out[n];
      int computed = computed_out[n];
      if (reference != computed) {
        printf(
          "  comparison test \033[1;31mFAILED\033[0m for n = %3d ",
          n - 10
        );
      }
      else {
        printf(
          "  comparison test \033[1;32mPASSED\033[0m for n = %3d ",
          n - 10
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
      "               Summary: %3d correct out of %3d entries\n",
      numberOfPassingTests,
      numberOfTestsCompleted
    );
    printf(
      "======================================================================\n\n"
    );
  }

  return 0;

}
