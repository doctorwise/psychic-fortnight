#include <ref_fibonacci_array.h>

#include <ref_fib.h>

void ref_fibonacci_array(int * output_array, int number_of_entries, int starting_n) {
  for (int offset = 0; offset < number_of_entries; ++offset) {
    output_array[offset] = ref_iterative_fib(starting_n + offset);
  }
}
