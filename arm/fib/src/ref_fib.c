#include <ref_fib.h>

// Recursive version
int ref_recursive_fib(int n) {
  // pathological or base cases
  if (n < -1) {
    return 0;
  }
  else if (n == -1) {
    return 1;
  }
  else if (n == 0) {
    return 0;
  }

  // inductive cases
  return ref_recursive_fib(n - 1) + ref_recursive_fib(n - 2);
}

int ref_iterative_fib(int n) {
  if (n < -1) {
    return 0;
  }
  else if (n == -1) {
    return 1;
  }
  else if (n == 0) {
    return 0;
  }

  int f = 1;
  int f_prev = 0;
  int old_f = 0;
  for (int idx = 1; idx < n; ++idx) {
    old_f = f;
    f = f + f_prev;
    f_prev = old_f;
  }
  return f;
}
